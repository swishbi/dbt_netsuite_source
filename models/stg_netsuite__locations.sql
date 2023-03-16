with source as (
      select * from {{ source('netsuite', 'location') }}
),
renamed as (
    select
        fullname as location_full_name,
        id as location_id,
        lastmodifieddate as last_modified_date,
        mainaddress as main_address_id,
        name as location_name,
        parent as parent_id,
        subsidiary as subsidiary_id,
        _swishbi_id,
        _change_type,
        _commit_version,
        _commit_timestamp

    from source
)
select * from renamed
  