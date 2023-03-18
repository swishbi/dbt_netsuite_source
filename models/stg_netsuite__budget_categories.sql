{{ config(enabled=(var('netsuite__using_budgets', false) and var('netsuite__multiple_budgets_enabled', false))) }}

with source as (
      select * from {{ source('netsuite', 'budgetcategory') }}
),
renamed as (
    select
        budgettype as budget_type,
        id as budget_category_id,
        isinactive = 'T' as is_inactive,
        name as budget_category,
        _swishbi_id,
        _change_type,
        _commit_version,
        _commit_timestamp

    from source
)
select * from renamed
  