{{ config(enabled=(var('netsuite__advanced_revenue_management_enabled', false))) }}

with source as (
      select * from {{ source('netsuite', 'billingschedulerecurrence') }}
),
renamed as (
    select
        {{ adapter.quote("amount") }},
        {{ adapter.quote("billingschedule") }} as billing_schedule_id,
        {{ adapter.quote("count") }},
        {{ adapter.quote("paymentterms") }} as payment_terms_id,
        {{ adapter.quote("recurrencedate") }} as recurrence_date,
        {{ adapter.quote("recurrenceid") }} as billing_schedule_recurrence_id,
        {{ adapter.quote("relativetoprevious") }} as is_relative_to_previous,
        {{ adapter.quote("units") }},
        {{ adapter.quote("_swishbi_id") }},
        {{ adapter.quote("_change_type") }},
        {{ adapter.quote("_commit_version") }},
        {{ adapter.quote("_commit_timestamp") }}

    from source
)
select * from renamed
  