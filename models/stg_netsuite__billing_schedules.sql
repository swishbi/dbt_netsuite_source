{{ config(enabled=(var('netsuite__advanced_billing_enabled', false))) }}

with source as (
      select * from {{ source('netsuite', 'billingschedule') }}
),
renamed as (
    select
        applytosubtotal = 'T' as is_apply_to_subtotal,
        externalid as external_id,
        isinactive = 'T' as is_inactive,
        inarrears = 'T' as is_in_arrears,
        initialamount as initial_amount,
        initialamountpercent as initial_amount_percent,
        initialterms as initial_terms,
        id as billing_schedule_id,
        billforactuals = 'T' as is_bill_for_actuals,
        name as billing_schedule_name,
        job as job_id,
        ispublic = 'T' as is_public,
        numberremaining as number_remaining,
        frequency as frequency_id,
        recurrencepattern as recurrence_pattern_id,
        recurrenceterms as recurrence_terms_id,
        repeatevery as repeat_every,
        transaction as transaction_id,
        scheduletype as schedule_type_id,
        _swishbi_id,
        _change_type,
        _commit_version,
        _commit_timestamp

    from source
)
select * from renamed
  