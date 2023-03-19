{{ config(enabled=(var('netsuite__advanced_billing_enabled', false))) }}

with source as (
      select * from {{ var('netsuite_billing_schedule_types') }}
),
renamed as (
    select
        id as billing_schedule_type_id,
        name as billing_schedule_type_name

    from source
)
select * from renamed
  