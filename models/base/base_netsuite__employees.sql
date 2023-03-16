with employees as (
    select * from {{ ref('stg_netsuite__employees') }}
),
employee_statuses as (
    select * from {{ ref('stg_netsuite__employee_statuses') }}
),
employee_status_categories as (
    select * from {{ ref('stg_netsuite__employee_status_categories') }}
),
employee_types as (
    select * from {{ ref('stg_netsuite__employee_types') }}
),
employee_type_categories as (
    select * from {{ ref('stg_netsuite__employee_type_categories') }}
),
departments as (
    select * from {{ ref('stg_netsuite__departments') }}
),
locations as (
    select * from {{ ref('base_netsuite__locations') }}
),
subsidiaries as (
    select * from {{ ref('stg_netsuite__subsidiaries') }}
),
joined as (
    select
        employees.*,
        employee_types.employee_type_name,
        employee_type_categories.employee_type_category_name,
        employee_statuses.employee_status_name,
        employee_status_categories.employee_status_category_name,
        departments.department_name,
        subsidiaries.subsidiary_name,
        locations.location_name,
        locations.location_city,
        locations.location_country,
        supervisors.employee_name_last_first as supervisor_name_last_first,
        supervisors.employee_name_first_last as supervisor_name_first_last
    
    from employees
    
    left join employee_statuses 
        on employee_statuses.employee_status_id = employees.employee_status_id
        
    left join employee_status_categories 
        on employee_status_categories.employee_status_category_id = employee_statuses.employee_status_category_id
    
    left join employee_types 
        on employee_types.employee_type_id = employees.employee_type_id
    
    left join employee_type_categories 
        on employee_type_categories.employee_type_category_id = employee_types.employee_type_category_id
    
    left join departments 
        on departments.department_id = employees.department_id
    
    left join locations 
        on locations.location_id = employees.location_id
    
    left join subsidiaries 
        on subsidiaries.subsidiary_id = employees.subsidiary_id
    
    left join employees as supervisors 
        on supervisors.employee_id = employees.supervisor_id
)
select * from joined
