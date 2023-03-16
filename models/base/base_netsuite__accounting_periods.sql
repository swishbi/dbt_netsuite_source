with accounting_periods as (
    select * from {{ ref('stg_netsuite__accounting_periods') }}
),
accounting_period_fiscal_calendars as (
    select * from {{ ref('stg_netsuite__accounting_period_fiscal_cal') }}
),
joined as (

    select 
        accounting_periods.*,
        accounting_period_fiscal_calendars.fiscal_calendar_id

    from accounting_periods
    
    left join accounting_period_fiscal_calendars
        on accounting_periods.accounting_period_id = accounting_period_fiscal_calendars.accounting_period_id
)
select * from joined