with source as (
      select * from {{ var('netsuite_item_types') }}
),
renamed as (
    select
        id as item_type_id,
        internalid as item_type_internal_id,
        name as item_type_name,
        sequence as item_type_sequence

    from source
)
select * from renamed
  