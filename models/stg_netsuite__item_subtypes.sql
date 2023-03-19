with source as (
      select * from {{ var('netsuite_item_subtypes') }}
),
renamed as (
    select
        key as item_sub_type_id,
        name as item_sub_type_name

    from source
)
select * from renamed
  