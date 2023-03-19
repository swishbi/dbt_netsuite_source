with source as (
      select * from {{ var('netsuite_transaction_statuses') }}
),
renamed as (
    select
        fullname as transaction_status_full_name,
        id as transaction_status_id,
        name as transaction_status_name,
        trantype as transaction_type,
        _swishbi_id,
        _change_type,
        _commit_version,
        _commit_timestamp

    from source
)
select * from renamed
  