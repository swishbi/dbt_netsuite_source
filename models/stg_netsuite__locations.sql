with source as (
      select * from {{ var('netsuite_locations') }}
),
renamed as (
    select
        fullname as location_full_name,
        id as location_id,
        lastmodifieddate as last_modified_date,
        mainaddress as main_address_id,
        name as location_name,
        parent as parent_id,
        subsidiary as subsidiary_id

        --The below macro adds the fields defined within your locations_pass_through_columns variable into the staging model
        {{ fivetran_utils.fill_pass_through_columns('locations_pass_through_columns') }}

    from source
)
select * from renamed
  