{{ config(enabled=(var('netsuite__using_jobs', false))) }}

with source as (
      select * from {{ var('netsuite_jobs') }}
),
renamed as (
    select
        altname as job_full_name,
        companyname as job_name,
        customer as customer_id,
        defaultbillingaddress as default_billing_address_id,
        defaultshippingaddress as default_shipping_address_id,
        entitystatus as job_status_id,
        externalid as job_external_id,
        id as job_id,
        jobtype as job_type_id,
        lastmodifieddate as last_modified_date,
        parent as parent_id,
        projectedenddate as projected_end_date,
        projectmanager as project_manager_id,
        startdate as start_date,

        concat('https://{{ var("netsuite_account_id", "123456") }}.app.netsuite.com/app/common/entity/custjob.nl?id=', id) as job_url_link

        --The below macro adds the fields defined within your jobs_pass_through_columns variable into the staging model
        {{ fivetran_utils.fill_pass_through_columns('jobs_pass_through_columns') }}

    from source
)
select * from renamed
  