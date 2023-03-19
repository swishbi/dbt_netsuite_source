with source as (
      select * from {{ var('netsuite_location_main_address') }}
),
renamed as (
    select
        addr1 as location_address_1,
        addr2 as location_address_2,
        addr3 as location_address_3,
        addressee as location_addressee,
        addrtext as location_full_address,
        city as location_city,
        country as location_country,
        dropdownstate as location_state_abbreviated,
        lastmodifieddate as last_modified_date,
        nkey as main_address_id,
        state as location_state,
        zip as location_zip_code,
        _swishbi_id,
        _change_type,
        _commit_version,
        _commit_timestamp

    from source
)
select * from renamed
  