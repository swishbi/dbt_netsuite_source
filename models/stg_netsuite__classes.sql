with source as (
      select * from {{ var('netsuite_classes') }}
),
renamed as (
    select
        externalid as class_external_id,
        fullname as class_full_name,
        id as class_id,
        isinactive = 'T' as is_inactive,
        lastmodifieddate as last_modified_date,
        name as class_name

        --The below macro adds the fields defined within your classes_pass_through_columns variable into the staging model
        {{ fivetran_utils.fill_pass_through_columns('classes_pass_through_columns') }}

    from source
)
select * from renamed
  