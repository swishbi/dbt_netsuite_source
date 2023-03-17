{{ config(enabled=(var('netsuite__advanced_revenue_management_enabled', false))) }}

with source as (
      select * from {{ source('netsuite', 'revenueplan') }}
),
renamed as (
    select
        accountingbook as accounting_book_id,
        allocatedcontractcostamount as allocated_contract_cost_amount,
        amount,
        amountsource as amount_source_id,
        catchupperiod as catch_up_accounting_period_id,
        comments,
        createdfrom as revenue_element_id,
        creationtriggeredbydisplay as revenue_plan_source_id,
        iseliminate = 'T' as is_eliminate,
        revrecenddate as rev_rec_end_date,
        enddatechangeimpactfordisplay as end_date_change_impact_id,
        holdrevenuerecognition = 'T' as is_hold_revenue_recognition,
        initialamount as initial_amount,
        id as revenue_plan_id,
        item as item_id,
        itemlaborcostamount as item_labor_cost_amount,
        itemresalecostamount as item_resale_cost_amount,
        lastmodifieddate as last_modified_date,
        recordnumber as record_number,
        {% if var('netsuite__multiple_currencies_enabled', false) %}
        parentlinecurrency as parent_line_currency,
        revenueplancurrency as revenue_plan_currency,
        {% endif %}
        periodoffset as period_offset,
        exchangerate as exchange_rate,
        recalcadjustperiodoffset as recalculation_adjustment_period_offset,
        recognitionmethod as recognition_method_id,
        recognitionperiod as recognition_period,
        reforecastmethod as reforecast_method_id,
        remainingdeferredbalance as remaining_deferred_balance,
        remainingdeferredcostbalance as remaining_deferred_cost_balance,
        revenueplantype as revenue_plan_type_id,
        revrecenddatesource as rev_rec_end_date_source_id,
        revenuerecognitionrule as revenue_recognition_rule_id,
        revrecstartdatesource as rev_rec_start_date_source_id,
        termindays as term_in_days,
        terminmonths as term_in_months,
        revrecstartdate as rev_rec_start_date,
        startoffset as start_offset,
        statusfordisplay as revenue_plan_status_id,
        totalamortized as total_amortized,
        totalrecognized as total_recognized,
        _swishbi_id,
        _change_type,
        _commit_version,
        _commit_timestamp

    from source
)
select * from renamed
  