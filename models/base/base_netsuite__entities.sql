with entities as (
    select * from {{ ref('stg_netsuite__entities') }}
),
joined as (
    select
        entities.*
    
    from entities
)
select * from joined