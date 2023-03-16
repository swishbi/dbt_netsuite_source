{{ config(enabled=(var('netsuite__advanced_revenue_management_enabled', false))) }}

with source as (
      select * from {{ source('netsuite', 'revenueplan') }}
),
renamed as (
    select
        {{ adapter.quote("accountingbook") }} as accounting_book_id,
        {{ adapter.quote("allocatedcontractcostamount") }} as allocated_contract_cost_amount,
        {{ adapter.quote("amount") }},
        {{ adapter.quote("amountsource") }} as amount_source_id,
        {{ adapter.quote("catchupperiod") }} as catch_up_accounting_period_id,
        {{ adapter.quote("comments") }},
        {{ adapter.quote("createdfrom") }} as revenue_element_id,
        {{ adapter.quote("creationtriggeredbydisplay") }} as revenue_plan_source_id,
        {{ adapter.quote("iseliminate") }} as is_eliminate,
        {{ adapter.quote("revrecenddate") }} as rev_rec_end_date,
        {{ adapter.quote("enddatechangeimpactfordisplay") }} as end_date_change_impact_id,
        {{ adapter.quote("holdrevenuerecognition") }} as is_hold_revenue_recognition,
        {{ adapter.quote("initialamount") }} as initial_amount,
        {{ adapter.quote("id") }} as revenue_plan_id,
        {{ adapter.quote("item") }} as item_id,
        {{ adapter.quote("itemlaborcostamount") }} as item_labor_cost_amount,
        {{ adapter.quote("itemresalecostamount") }} as item_resale_cost_amount,
        {{ adapter.quote("lastmodifieddate") }} as last_modified_date,
        {{ adapter.quote("recordnumber") }} as record_number,
        {{ adapter.quote("parentlinecurrency") }} as parent_line_currency,
        {{ adapter.quote("periodoffset") }} as period_offset,
        {{ adapter.quote("exchangerate") }} as exchange_rate,
        {{ adapter.quote("recalcadjustperiodoffset") }} as recalculation_adjustment_period_offset,
        {{ adapter.quote("recognitionmethod") }} as recognition_method_id,
        {{ adapter.quote("recognitionperiod") }} as recognition_period,
        {{ adapter.quote("reforecastmethod") }} as reforecast_method_id,
        {{ adapter.quote("remainingdeferredbalance") }} as remaining_deferred_balance,
        {{ adapter.quote("remainingdeferredcostbalance") }} as remaining_deferred_cost_balance,
        {{ adapter.quote("revenueplancurrency") }} as revenue_plan_currency,
        {{ adapter.quote("revenueplantype") }} as revenue_plan_type_id,
        {{ adapter.quote("revrecenddatesource") }} as rev_rec_end_date_source_id,
        {{ adapter.quote("revenuerecognitionrule") }} as revenue_recognition_rule_id,
        {{ adapter.quote("revrecstartdatesource") }} as rev_rec_start_date_source_id,
        {{ adapter.quote("termindays") }} as term_in_days,
        {{ adapter.quote("terminmonths") }} as term_in_months,
        {{ adapter.quote("revrecstartdate") }} as rev_rec_start_date,
        {{ adapter.quote("startoffset") }} as start_offset,
        {{ adapter.quote("statusfordisplay") }} as revenue_plan_status_id,
        {{ adapter.quote("totalamortized") }} as total_amortized,
        {{ adapter.quote("totalrecognized") }} as total_recognized,
        {{ adapter.quote("_swishbi_id") }},
        {{ adapter.quote("_change_type") }},
        {{ adapter.quote("_commit_version") }},
        {{ adapter.quote("_commit_timestamp") }}

    from source
)
select * from renamed
  