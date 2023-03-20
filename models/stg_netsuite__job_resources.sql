{{ config(enabled=(var('netsuite__using_jobs', false) and var('netsuite__advanced_jobs_enabled', false))) }}

with source as (
      select * from {{ var('netsuite_job_resources') }}
),
renamed as (
    select
        jobresource as job_resource_id,
        project as project_id,
        role as job_resource_role

    from source
)
select * from renamed
  