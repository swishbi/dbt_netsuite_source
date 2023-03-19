{{ config(enabled=(var('netsuite__multiple_calendars_enabled', false))) }}

with source as (
      select * from {{ var('netsuite_accounting_period_fiscal_calendars') }}
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
  