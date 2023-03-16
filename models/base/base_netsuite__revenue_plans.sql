with revenue_plans as (
    select * from {{ ref('stg_netsuite__revenue_plans') }}
),
revenue_plan_statuses as (
    select * from {{ ref('stg_netsuite__revenue_plan_statuses') }}
),
revenue_plan_types as (
    select * from {{ ref('stg_netsuite__revenue_plan_types') }}
),
joined as (
    select
        revenue_plans.*,
        revenue_plan_statuses.revenue_plan_status_name,
        revenue_plan_types.revenue_plan_type_name

    from revenue_plans

    left join revenue_plan_statuses
        on revenue_plan_statuses.revenue_plan_status_id = revenue_plans.revenue_plan_status_id

    left join revenue_plan_types
        on revenue_plan_types.revenue_plan_type_id = revenue_plan_type_id
)
select * from joined