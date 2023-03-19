{{ config(enabled=(var('netsuite__using_budgets', false))) }}

with source as (
      select * from {{ var('netsuite_budgets_machine') }}
),
renamed as (
    select
        amount,
        budget as budget_id,
        period as accounting_period_id,
        _swishbi_id,
        _change_type,
        _commit_version,
        _commit_timestamp

    from source
)
select * from renamed
  