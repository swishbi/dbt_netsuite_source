{{ config(enabled=(var('netsuite__advanced_jobs_enabled', true))) }}

with source as (
      select * from {{ source('netsuite', 'projecttask') }}
),
renamed as (
    select
        actualwork as actual_work,
        fullname as project_task_full_name,
        id as project_task_id,
        issummarytask as is_summary_task,
        nonbillabletask as is_non_billable_task,
        parent as parent_id,
        plannedwork as planned_work,
        project as project_id,
        remainingwork as remaining_work,
        startdatetime as project_task_start_date,
        status as project_task_status,
        title as project_task_name,
        _swishbi_id,
        _change_type,
        _commit_version,
        _commit_timestamp

    from source
)
select * from renamed
  