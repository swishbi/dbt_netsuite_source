{{ config(enabled=(var('netsuite__using_jobs', false))) }}

with source as (
      select * from {{ var('netsuite_job_types') }}
),
renamed as (
    select
        id as job_type_id,
        isinactive = 'T' as is_inactive,
        name as job_type_name,
        parent as parent_id

    from source
)
select * from renamed
  