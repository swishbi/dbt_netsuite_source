with vendors as (
    select * from {{ ref('stg_netsuite__vendors') }}
),
{% if var('netsuite__using_vendor_categories', false) %}
vendor_categories as (
    select * from {{ ref('stg_netsuite__vendor_categories') }}
),
{% endif %}
joined as (
    select
        vendors.*
        {% if var('netsuite__using_vendor_categories', false) %}
        ,vendor_categories.vendor_category_name
        {% endif %}
    from vendors
    {% if var('netsuite__using_vendor_categories', false) %}
    left join vendor_categories 
        on vendor_categories.vendor_category_id = vendors.vendor_category_id
    {% endif %}
)
select * from joined