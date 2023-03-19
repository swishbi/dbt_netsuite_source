with source as (
      select * from {{ var('netsuite_items') }}
),
renamed as (
    select
        assetaccount as asset_account_id,
        class as class_id,
        deferralaccount as deferral_account_id,
        deferredrevenueaccount as deferred_revenue_account_id,
        department as department_id,
        description as item_sales_description,
        expenseaccount as expense_account_id,
        fullname as item_name,
        gainlossaccount as gain_loss_account_id,
        id as item_id,
        incomeaccount as income_account_id,
        intercoexpenseaccount as intercompany_expense_account_id,
        intercoincomeaccount as intercompany_income_account_id,
        isfulfillable = 'T' as is_fulfillable,
        itemtype as item_type_id,
        lastmodifieddate as last_modified_date,
        location as location_id,
        parent as parent_id,
        subsidiary as subsidiary_id,

        concat('https://{{ var("netsuite_account_id", "123456") }}.app.netsuite.com/app/common/item/item.nl?id=', id) as item_url_link

    from source
)
select * from renamed
  