with source as (
      select * from {{ var('netsuite_entities') }}
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
        isperson = 'T' as is_person,
        lastmodifieddate as last_modified_date,
        parent as parent_id,
        {% if var('netsuite__using_jobs', false) %}
        project as project_id,
        {% endif %}
        toplevelparent as top_level_parent_id,
        type as entity_type,
        vendor as vendor_id,

        concat('https://{{ var("netsuite_account_id", "123456") }}.app.netsuite.com/app/common/entity', lower(type), '.nl?id=', id) as entity_url_link

        --The below macro adds the fields defined within your entities_pass_through_columns variable into the staging model
        {{ fivetran_utils.fill_pass_through_columns('entities_pass_through_columns') }}

    from source
)
select * from renamed
  