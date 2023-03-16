with source as (
      select * from {{ source('netsuite', 'jobtype') }}
),
renamed as (
    select
        id as job_type_id,
        isinactive as is_inactive,
        name as job_type_name,
        parent as parent_id,
        _swishbi_id,
        _change_type,
        _commit_version,
        _commit_timestamp

    from source
)
select * from renamed
  