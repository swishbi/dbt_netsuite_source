{{ config(enabled=(var('netsuite__advanced_revenue_management_enabled', false))) }}

with source as (
      select * from {{ source('netsuite', 'billingrevenueevent') }}
),
renamed as (
    select
        {{ adapter.quote("amount") }},
        {{ adapter.quote("cumulativepercentcomplete") }} as cumulative_percent_complete,
        {{ adapter.quote("eventdate") }} as event_date,
        {{ adapter.quote("enddate") }} as end_date,
        {{ adapter.quote("eventtype") }} as event_type_id,
        {{ adapter.quote("externalid") }} as external_id,
        {{ adapter.quote("id") }} as billing_revenue_event_id,
        {{ adapter.quote("projectrevenuerule") }} as project_revenue_rule_id,
        {{ adapter.quote("eventpurpose") }} as event_purpose,
        {{ adapter.quote("quantity") }},
        {{ adapter.quote("startdate") }} as start_date,
        {{ adapter.quote("subscriptionline") }} as subscription_line_id,
        {{ adapter.quote("transactionline") }} as transaction_line_id,
        {{ adapter.quote("_swishbi_id") }},
        {{ adapter.quote("_change_type") }},
        {{ adapter.quote("_commit_version") }},
        {{ adapter.quote("_commit_timestamp") }}

    from source
)
select * from renamed
  