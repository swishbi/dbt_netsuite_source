{{ config(enabled=(var('netsuite__time_tracking_enabled', false))) }}

with source as (
      select * from {{ var('netsuite_time_entries') }}
),
renamed as (
    select
        casetaskevent as case_task_event_id,
        class as class_id,
        customer as customer_id,
        department as department_id,
        employee as employee_id,
        hours,
        id as time_entry_id,
        isbillable = 'T' as is_billable,
        {% if var('netsuite__advanced_jobs_enabled', false) %}
        isproductive = 'T' as is_productive,
        isutilized = 'T' as is_utilized,
        timetype as time_type,
        {% endif %}
        item as item_id,
        lastmodifieddate as last_modified_date,
        location as location_id,
        memo,
        rate,
        subsidiary as subsidiary_id,
        {% if var('netsuite__time_off_management_enabled', false) %}
        timeofftype as time_off_type_id,
        {% endif %}
        trandate as date,

        case
            when isbillable then 'Billable'
            else 'Non-Billable'
        end as billable_label,

        case 
            when lower(timetype) = 'a' then 'actual' 
            when lower(timetype) = 'p' then 'planned'
            when lower(timetype) = 'v' then 'allocated'
            else null 
        end as time_type_full_name,

        case
            when timeofftype is not null then true
            else false
        end as is_time_off

    from source
)
select * from renamed
  