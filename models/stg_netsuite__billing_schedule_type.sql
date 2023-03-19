{{ config(enabled=(var('netsuite__advanced_billing_enabled', false))) }}

with source as (
      select * from {{ var('netsuite_billing_schedule_types') }}
),
renamed as (
    select
        id as billing_schedule_type_id,
        name as billing_schedule_type_name,
        _swishbi_id,
        _change_type,
        _commit_version,
        _commit_timestamp

    from source
)
select * from renamed
  