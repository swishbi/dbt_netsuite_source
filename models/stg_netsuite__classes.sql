with source as (
      select * from {{ source('netsuite', 'classification') }}
),
renamed as (
    select
        externalid as class_external_id,
        fullname as class_full_name,
        id as class_id,
        isinactive = 'T' as is_inactive,
        lastmodifieddate as last_modified_date,
        name as class_name,
        _swishbi_id,
        _change_type,
        _commit_version,
        _commit_timestamp

    from source
)
select * from renamed
  