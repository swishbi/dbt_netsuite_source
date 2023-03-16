with locations as (
    select * from {{ ref('stg_netsuite__locations') }}
),
location_main_address as (
    select * from {{ ref('stg_netsuite__location_main_address') }}
),
joined as (

    select 
        locations.*,
        location_main_address.location_city,
        location_main_address.location_state,
        location_main_address.location_zip_code,
        location_main_address.location_country

    from locations

    left join location_main_address
        on locations.main_address_id = location_main_address.main_address_id
)
select * from joined