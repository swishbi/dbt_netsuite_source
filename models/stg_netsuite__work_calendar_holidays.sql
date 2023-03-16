with source as (
      select * from {{ source('netsuite', 'workcalendarholiday') }}
),
renamed as (
    select
        description as holiday_description,
        exceptiondate as exception_date,
        workcalendar as work_calendar_id,
        _swishbi_id,
        _change_type,
        _commit_version,
        _commit_timestamp

    from source
)
select * from renamed
  