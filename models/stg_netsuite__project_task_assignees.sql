{{ config(enabled=(var('netsuite__using_jobs', false) and var('netsuite__advanced_jobs_enabled', false))) }}

with source as (
      select * from {{ var('netsuite_project_task_assignees') }}
),
renamed as (
    select
        estimatedwork as estimated_work,
        {% if var('netsuite__planned_work_enabled', false) %}
        plannedwork as planned_work,
        {% endif %}
        projecttask as project_task_id,
        resource as resource_id,
        serviceitem as service_item_id,
        unitcost as unit_cost,
        unitprice as unit_price,
        _swishbi_id,
        _change_type,
        _commit_version,
        _commit_timestamp

    from source
)
select * from renamed
  