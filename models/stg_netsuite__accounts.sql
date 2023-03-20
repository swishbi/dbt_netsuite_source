with source as (
      select * from {{ var('netsuite_accounts') }}
),
renamed as (
    select
        accountsearchdisplaynamecopy as account_name,
        acctnumber as account_number,
        accttype as account_type_id,
        cashflowrate as cash_flow_rate_type,
        class as class_id,
        {% if var('netsuite__multiple_currencies_enabled', false) %}
        currency as currency_id,
        generalrate as general_rate_type,
        {% endif %}
        deferralacct as deferral_account_id,
        department as department_id,
        description as account_description,
        externalid as account_external_id,
        fullname as account_full_name,
        id as account_id,
        includechildren = 'T' as is_including_child_subs,
        inventory = 'T' as is_inventory,
        isinactive = 'T' as is_inactive,
        issummary = 'T' as is_summary,
        lastmodifieddate as last_modified_date,
        location as location_id,
        parent as parent_id,

        concat_ws('-', acctnumber, accountsearchdisplaynamecopy) as account_number_and_name,
        lower(fullname) like '%intercompany%' as is_account_intercompany

        --The below macro adds the fields defined within your accounts_pass_through_columns variable into the staging model
        {{ fivetran_utils.fill_pass_through_columns('accounts_pass_through_columns') }}

    from source
)
select * from renamed
  