{{ config(enabled=(var('netsuite__time_off_management_enabled', false))) }}

with source as (
      select * from {{ var('netsuite_time_off_types') }}
),
renamed as (
    select
        displayname as time_off_type_display_name,
        id as time_off_type_id,
        incrementunit as increment_unit,
        minimumincrement as minimum_increment,
        name as time_off_type_name

    from source
)
select * from renamed
  