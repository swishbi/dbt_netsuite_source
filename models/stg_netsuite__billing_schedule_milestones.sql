{{ config(enabled=(var('netsuite__advanced_billing_enabled', false))) }}

with source as (
      select * from {{ var('netsuite_billing_schedule_milestones') }}
),
renamed as (
    select
        billingschedule as billing_schedule_id,
        comments,
        milestoneactualcompletiondate as milestone_actual_completion_date,
        milestoneamount as milestone_amount,
        milestonecompleted = 'T' as is_milestone_completed,
        milestonedate as milestone_date,
        milestoneterms as milestone_term_id,
        projecttask as project_task_id

    from source
)
select * from renamed
  