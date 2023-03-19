{{ config(enabled=(var('netsuite__advanced_revenue_management_enabled', false))) }}

with source as (
      select * from {{ var('netsuite_billing_schedule_recurrences') }}
),
renamed as (
    select
        amount,
        billingschedule as billing_schedule_id,
        count,
        paymentterms as payment_terms_id,
        recurrencedate as recurrence_date,
        recurrenceid as billing_schedule_recurrence_id,
        relativetoprevious = 'T' as is_relative_to_previous,
        units,
        _swishbi_id,
        _change_type,
        _commit_version,
        _commit_timestamp

    from source
)
select * from renamed
  