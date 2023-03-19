{{ config(enabled=(var('netsuite__using_jobs', false) and var('netsuite__advanced_jobs_enabled', false))) }}

with source as (
      select * from {{ var('netsuite_job_resources') }}
),
renamed as (
    select
        jobresource as job_resource_id,
        project as project_id,
        role as job_resource_role,
        _swishbi_id,
        _change_type,
        _commit_version,
        _commit_timestamp

    from source
)
select * from renamed
  