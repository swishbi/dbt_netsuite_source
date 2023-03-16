with transactions as (
    select * from {{ ref('stg_netsuite__transactions') }}
),
transaction_statuses as (
    select * from {{ ref('stg_netsuite__transaction_statuses') }}
),
joined as (

    select
        transactions.*,
        transaction_statuses.transaction_status_name,
        transaction_statuses.transaction_status_full_name

    from transactions

    left join transaction_statuses
        on transaction_statuses.transaction_status_id = transactions.transaction_status_id
        and transaction_statuses.transaction_type = transactions.transaction_type
)
select * from joined