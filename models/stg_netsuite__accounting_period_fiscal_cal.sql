with source as (
      select * from {{ source('netsuite', 'accountingperiodfiscalcalendars') }}
),
renamed as (
    select
        accountingperiod as accounting_period_id,
        fiscalcalendar as fiscal_calendar_id,
        parent as parent_id,
        _swishbi_id,
        _change_type,
        _commit_version,
        _commit_timestamp

    from source
)
select * from renamed
  