{{ config(enabled=(var('netsuite__using_budgets', false))) }}

with budgets as (
    select * from {{ ref('stg_netsuite__budgets') }}
),
{% if var('netsuite__multiple_budgets_enabled', false) %}
budget_categories as (
    select * from {{ ref('stg_netsuite__budget_categories') }}
),
{% endif %}
joined as (
    select
        budgets.*
        {% if var('netsuite__multiple_budgets_enabled', false) %}
        ,budget_categories.budget_category
        ,budget_categories.budget_type
        {% endif %}
    from budgets
    {% if var('netsuite__multiple_budgets_enabled', false) %}
    left join budget_categories
        on budget_categories.budget_category_id = budgets.budget_category_id
    {% endif %}
)
select * from joined