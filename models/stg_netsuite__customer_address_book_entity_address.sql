with source as (
      select * from {{ var('netsuite_customer_address_book_entity_address') }}
),
renamed as (
    select
        city as customer_city,
        country as customer_country,
        lastmodifieddate as last_modified_date,
        nkey as customer_address_book_address_id,
        state as customer_state,
        zip as customer_zip_code,
        _swishbi_id,
        _change_type,
        _commit_version,
        _commit_timestamp

    from source
)
select * from renamed
  