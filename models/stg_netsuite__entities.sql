with source as (
      select * from {{ source('netsuite', 'entity') }}
),
renamed as (
    select
        contact as contact_id,
        customer as customer_id,
        employee as employee_id,
        entityid as entity_name,
        entitynumber as entity_number,
        entitytitle as entity_title,
        id as entity_id,
        isperson as is_person,
        lastmodifieddate as last_modified_date,
        parent as parent_id,
        project as project_id,
        toplevelparent as top_level_parent_id,
        type as entity_type,
        vendor as vendor_id,
        _swishbi_id,
        _change_type,
        _commit_version,
        _commit_timestamp,

        concat('https://{{ var("netsuite_account_id") }}.app.netsuite.com/app/common/entity', lower(type), '.nl?id=', id) as entity_url_link

    from source
)
select * from renamed
  