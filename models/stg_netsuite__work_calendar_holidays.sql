{{ config(enabled=(var('netsuite__time_off_management_enabled', false))) }}

with source as (
      select * from {{ var('netsuite_work_calendar_holidays') }}
),
renamed as (
    select
        description as holiday_description,
        exceptiondate as exception_date,
        workcalendar as work_calendar_id

    from source
)
select * from renamed
  