with customers as (
    select * from {{ ref('stg_netsuite__customers') }}
),
entity_address as (
    select * from {{ ref('stg_netsuite__customer_address_book_entity_address') }}
),
employees as (
    select * from {{ ref('base_netsuite__employees') }}
),
joined as (
    
    select
        customers.*,
        entity_address.customer_city,
        entity_address.customer_state,
        entity_address.customer_zip_code,
        entity_address.customer_country,
        sales_rep.employee_name_last_first as sales_rep_name_last_first,
        sales_rep.employee_name_first_last as sales_rep_name_first_last,
        coalesce(parent_customer.company_name, customers.company_name) as parent_company_name,
        coalesce(parent_customer.customer_name, customers.customer_name) as parent_customer_name

    from customers
    
    left join entity_address 
        on coalesce(customers.default_billing_address_id, customers.default_shipping_address_id) = entity_address.customer_address_book_address_id
    
    left join employees as sales_rep 
        on sales_rep.employee_id = customers.sales_rep_id

    left join customers as parent_customer 
        on parent_customer.customer_id = customers.parent_id
)
select * from joined
