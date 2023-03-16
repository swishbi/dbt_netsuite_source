with source as (
      select * from {{ source('netsuite', 'accountingperiod') }}
),
renamed as (
    select
        alllocked as is_all_locked,
        aplocked as is_ap_locked,
        arlocked as is_ar_locked,
        closed as is_closed,
        closedondate as closed_on_date,
        enddate as ending_at,
        -- fiscalcalendar as fiscal_calendar_id,
        id as accounting_period_id,
        isadjust as is_adjustment,
        isposting as is_posting,
        isquarter as is_quarter,
        isyear as is_year,
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
  