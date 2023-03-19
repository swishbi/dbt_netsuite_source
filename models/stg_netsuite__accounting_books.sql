{{ config(enabled=(var('netsuite__multibook_accounting_enabled', false))) }}

with source as (
      select * from {{ var('netsuite_accounting_books') }}
),
renamed as (
    select
        basebook as base_book_id,
        contingentrevenuehandling = 'T' as is_contingent_revenue_handling,
        effectiveperiod as effective_period_id,
        id as accounting_book_id,
        isadjustmentonly = 'T' as is_adjustment_only,
        isconsolidated = 'T' as is_consolidated,
        isprimary = 'T' as is_primary,
        lastmodifieddate as last_modified_date,
        name as accounting_book_name,
        twosteprevenueallocation = 'T' as is_two_step_revenue_allocation,
        _swishbi_id,
        _change_type,
        _commit_version,
        _commit_timestamp

    from source
)
select * from renamed
  