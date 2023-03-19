{{ config(enabled=(var('netsuite__team_selling_enabled', false))) }}

with source as (
      select * from {{ var('netsuite_transaction_sales_teams') }}
),
renamed as (
    select
        contribution,
        employee as employee_id,
        id as transaction_sales_team_id,
        isprimary = 'T' as is_primary,
        salesrole as sales_role,
        transaction as transaction_id,
        _swishbi_id,
        _change_type,
        _commit_version,
        _commit_timestamp

    from source
)
select * from renamed
  