with source as (
      select * from {{ source('netsuite', 'timeofftype') }}
),
renamed as (
    select
        displayname as time_off_type_display_name,
        id as time_off_type_id,
        incrementunit as increment_unit,
        minimumincrement as minimum_increment,
        name as time_off_type_name,
        _swishbi_id,
        _change_type,
        _commit_version,
        _commit_timestamp

    from source
)
select * from renamed
  