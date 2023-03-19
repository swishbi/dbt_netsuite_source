with source as (
      select * from {{ var('netsuite_employee_status_categories') }}
),
renamed as (
    select
        key as employee_status_category_id,
        name as employee_status_category_name

    from source
)
select * from renamed
  