with source as (
      select * from {{ var('netsuite_previous_transaction_line_links') }}
),
renamed as (
    select
        lastmodifieddate as last_modified_date,
        linktype as link_type,
        nextdoc as next_document_number,
        nextline as next_line_id,
        nexttype as next_type,
        previousdoc as previous_document_number,
        previousline as previous_line_id,
        previoustype as previous_type,
        _swishbi_id,
        _change_type,
        _commit_version,
        _commit_timestamp

    from source
)
select * from renamed
  