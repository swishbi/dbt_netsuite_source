Welcome to your new dbt project!

### Using the starter project

Try running the following commands:
- dbt run
- dbt test


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices

## Enable models for non-existent sources
It's possible that your Netsuite connector does not sync every table that this package expects. If your syncs exclude certain tables, it is because you either don't use that feature in Netsuite or actively excluded some tables from your syncs. To disable the corresponding functionality in the package, you must add the relevant variables. By default, all variables are assumed to be false. Add variables for only the tables you would like to enable:
```yml
vars:
  netsuite_source:
    netsuite__advanced_billing_enabled: true # Enable `billingschedulemilestone`, `billingscheduletype`, and `billingschedule` if you are using the Advanced Billing featre
    netsuite__advanced_jobs_enabled: true # Enable `jobresources`, `projecttask` and `projecttaskassigneee` if you are using the Advanced Jobs feature
    netsuite__advanced_revenue_management_enabled: true # Enable `billingrevenueevent`, `billingschedulerecurrence`, `revenueelement`, `revenueplanplannedcost`, `revenueplanplannedrevenue`, `revenueplanstatus`, revenueplantype`, and `revenueplan` if you are using the Advanced Revenue Management feature
    netsuite__multibook_accounting_enabled: true # Enable `accountingbooksubsidiary` and `accountingbook` if you are using the Multi-Book Accounting feature
    netsuite__multiple_budgets_enabled: true # Enable `budgetcategory` if you are using the Multiple Budgets feature
    netsuite__multiple_calendars_enabled: true # Enable `accountingperiodfiscalcalendar` if you are using the Multiple Calendars feature
    netsuite__multiple_currencies_enabled: true # Enable `currency` and `consolidatedexchangerate` if you are using the Multiple Currencies feature
    netsuite__planned_work_enabled: true # Enable `plannedwork` in `projecttask` and `projecttaskassignee` if you are using the Planned Work feature
    netsuite__team_selling_enabled: true # Enable `transactionsalesteam` if you are using the Team Selling feature
    netsuite__time_off_management_enabled: true # Enable `timeofftype`, `workcalendar`, and `workcalendarholiday` if you are using the Time Off Management feature
    netsuite__time_tracking_enabled: true # Enable `timebill` if you are using the Time Tracking feature
    netsuite__using_budgets: true # Enable `budget`, `budgetcategory`, and `budgetsmachine` if you use budgets
    netsuite__using_vendor_categories: true # Enable `vendorcategory` if you categorize your vendors
    netsuite__using_jobs: true # Enable `job`, `jobstatus`, and `jobtype` if you use jobs
```
> **Note**: To determine if a table or field is activated by a feature, access the [Records Catalog](https://docs.oracle.com/en/cloud/saas/netsuite/ns-online-help/article_159367781370.html).
