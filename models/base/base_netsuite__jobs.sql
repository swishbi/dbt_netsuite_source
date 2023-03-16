with jobs as (
    select * from {{ ref('stg_netsuite__jobs') }}
),
job_types as (
    select * from {{ ref('stg_netsuite__job_types') }}
),
job_statuses as (
    select * from {{ ref('stg_netsuite__job_statuses') }}
),
employees as (
    select * from {{ ref('base_netsuite__employees') }}
),
joined as (

    select
        jobs.*,
        job_types.job_type_name,
        job_statuses.job_status_name,
        project_manager.employee_name_last_first as project_manager_name_last_first,
        project_manager.employee_name_first_last as project_manager_name_first_last
        
    from jobs
    
    left join job_types 
        on jobs.job_type_id = job_types.job_type_id
    
    left join job_statuses 
        on jobs.job_status_id = job_statuses.job_status_id

    left join employees as project_manager 
        on project_manager.employee_id = jobs.project_manager_id
)
select * from joined