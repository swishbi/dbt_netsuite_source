{{ config(enabled=(var('netsuite__using_budgets', false) and var('netsuite__multiple_budgets_enabled', false))) }}

with source as (
      select * from {{ var('netsuite_budget_categories') }}
),
renamed as (
    select
        budgettype as budget_type,
        id as budget_category_id,
        isinactive = 'T' as is_inactive,
        name as budget_category

    from source
)
select * from renamed
  