{{ config(enabled=(var('netsuite__using_jobs', false))) }}

with source as (
      select * from {{ source('netsuite', 'jobstatus') }}
),
renamed as (
    select
        description as job_status_description,
        id as job_status_id,
        isinactive = 'T' as is_inactive,
        name as job_status_name,
        _swishbi_id,
        _change_type,
        _commit_version,
        _commit_timestamp

    from source
)
select * from renamed
  