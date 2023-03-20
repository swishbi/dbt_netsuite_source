with source as (
      select * from {{ var('netsuite_customers') }}
),
renamed as (
    select
        companyname as company_name,
        {% if var('netsuite__multiple_currencies_enabled', false) %}
        currency as currency_id,
        {% endif %}
        defaultbillingaddress as default_billing_address_id,
        defaultshippingaddress as default_shipping_address_id,
        email as customer_email_address,
        entityid as entity_id,
        externalid as customer_external_id,
        firstname as customer_first_name,
        firstorderdate as customer_first_order_date,
        id as customer_id,
        isperson = 'T' as is_person,
        lastmodifieddate as last_modified_date,
        lastname as customer_last_name,
        parent as parent_id,
        phone as customer_phone_number,
        receivablesaccount as receivables_account_id,
        salesrep as sales_rep_id,

        coalesce(companyname, concat_ws(', ', lastname, firstname)) as customer_name,
        concat_ws(', ', lastname, firstname) as customer_name_last_first,
        concat_ws(' ', firstname, lastname) as customer_name_fist_last,
        concat('https://{{ var("netsuite_account_id", "123456") }}.app.netsuite.com/app/common/entity/custjob.nl?id=', id) as customer_url_link

        --The below macro adds the fields defined within your customers_pass_through_columns variable into the staging model
        {{ fivetran_utils.fill_pass_through_columns('customers_pass_through_columns') }}

    from source
)
select * from renamed
  