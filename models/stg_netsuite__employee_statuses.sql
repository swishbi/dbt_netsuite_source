with source as (
      select * from {{ var('netsuite_employee_statuses') }}
),
renamed as (
    select
        category as employee_status_category_id,
        id as employee_status_id,
        isinactive = 'T' as is_inactive,
        name as employee_status_name

    from source
)
select * from renamed
  