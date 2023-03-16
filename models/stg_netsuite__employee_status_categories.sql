with source as (
      select * from {{ source('netsuite', 'employeestatuscategory') }}
),
renamed as (
    select
        key as employee_status_category_id,
        name as employee_status_category_name,
        _swishbi_id,
        _change_type,
        _commit_version,
        _commit_timestamp

    from source
)
select * from renamed
  