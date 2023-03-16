with consolidated_exchange_rates as (
    select * from {{ ref('stg_netsuite__consolidated_exchange_rates') }}
),
accounting_book_subsidiaries as (
    select * from {{ ref('stg_netsuite__accounting_book_subsidiaries') }}
),
joined as (

    select 
        consolidated_exchange_rates.*,
        accounting_book_subsidiaries.accounting_book_id

    from consolidated_exchange_rates

    left join accounting_book_subsidiaries
        on consolidated_exchange_rates.to_subsidiary_id = accounting_book_subsidiaries.subsidiary_id
)
select * from joined