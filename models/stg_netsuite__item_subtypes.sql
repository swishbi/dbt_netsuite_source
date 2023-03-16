with source as (
      select * from {{ source('netsuite', 'itemsubtype') }}
),
renamed as (
    select
        key as item_sub_type_id,
        name as item_sub_type_name,
        _swishbi_id,
        _change_type,
        _commit_version,
        _commit_timestamp

    from source
)
select * from renamed
  