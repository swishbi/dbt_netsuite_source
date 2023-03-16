with items as (
    select * from {{ ref('stg_netsuite__items') }}
),
item_types as (
    select * from {{ ref('stg_netsuite__item_types') }}
),
joined as (
    
    select
        items.*,
        item_types.item_type_name,
        item_types.item_type_sequence
        
    from items

    left join item_types
        on item_types.item_type_id = items.item_type_id
)
select * from joined