{{ config(enabled=(var('netsuite__using_customer_categories', false))) }}

with source as (
      select * from {{ var('netsuite_customer_categories') }}
),
renamed as (
    select
        id as customer_category_id,
        name as customer_category_name

    from source
)
select * from renamed
