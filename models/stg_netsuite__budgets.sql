{{ config(enabled=(var('netsuite__using_budgets', false))) }}

with source as (
      select * from {{ source('netsuite', 'budgets') }}
),
renamed as (
    select
        account as account_id,
        {% if var('netsuite__multibook_accounting_enabled', false) %}
        accountingbook as accounting_book_id,
        {% endif %}
        {% if var('netsuite__multiple_budgets_enabled', false) %}
        category as budget_category_id,
        {% endif %}
        class as class_id,
        {% if var('netsuite__multiple_currencies_enabled', false) %}
        currency as currency_id,
        {% endif %}
        customer as customer_id,
        department as department_id,
        id as budget_id,
        item as item_id,
        location as location_id,
        subsidiary as subsidiary_id,
        total,
        year as year_id,
        _swishbi_id,
        _change_type,
        _commit_version,
        _commit_timestamp

    from source
)
select * from renamed
  