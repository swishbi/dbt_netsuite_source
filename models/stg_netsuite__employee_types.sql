with source as (
      select * from {{ var('netsuite_employee_types') }}
),
renamed as (
    select
        category as employee_type_category_id,
        id as employee_type_id,
        isinactive = 'T' as is_inactive,
        name as employee_type_name

    from source
)
select * from renamed
  