with source as (
      select * from {{ var('netsuite_entity_address') }}
),
renamed as (
    select
        addr1 as address_1,
        addr2 as address_2,
        addr3 as address_3,
        addressee,
        addrtext as full_address,
        city,
        country,
        dropdownstate as state_abbreviated,
        lastmodifieddate as last_modified_date,
        nkey as entity_address_id,
        state,
        zip as zip_code,
        _swishbi_id,
        _change_type,
        _commit_version,
        _commit_timestamp

    from source
)
select * from renamed
  