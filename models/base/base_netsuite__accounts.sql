with accounts as (
    select * from {{ ref('stg_netsuite__accounts') }}
),
account_types as (
    select * from {{ ref('stg_netsuite__account_types') }}
),
joined as (

    select 
        accounts.*,
        account_types.account_type_name,
        account_types.is_balancesheet,
        account_types.is_leftside,
        account_types.is_income_statement,
        account_types.is_accounts_payable,
        account_types.is_accounts_receivable,
        account_types.is_income_account,
        account_types.is_expense_account,
        account_types.account_type_sort_helper,
        account_types.account_category

    from accounts
    left join account_types
        on accounts.account_type_id = account_types.account_type_id
)
select * from joined