{{ config(enabled=(var('netsuite__advanced_inventory_management_enabled', false))) }}

with source as (
      select * from {{ var('netsuite_bins') }}
),
renamed as (
    select
        id as bin_id,
        binnumber as bin_number,
        location as location_id,
        isinactive = "T" as is_inactive,
        lastmodifieddate as last_modified_date

    from source
)
select * from renamed
