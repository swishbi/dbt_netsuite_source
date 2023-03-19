{{ config(enabled=(var('netsuite__using_jobs', false))) }}

with source as (
      select * from {{ var('netsuite_job_statuses') }}
),
renamed as (
    select
        description as job_status_description,
        id as job_status_id,
        isinactive = 'T' as is_inactive,
        name as job_status_name

    from source
)
select * from renamed
  