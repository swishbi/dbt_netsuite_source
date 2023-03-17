with source as (
      select * from {{ source('netsuite', 'deletedrecord') }}
),
renamed as (
    select
        context,
        deleteddate as deleted_date,
        iscustomlist = 'T' as is_custom_list,
        iscustomrecord = 'T' as is_custom_record,
        name as record_name,
        recordid as record_id,
        recordtypeid as record_type_id,
        _swishbi_id,
        _change_type,
        _commit_version,
        _commit_timestamp

    from source
)
select * from renamed
  