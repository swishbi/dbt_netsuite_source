with source as (
      select * from {{ source('netsuite', 'revenueplantype') }}
),
renamed as (
    select
        {{ adapter.quote("key") }} as revenue_plan_type_id,
        {{ adapter.quote("name") }} as revenue_plan_type_name,
        {{ adapter.quote("_swishbi_id") }},
        {{ adapter.quote("_change_type") }},
        {{ adapter.quote("_commit_version") }},
        {{ adapter.quote("_commit_timestamp") }}

    from source
)
select * from renamed
  