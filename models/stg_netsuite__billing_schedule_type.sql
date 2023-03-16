{{ config(enabled=(var('netsuite__advanced_billing_enabled', false))) }}

with source as (
      select * from {{ source('netsuite', 'billingscheduletype') }}
),
renamed as (
    select
        {{ adapter.quote("id") }} as billing_schedule_type_id,
        {{ adapter.quote("name") }} as billing_schedule_type_name,
        {{ adapter.quote("_swishbi_id") }},
        {{ adapter.quote("_change_type") }},
        {{ adapter.quote("_commit_version") }},
        {{ adapter.quote("_commit_timestamp") }}

    from source
)
select * from renamed
  