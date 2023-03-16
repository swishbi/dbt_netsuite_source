with source as (
      select * from {{ source('netsuite', 'subsidiary') }}
),
renamed as (
    select
        country as country_id,
        email as subsidiary_email_address,
        fiscalcalendar as fiscal_calendar_id,
        fullname as subsidiary_full_name,
        id as subsidiary_id,
        lastmodifieddate as last_modified_date,
        mainaddress as subsidiary_main_address_id,
        name as subsidiary_name,
        parent as parent_id,
        state as subsidiary_state,
        _swishbi_id,
        _change_type,
        _commit_version,
        _commit_timestamp

    from source
)
select * from renamed
  