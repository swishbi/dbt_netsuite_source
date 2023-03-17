with source as (
      select * from {{ source('netsuite', 'vendor') }}
),
renamed as (
    select
        category as vendor_category_id,
        companyname as vendor_name,
        datecreated as vendor_create_date,
        id as vendor_id,
        lastmodifieddate as last_modified_date,
        _swishbi_id,
        _change_type,
        _commit_version,
        _commit_timestamp,

        concat('https://{{ var("netsuite_account_id", "123456") }}.app.netsuite.com/app/common/entity/vendor.nl?id=', id) as vendor_url_link

    from source
)
select * from renamed
  