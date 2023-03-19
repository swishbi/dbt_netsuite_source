{{ config(enabled=(var('netsuite__advanced_revenue_management_enabled', false))) }}

with source as (
      select * from {{ var('netsuite_revenue_plan_types') }}
),
renamed as (
    select
        key as revenue_plan_type_id,
        name as revenue_plan_type_name

    from source
)
select * from renamed
  