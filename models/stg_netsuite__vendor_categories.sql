with source as (
      select * from {{ source('netsuite', 'vendorcategory') }}
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
  