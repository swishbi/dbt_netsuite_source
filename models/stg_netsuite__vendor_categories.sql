{{ config(enabled=(var('netsuite__using_vendor_categories', false))) }}

with source as (
      select * from {{ var('netsuite_vendor_categories') }}
),
renamed as (
    select
        id as vendor_category_id,
        lastmodifieddate as last_modified_date,
        name as vendor_category_name,
        _swishbi_id,
        _change_type,
        _commit_version,
        _commit_timestamp

    from source
)
select * from renamed
  