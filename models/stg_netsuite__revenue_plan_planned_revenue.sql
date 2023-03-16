{{ config(enabled=(var('netsuite__advanced_revenue_management_enabled', false))) }}

with source as (
      select * from {{ source('netsuite', 'revenueplanplannedrevenue') }}
),
renamed as (
    select
        {{ adapter.quote("amount") }},
        {{ adapter.quote("dateexecuted") }} as date_executed,
        {{ adapter.quote("deferredrevenueaccount") }} as deferred_revenue_account_id,
        {{ adapter.quote("exchangerate") }} as exchange_rate,
        {{ adapter.quote("id") }} as revenue_plan_planned_revenue_id,
        {{ adapter.quote("isrecognized") }} as is_recognized,
        {{ adapter.quote("journal") }} as journal_entry_id,
        {{ adapter.quote("percentrecognizedinperiod") }} as percent_recognized_in_period,
        {{ adapter.quote("percenttotalrecognized") }} as percent_total_recognized,
        {{ adapter.quote("periodcomments") }} as preiod_comments,
        {{ adapter.quote("plannedperiod") }} as planned_accounting_period_id,
        {{ adapter.quote("plannedrevenuetype") }} as planned_revenue_type_id,
        {{ adapter.quote("postingperiod") }} as posting_accounting_period_id,
        {{ adapter.quote("recognitionaccount") }} as recognition_account_id,
        {{ adapter.quote("revenueplan") }} as revenue_plan_id,
        {{ adapter.quote("totalrecognized") }} as total_recognized,
        {{ adapter.quote("_swishbi_id") }},
        {{ adapter.quote("_change_type") }},
        {{ adapter.quote("_commit_version") }},
        {{ adapter.quote("_commit_timestamp") }}

    from source
)
select * from renamed
  