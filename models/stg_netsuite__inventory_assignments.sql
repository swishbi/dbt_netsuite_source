{{ config(enabled=(var('netsuite__advanced_inventory_management_enabled', false))) }}

with source as (
      select * from {{ var('netsuite_inventory_assignments') }}
),
renamed as (
    select
        id as inventory_assignment_id,
        bin as bin_id,
        transaction as transaction_id,
        transactionline as transaction_line_id,
        quantity

    from source
)
select * from renamed
