with vendors as (
    select * from {{ ref('stg_netsuite__vendors') }}
),
vendor_categories as (
    select * from {{ ref('stg_netsuite__vendor_categories') }}
),
joined as (
    select
        vendors.*,
        vendor_categories.vendor_category_name
        
    from vendors
    
    left join vendor_categories 
        on vendor_categories.vendor_category_id = vendors.vendor_category_id
)
select * from joined