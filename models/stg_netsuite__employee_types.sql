with source as (
      select * from {{ source('netsuite', 'employeetype') }}
),
renamed as (
    select
        category as employee_type_category_id,
        id as employee_type_id,
        isinactive as is_inactive,
        name as employee_type_name,
        _swishbi_id,
        _change_type,
        _commit_version,
        _commit_timestamp

    from source
)
select * from renamed
  