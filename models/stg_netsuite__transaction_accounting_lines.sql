with source as (
      select * from {{ var('netsuite_transaction_accounting_lines') }}
),
renamed as (
    select
        account as account_id,
        accountingbook as accounting_book_id,
        amount,
        amountpaid as paid_amount,
        amountunpaid as unpaid_amount,
        credit as credit_amount,
        debit as debit_amount,
        netamount as net_amount,
        posting = 'T' as is_posting,
        transaction as transaction_id,
        transactionline as transaction_line_id

    from source
)
select * from renamed
  