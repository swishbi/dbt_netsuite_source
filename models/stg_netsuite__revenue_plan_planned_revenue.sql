{{ config(enabled=(var('netsuite__advanced_revenue_management_enabled', false))) }}

with source as (
      select * from {{ var('netsuite_revenue_plan_planned_revenue') }}
),
renamed as (
    select
        amount,
        dateexecuted as date_executed,
        deferredrevenueaccount as deferred_revenue_account_id,
        {% if var('netsuite__multiple_currencies_enabled', false) %}
        exchangerate as exchange_rate,
        {% endif %}
        id as revenue_plan_planned_revenue_id,
        isrecognized = 'T' as is_recognized,
        journal as journal_entry_id,
        percentrecognizedinperiod as percent_recognized_in_period,
        percenttotalrecognized as percent_total_recognized,
        periodcomments as preiod_comments,
        plannedperiod as planned_accounting_period_id,
        plannedrevenuetype as planned_revenue_type_id,
        postingperiod as posting_accounting_period_id,
        recognitionaccount as recognition_account_id,
        revenueplan as revenue_plan_id,
        totalrecognized as total_recognized

    from source
)
select * from renamed
  