with accounting_periods as (
    select * from {{ ref('stg_netsuite__accounting_periods') }}
),
{% if var('netsuite__multiple_calendars_enabled', false) %}
accounting_period_fiscal_calendars as (
    select * from {{ ref('stg_netsuite__accounting_period_fiscal_calendars') }}
),
{% endif %}
joined as (

    select 
        accounting_periods.*
        {% if var('netsuite__multiple_calendars_enabled', false) %}
        ,accounting_period_fiscal_calendars.fiscal_calendar_id
        {% endif %}
    from accounting_periods
    {% if var('netsuite__multiple_calendars_enabled', false) %}
    left join accounting_period_fiscal_calendars
        on accounting_periods.accounting_period_id = accounting_period_fiscal_calendars.accounting_period_id
    {% endif %}
)
select * from joined