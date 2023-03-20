with source as (
      select * from {{ var('netsuite_customer_address_books') }}
),
renamed as (
    select
        addressbookaddress as customer_address_book_address_id,
        entity as customer_id

    from source
)
select * from renamed
  