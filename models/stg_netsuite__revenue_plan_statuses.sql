{{ config(enabled=(var('netsuite__advanced_revenue_management_enabled', false))) }}

with source as (
      select * from {{ var('netsuite_revenue_plan_statuses') }}
),
renamed as (
    select
        key as revenue_plan_status_id,
        name as revenue_plan_status_name

    from source
)
select * from renamed
  