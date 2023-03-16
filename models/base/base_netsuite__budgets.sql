{{ config(enabled=(var('netsuite__using_budgets', false))) }}

with budgets as (
    select * from {{ ref('stg_netsuite__budgets') }}
),
budget_categories as (
    select * from {{ ref('stg_netsuite__budget_categories') }}
),
joined as (
    select
        budgets.*,
        budget_categories.budget_category,
        budget_categories.budget_type

    from budgets

    left join budget_categories
        on budget_categories.budget_category_id = budgets.budget_category_id
)
select * from joined