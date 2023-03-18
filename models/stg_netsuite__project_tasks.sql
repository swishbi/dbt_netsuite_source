{{ config(enabled=(var('netsuite__using_jobs', false) and var('netsuite__advanced_jobs_enabled', false))) }}

with source as (
      select * from {{ source('netsuite', 'projecttask') }}
),
renamed as (
    select
        actualwork as actual_work,
        fullname as project_task_full_name,
        id as project_task_id,
        issummarytask = 'T' as is_summary_task,
        nonbillabletask = 'T' as is_non_billable_task,
        parent as parent_id,
        {% if var('netsuite__planned_work_enabled', false) %}
        plannedwork as planned_work,
        {% endif %}
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
  