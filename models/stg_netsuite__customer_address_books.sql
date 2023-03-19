with source as (
      select * from {{ var('netsuite_customer_address_books') }}
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
  