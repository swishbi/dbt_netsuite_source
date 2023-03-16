with source as (
      select * from {{ source('netsuite', 'billingschedule') }}
),
renamed as (
    select
        {{ adapter.quote("applytosubtotal") }} as is_apply_to_subtotal,
        {{ adapter.quote("externalid") }} as external_id,
        {{ adapter.quote("isinactive") }} as is_inactive,
        {{ adapter.quote("inarrears") }} as is_in_arrears,
        {{ adapter.quote("initialamount") }} as initial_amount,
        {{ adapter.quote("initialamountpercent") }} as initial_amount_percent,
        {{ adapter.quote("initialterms") }} as initial_terms,
        {{ adapter.quote("id") }} as billing_schedule_id,
        {{ adapter.quote("billforactuals") }} as is_bill_for_actuals,
        {{ adapter.quote("name") }} as billing_schedule_name,
        {{ adapter.quote("job") }} as job_id,
        {{ adapter.quote("ispublic") }} as is_public,
        {{ adapter.quote("numberremaining") }} as number_remaining,
        {{ adapter.quote("frequency") }} as frequency_id,
        {{ adapter.quote("recurrencepattern") }} as recurrence_pattern_id,
        {{ adapter.quote("recurrenceterms") }} as recurrence_terms_id,
        {{ adapter.quote("repeatevery") }} as repeat_every,
        {{ adapter.quote("transaction") }} as transaction_id,
        {{ adapter.quote("scheduletype") }} as schedule_type_id,
        {{ adapter.quote("_swishbi_id") }},
        {{ adapter.quote("_change_type") }},
        {{ adapter.quote("_commit_version") }},
        {{ adapter.quote("_commit_timestamp") }}

    from source
)
select * from renamed
  