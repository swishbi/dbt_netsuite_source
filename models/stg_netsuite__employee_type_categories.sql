with source as (
      select * from {{ source('netsuite', 'employeetypecategory') }}
),
renamed as (
    select
        key as employee_type_category_id,
        name as employee_type_category_name,
        _swishbi_id,
        _change_type,
        _commit_version,
        _commit_timestamp

    from source
)
select * from renamed
  