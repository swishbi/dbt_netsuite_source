{{ config(enabled=(var('netsuite__advanced_revenue_management_enabled', false))) }}

with source as (
      select * from {{ source('netsuite', 'billingrevenueevent') }}
),
renamed as (
    select
        amount,
        cumulativepercentcomplete as cumulative_percent_complete,
        eventdate as event_date,
        enddate as end_date,
        eventtype as event_type_id,
        externalid as external_id,
        id as billing_revenue_event_id,
        projectrevenuerule as project_revenue_rule_id,
        eventpurpose as event_purpose,
        quantity,
        startdate as start_date,
        subscriptionline as subscription_line_id,
        transactionline as transaction_line_id,
        _swishbi_id,
        _change_type,
        _commit_version,
        _commit_timestamp

    from source
)
select * from renamed
  