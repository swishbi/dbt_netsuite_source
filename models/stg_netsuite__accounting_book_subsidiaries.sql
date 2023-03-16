{{ config(enabled=(var('netsuite__multibook_accounting_enabled', true))) }}

with source as (
      select * from {{ source('netsuite', 'accountingbooksubsidiaries') }}
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
  