{{ config(enabled=(var('netsuite__multiple_currencies_enabled', false))) }}

with source as (
      select * from {{ var('netsuite_consolidated_exchange_rates') }}
),
renamed as (
    select
        averagerate as average_rate,
        currentrate as current_rate,
        fromcurrency as from_currency_id,
        fromsubsidiary as from_subsidiary_id,
        historicalrate as historical_rate,
        id as consolidated_exchange_rate_id,
        postingperiod as accounting_period_id,
        tocurrency as to_currency_id,
        tosubsidiary as to_subsidiary_id

        --The below macro adds the fields defined within your consolidated_exchange_rates_pass_through_columns variable into the staging model
        {{ fivetran_utils.fill_pass_through_columns('consolidated_exchange_rates_pass_through_columns') }}

    from source
)
select * from renamed
  