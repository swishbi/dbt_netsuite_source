{{ config(enabled=(var('netsuite__advanced_jobs_enabled', true))) }}

with source as (
      select * from {{ source('netsuite', 'projecttaskassignee') }}
),
renamed as (
    select
        estimatedwork as estimated_work,
        plannedwork as planned_work,
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
  