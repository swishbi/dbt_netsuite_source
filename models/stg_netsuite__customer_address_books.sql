with source as (
      select * from {{ source('netsuite', 'customeraddressbook') }}
),
renamed as (
    select
        addressbookaddress as customer_address_book_address_id,
        entity as customer_id,
        _swishbi_id,
        _change_type,
        _commit_version,
        _commit_timestamp

    from source
)
select * from renamed
  