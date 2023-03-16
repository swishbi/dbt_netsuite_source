with source as (
      select * from {{ source('netsuite', 'itemtype') }}
),
renamed as (
    select
        id as item_type_id,
        internalid as item_type_internal_id,
        name as item_type_name,
        sequence as item_type_sequence,
        _swishbi_id,
        _change_type,
        _commit_version,
        _commit_timestamp

    from source
)
select * from renamed
  