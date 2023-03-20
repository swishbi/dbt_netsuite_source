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

        --The below macro adds the fields defined within your departments_pass_through_columns variable into the staging model
        {{ fivetran_utils.fill_pass_through_columns('departments_pass_through_columns') }}

    from source
)
select * from renamed
  