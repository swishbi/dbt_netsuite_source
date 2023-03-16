with source as (
      select * from {{ source('netsuite', 'transactionsalesteam') }}
),
renamed as (
    select
        contribution,
        employee as employee_id,
        id as transaction_sales_team_id,
        isprimary as is_primary,
        salesrole as sales_role,
        transaction as transaction_id,
        _swishbi_id,
        _change_type,
        _commit_version,
        _commit_timestamp

    from source
)
select * from renamed
  