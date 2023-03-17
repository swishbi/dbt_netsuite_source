with source as (
      select * from {{ source('netsuite', 'accounttype') }}
),
renamed as (
    select
        balancesheet = 'T' as is_balancesheet,
        id as account_type_id,
        {%- if target.type == 'bigquery' -%}
        `left` 
        {%- elif target.type == 'snowflake' -%}
        "LEFT"
        {%- elif target.type in ('redshift', 'postgres') -%}
        "left" 
        {%- else -%}
        left
        {%- endif -%} = 'T' as is_leftside,
        longname as account_type_name,
        _swishbi_id,
        _change_type,
        _commit_version,
        _commit_timestamp,

        lower(longname) like 'accounts payable%' as is_accounts_payable,
        lower(longname) like 'accounts receivable%' as is_accounts_receivable,
        lower(longname) like '%expense' as is_expense_account, -- includes deferred expense
        lower(longname) like '%income' as is_income_account,

        case
            when lower(longname) in (
                'income',
                'other income',
                'expense',
                'other expense',
                'other income',
                'cost of goods sold'
            ) then true
            else false 
        end as is_income_statement,
        
        case
            when lower(longname) = 'bank' then 1
            when lower(longname) = 'accounts receivable' then 2
            when lower(longname) = 'unbilled receivable' then 3
            when lower(longname) = 'other current asset' then 4
            when lower(longname) = 'fixed asset' then 5
            when lower(longname) = 'other asset' then 6
            when lower(longname) = 'deferred expense' then 7
            when lower(longname) = 'accounts payable' then 8
            when lower(longname) = 'credit card' then 9
            when lower(longname) = 'other current liability' then 10
            when lower(longname) = 'long term liability' then 11
            when lower(longname) = 'deferred revenue' then 12
            when lower(longname) = 'equity' then 13
            when lower(longname) = 'income' then 14
            when lower(longname) = 'cost of goods sold' then 15
            when lower(longname) = 'expense' then 16
            when lower(longname) = 'other income' then 17
            when lower(longname) = 'other expense' then 18
            when not balancesheet then 19
            else null
        end as account_type_sort_helper,
            
        case
            when lower(longname) in ('accounts receivable', 'bank', 'deferred expense', 'fixed asset', 'other asset', 'other current asset', 'unbilled receivable') then 'Asset'
            when lower(longname) in ('cost of goods sold', 'expense', 'other expense') then 'Expense'
            when lower(longname) in ('income', 'other income') then 'Income'
            when lower(longname) in ('accounts payable', 'credit card', 'deferred revenue', 'long term liability', 'other current liability') then 'Liability'
            when lower(longname) in ('equity', 'retained earnings', 'net income') then 'Equity'
            else null
        end as account_category

    from source
)
select * from renamed
  