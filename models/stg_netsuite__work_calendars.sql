{{ config(enabled=(var('netsuite__time_off_management_enabled', false))) }}

with source as (
      select * from {{ source('netsuite', 'workcalendar') }}
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
        workhoursperday as work_hours_per_day,
        _swishbi_id,
        _change_type,
        _commit_version,
        _commit_timestamp

    from source
)
select * from renamed
  