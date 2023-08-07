<p align="center">
    <a href="https://circleci.com/gh/swishbi/dbt_netsuite_source">
        <img src="https://dl.circleci.com/status-badge/img/gh/swishbi/dbt_netsuite_source/tree/main.svg?style=svg&circle-token=8dff985ea18b45938dc28f3825ac9b8676383b8f" alt="CircleCI"/></a>
    <a alt="License"
        href="https://github.com/swishbi/dbt_netsuite_source/blob/main/LICENSE">
        <img src="https://img.shields.io/badge/License-Apache%202.0-blue.svg" /></a>
    <a alt="dbt-core">
        <img src="https://img.shields.io/badge/dbt_Core™_version->=1.3.0_<2.0.0-orange.svg" /></a>
    <a alt="Maintained?">
        <img src="https://img.shields.io/badge/Maintained%3F-yes-green.svg" /></a>
    <a alt="PRs">
        <img src="https://img.shields.io/badge/Contributions-welcome-blueviolet" /></a>
</p>


# Netsuite Source dbt Package
# 📣 What does this dbt package do?
<!--section="netsuite_source_model"-->
- Materializes Netsuite staging tables which leverage data from the Netsuite Records Catalog and/or ODBC connector. These staging tables clean, test, and prepare your Netsuite data for analysis by doing the following:
  - Name columns for consistency across all packages and for easier analysis
  - Adds freshness tests to source data
  - Adds column-level testing where applicable. For example, all primary keys are tested for uniqueness and non-null values.
