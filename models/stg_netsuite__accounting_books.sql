{{ config(enabled=(var('netsuite__multibook_accounting_enabled', true))) }}

with source as (
      select * from {{ source('netsuite', 'accountingbook') }}
),
renamed as (
    select
        basebook as base_book_id,
        contingentrevenuehandling as is_contingent_revenue_handling,
        effectiveperiod as effective_period_id,
        id as accounting_book_id,
        isadjustmentonly as is_adjustment_only,
        isconsolidated as is_consolidated,
        isprimary as is_primary,
        lastmodifieddate as last_modified_date,
        name as accounting_book_name,
        twosteprevenueallocation as is_two_step_revenue_allocation,
        _swishbi_id,
        _change_type,
        _commit_version,
        _commit_timestamp

    from source
)
select * from renamed
  