{{ config(enabled=(var('netsuite__multibook_accounting_enabled', false))) }}

with source as (
      select * from {{ var('netsuite_accounting_book_subsidiaries') }}
),
renamed as (
    select
        accountingbook as accounting_book_id,
        status,
        subsidiary as subsidiary_id,
        _swishbi_id,
        _change_type,
        _commit_version,
        _commit_timestamp

    from source
)
select * from renamed
  