{{ config(enabled=(var('netsuite__multiple_currencies_enabled', false))) }}

with source as (
      select * from {{ var('netsuite_currencies') }}
),
renamed as (
    select
        id as currency_id,
        lastmodifieddate as last_modified_date,
        name as currency_name,
        symbol as currency_symbol

    from source
)
select * from renamed
  