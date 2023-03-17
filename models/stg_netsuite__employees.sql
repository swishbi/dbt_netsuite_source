with source as (
      select * from {{ source('netsuite', 'employee') }}
),
renamed as (
    select
        department as department_id,
        employeestatus as employee_status_id,
        employeetype as employee_type_id,
        firstname as employee_first_name,
        hiredate as employee_hire_date,
        id as employee_id,
        issalesrep = 'T' as is_sales_rep,
        {% if var('netsuite__advanced_jobs_enabled', false) %}
        isjobresource = 'T' as is_job_resource,
        laborcost as employee_labor_cost,
        {% endif %}
        lastmodifieddate as last_modified_date,
        lastname as employee_last_name,
        location as location_id,
        releasedate as employee_release_date,
        subsidiary as subsidiary_id,
        supervisor as supervisor_id,
        title as employee_job_title,
        workcalendar as work_calendar_id,
        _swishbi_id,
        _change_type,
        _commit_version,
        _commit_timestamp,

        concat_ws(', ', lastname, firstname) as employee_name_last_first,
        concat_ws(' ', firstname, lastname) as employee_name_first_last,
        concat('https://{{ var("netsuite_account_id", "123456") }}.app.netsuite.com/app/common/entity/employee.nl?id=', id) as employee_url_link

    from source
)
select * from renamed
  