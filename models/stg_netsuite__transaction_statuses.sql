with source as (
      select * from {{ var('netsuite_transaction_statuses') }}
),
renamed as (
    select
        fullname as transaction_status_full_name,
        id as transaction_status_id,
        name as transaction_status_name,
        trantype as transaction_type

    from source
)
select * from renamed
  