- Generates a comprehensive data dictionary of your netsuite data through the [dbt docs site](https://swishbi.github.io/dbt_netsuite_source/).
- These tables are designed to work simultaneously with our [Netsuite transformation package](https://github.com/swishbi/dbt_netsuite).
<!--section-end-->

# 🎯 How do I use the dbt package?
## Step 1: Prerequisites
To use this dbt package, you must have the **Netsuite2** (netsuite2.com) ODBC connector syncing the respective tables to your destination:

### Netsuite2.com (ODBC)
- account
- accounttype
- accountingbooksubsidiary
- accountingperiodfiscalcalendar
- accountingperiod
- accountingbook
- classification
- currency
- customer
- department
- employee
- employeestatus
- employeestatuscategory
- employeetype
- employeetypecategory
- entity
- entityaddress
- item
- itemsubtype
- itemtype
- location
- locationmainaddress
- subsidiary
- transaction
- transactionaccountingline
- transactionline
- transactionstatus
- vendor
- vendorcategory

### Database Compatibility
This package is compatible with either a **BigQuery**, **Snowflake**, **Redshift**, **PostgreSQL**, or **Databricks** destination.

### Databricks dispatch configuration
If you are using a Databricks destination with this package, you must add the following (or a variation of the following) dispatch configuration within your `dbt_project.yml`. This is required in order for the package to accurately search for macros within the `dbt-labs/spark_utils` then the `dbt-labs/dbt_utils` packages respectively.
```yml
dispatch:
  - macro_namespace: dbt_utils
    search_order: ['spark_utils', 'dbt_utils']
```

## Step 2: Install the package
Include the following netsuite_source package version in your `packages.yml` file.
> TIP: Check [dbt Hub](https://hub.getdbt.com/) for the latest installation instructions or [read the dbt docs](https://docs.getdbt.com/docs/package-management) for more information on installing packages.
```yaml
packages:
  - git: "https://github.com/swishbi/dbt_netsuite_source.git"
    revision: v0.X.X # See latest version in releases
  # use this format when accessing your repository via a github application token
  - git: "https://{{env_var('DBT_ENV_SECRET_GIT_CREDENTIAL')}}@github.com/swishbi/dbt_netsuite_source.git" # git HTTPS URL
    revision: v0.X.X # See latest version in releases
```

## Step 3: Define database and schema variables
By default, this package runs using your destination and the `netsuite` schema. If this is not where your Netsuite data is (for example, if your netsuite schema is named `netsuite_source`), add the following configuration to your root `dbt_project.yml` file:

```yml
vars:
    netsuite_database: your_destination_name
    netsuite_schema: your_schema_name 
```

## Step 4: Enable models for non-existent sources
It's possible that your Netsuite connector does not sync every table that this package expects. If your syncs exclude certain tables, it is because you either don't use that feature in Netsuite or actively excluded some tables from your syncs. To disable the corresponding functionality in the package, you must add the relevant variables. By default, all variables are assumed to be false. Add variables for only the tables you would like to enable:
```yml
vars:
  netsuite_source:
    netsuite__advanced_billing_enabled: true # Enable `billingschedulemilestone`, `billingscheduletype`, and `billingschedule` if you are using the Advanced Billing featre
    netsuite__advanced_invnetory_management_enabled: true # Enable `bins` and `inventoryassignment`` if you are using Advanced Inventory management features.
    netsuite__advanced_jobs_enabled: true # Enable `jobresources`, `projecttask` and `projecttaskassigneee` if you are using the Advanced Jobs feature
    netsuite__advanced_revenue_management_enabled: true # Enable `billingrevenueevent`, `billingschedulerecurrence`, `revenueelement`, `revenueplanplannedcost`, `revenueplanplannedrevenue`, `revenueplanstatus`, revenueplantype`, and `revenueplan` if you are using the Advanced Revenue Management feature
    netsuite__inventory_management_enabled: true # Enable the necessary fields in `transactionline` to calculate inventory balances.
    netsuite__multibook_accounting_enabled: true # Enable `accountingbooksubsidiary` and `accountingbook` if you are using the Multi-Book Accounting feature
    netsuite__multiple_budgets_enabled: true # Enable `budgetcategory` if you are using the Multiple Budgets feature
    netsuite__multiple_calendars_enabled: true # Enable `accountingperiodfiscalcalendar` if you are using the Multiple Calendars feature
    netsuite__multiple_currencies_enabled: true # Enable `currency` and `consolidatedexchangerate` if you are using the Multiple Currencies feature
    netsuite__planned_work_enabled: true # Enable `plannedwork` in `projecttask` and `projecttaskassignee` if you are using the Planned Work feature
    netsuite__team_selling_enabled: true # Enable `transactionsalesteam` if you are using the Team Selling feature
    netsuite__time_off_management_enabled: true # Enable `timeofftype`, `workcalendar`, and `workcalendarholiday` if you are using the Time Off Management feature
    netsuite__time_tracking_enabled: true # Enable `timebill` if you are using the Time Tracking feature
    netsuite__using_budgets: true # Enable `budget`, `budgetcategory`, and `budgetsmachine` if you use budgets
    netsuite__using_customer_categories: true # Enable `customercategory` if you categorize your customers
    netsuite__using_vendor_categories: true # Enable `vendorcategory` if you categorize your vendors
    netsuite__using_jobs: true # Enable `job`, `jobstatus`, and `jobtype` if you use jobs
```
> **Note**: To determine if a table or field is activated by a feature, access the [Records Catalog](https://docs.oracle.com/en/cloud/saas/netsuite/ns-online-help/article_159367781370.html).

## (Optional) Step 5: Additional configurations
<details><summary>Expand for configurations</summary>

### Passing Through Additional Fields
This package includes all source columns defined in the macros folder. You can add more columns using our pass-through column variables. These variables allow for the pass-through fields to be aliased (`alias`) and casted (`transform_sql`) if desired, but not required. Datatype casting is configured via a sql snippet within the `transform_sql` key. You may add the desired sql while omitting the `as field_name` at the end and your custom pass-though fields will be casted accordingly. Use the below format for declaring the respective pass-through variables:

```yml
vars:
    accounts_pass_through_columns: 
        - name: "new_custom_field"
          alias: "custom_field"
    classes_pass_through_columns: 
        - name: "this_field"
    departments_pass_through_columns: 
        - name: "unique_string_field"
          alias: "field_id"
          transform_sql: "cast(field_id as string)"
    transactions_pass_through_columns: 
        - name: "that_field"
    transaction_lines_pass_through_columns: 
        - name: "other_id"
          alias: "another_id"
          transform_sql: "cast(another_id as int64)"
    customers_pass_through_columns: 
        - name: "customer_custom_field"
          alias: "customer_field"
    locations_pass_through_columns: 
        - name: "location_custom_field"
    subsidiaries_pass_through_columns: 
        - name: "sub_field"
          alias: "subsidiary_field"
    consolidated_exchange_rates_pass_through_columns: 
        - name: "consolidate_this_field"
    vendors_pass_through_columns: 
        - name: "vendors_custom_field"
          alias: "vendors_field"
    items_pass_through_columns: 
        - name: "items_custom_field"
          alias: "items_field"
```
### Change the build schema
By default, this package builds the Netsuite staging models within a schema titled (`<target_schema>` + `_netsuite_source`) in your destination. If this is not where you would like your netsuite staging data to be written to, add the following configuration to your root `dbt_project.yml` file:

```yml
models:
    netsuite_source:
      +schema: my_new_schema_name # leave blank for just the target_schema
```

</details>

# 🔍 Does this package have dependencies?
This dbt package is dependent on the following dbt packages. Please be aware that these dependencies are installed by default within this package. For more information on the following packages, refer to the [dbt hub](https://hub.getdbt.com/) site.
> IMPORTANT: If you have any of these dependent packages in your own `packages.yml` file, we highly recommend that you remove them from your root `packages.yml` to avoid package version conflicts.
```yml
packages:
    - package: fivetran/fivetran_utils
      version: [">=0.4.0", "<0.5.0"]

    - package: dbt-labs/dbt_utils
      version: [">=1.0.0", "<2.0.0"]

    - package: dbt-labs/spark_utils
      version: [">=0.3.0", "<0.4.0"]
```
          
# 🙌 How is this package maintained and can I contribute?
## Package Maintenance
The Swish BI team maintaining this package _only_ maintains the latest version of the package. We highly recommend that you stay consistent with the latest version of the package and refer to the [CHANGELOG](https://github.com/swishbi/dbt_netsuite_source/blob/main/CHANGELOG.md) and release notes for more information on changes across versions.

## Contributions
The Swish BI team develops these dbt packages. However, the packages are made better by community contributions! 

We highly encourage and welcome contributions to this package. Check out [this dbt Discourse article](https://discourse.getdbt.com/t/contributing-to-a-dbt-package/657) to learn how to contribute to a dbt package!

# 🏪 Are there any resources available?
- If you have questions or want to reach out for help, please refer to the [GitHub Issue](https://github.com/swishbi/dbt_netsuite_source/issues/new/choose) section to find the right avenue of support for you.
- If you would like to provide feedback to the dbt package team at Swish BI or would like to request a new dbt package, fill out our Feedback Form.
