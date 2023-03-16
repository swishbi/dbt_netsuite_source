{{ config(enabled=(var('netsuite__advanced_billing_enabled', false))) }}

with source as (
      select * from {{ source('netsuite', 'billingschedulemilestone') }}
),
renamed as (
    select
        {{ adapter.quote("billingschedule") }} as billing_schedule_id,
        {{ adapter.quote("comments") }},
        {{ adapter.quote("milestoneactualcompletiondate") }} as milestone_actual_completion_date,
        {{ adapter.quote("milestoneamount") }} as milestone_amount,
        {{ adapter.quote("milestonecompleted") }} as is_milestone_completed,
        {{ adapter.quote("milestonedate") }} as milestone_date,
        {{ adapter.quote("milestoneterms") }} as milestone_term_id,
        {{ adapter.quote("projecttask") }} as project_task_id,
        {{ adapter.quote("_swishbi_id") }},
        {{ adapter.quote("_change_type") }},
        {{ adapter.quote("_commit_version") }},
        {{ adapter.quote("_commit_timestamp") }}

    from source
)
select * from renamed
  