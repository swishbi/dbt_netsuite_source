with source as (
      select * from {{ var('netsuite_transactions') }}
),
renamed as (
    select
        closedate as transaction_closed_date,
        createddate as transaction_created_date,
        {% if var('netsuite__multiple_currencies_enabled', false) %}
        currency as currency_id,
        {% endif %}
        duedate as transaction_due_date,
        employee as employee_id,
        entity as entity_id,
        expectedclosedate as transaction_expected_close_date,
        id as transaction_id,
        intercoadj = 'T' as is_transaction_intercompany_adjustment,
        isreversal = 'T' as is_transaction_reversal,
        lastmodifieddate as last_modified_date,
        memo as transaction_memo,
        posting = 'T' as is_posting,
        postingperiod as accounting_period_id,
        status as transaction_status_id,
        trandate as transaction_date,
        tranid as transaction_name,
        transactionnumber as transaction_number,
        type as transaction_type,
        voided = 'T' as is_transaction_voided,
        _swishbi_id,
        _change_type,
        _commit_version,
        _commit_timestamp,

        concat('https://{{ var("netsuite_account_id", "123456") }}.app.netsuite.com/app/accounting/transactions/', lower(type), '.nl?id=', id) as transaction_url_link,
        concat(type,'_',id) as reference_id

    from source
)
select * from renamed
  