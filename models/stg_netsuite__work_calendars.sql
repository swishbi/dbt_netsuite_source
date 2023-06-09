{{ config(enabled=(var('netsuite__time_off_management_enabled', false))) }}

with source as (
      select * from {{ var('netsuite_work_calendars') }}
),
renamed as (
    select
        friday,
        id as work_calendar_id,
        monday,
        saturday,
        sunday,
        thursday,
        tuesday,
        wednesday,
        workhoursperday as work_hours_per_day

    from source
)
select * from renamed
  