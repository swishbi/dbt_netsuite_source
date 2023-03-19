with source as (
      select * from {{ var('netsuite_vendors') }}
),
renamed as (
    select
        category as vendor_category_id,
        companyname as vendor_name,
        datecreated as vendor_create_date,
        id as vendor_id,
        lastmodifieddate as last_modified_date,

        concat('https://{{ var("netsuite_account_id", "123456") }}.app.netsuite.com/app/common/entity/vendor.nl?id=', id) as vendor_url_link

        --The below macro adds the fields defined within your vendors_pass_through_columns variable into the staging model
        {{ fivetran_utils.fill_pass_through_columns('vendors_pass_through_columns') }}

    from source
)
select * from renamed
  