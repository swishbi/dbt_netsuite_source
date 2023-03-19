with source as (
      select * from {{ var('netsuite_departments') }}
),
renamed as (
    select
        fullname as department_full_name,
        id as department_id,
        isinactive = 'T' as is_inactive,
        lastmodifieddate as last_modified_date,
        name as department_name,
        parent as parent_id,
        subsidiary as subsidiary_id

    from source
)
select * from renamed
  