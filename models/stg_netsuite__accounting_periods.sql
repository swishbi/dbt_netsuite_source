with source as (
      select * from {{ source('netsuite', 'accountingperiod') }}
),
renamed as (
    select
        alllocked = 'T' as is_all_locked,
        aplocked = 'T' as is_ap_locked,
        arlocked = 'T' as is_ar_locked,
        closed = 'T' as is_closed,
        closedondate as closed_on_date,
        enddate as ending_at,
        {% if var('netsuite__multiple_calendars_enabled', false) %}
        fiscalcalendar as fiscal_calendar_id,
        {% endif %}
        id as accounting_period_id,
        isadjust = 'T' as is_adjustment,
        isposting = 'T' as is_posting,
        isquarter = 'T' as is_quarter,
        isyear = 'T' as is_year,
        lastmodifieddate as last_modified_date,
        parent as parent_id,
        periodname as accounting_period_name,
        startdate as starting_at,
        _swishbi_id,
        _change_type,
        _commit_version,
        _commit_timestamp

    from source
)
select * from renamed
  