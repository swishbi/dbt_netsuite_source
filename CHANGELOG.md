# dbt_netsuite_source v0.3.0

## 🚨 Breaking Changes 🚨:
[PR #11](https://github.com/swishbi/dbt_netsuite_source/pull/11) includes the following breaking changes:
- Re-introduces `quantity`, `rateamount`, and `voided` columns to `stg_netsuite__transaction_lines` model. If these have been added as pass through they will need to be removed from the pass through variable.

## 🎉 Feature Updates 🎉
[PR #11](https://github.com/swishbi/dbt_netsuite_source/pull/11) includes the following feature updates:
- Incorporates `isinventoryaffecting` and `accountinglinetype` to the `stg_netsuite__transaction_lines` model as a feature via the `netsuite__inventory_management_enabled` variable.
- Incorporates `bins` and `inventoryassignment` staging models as a feature via the `netsuite__advanced_inventory_management_enabled` variable.

## Contributors
- [phillem15](https://github.com/phillem15) ([#11](https://github.com/swishbi/dbt_netsuite_source/pull/11))

# dbt_netsuite_source v0.2.3

## 🚨 Breaking Changes 🚨:
[PR #10](https://github.com/swishbi/dbt_netsuite_source/pull/10) includes the following breaking changes:
- Removes `quantity` and `rate` columns from `stg_netsuite__transaction_lines` model. This allows these columns to be added as pass through.

## Contributors
- [phillem15](https://github.com/phillem15) ([#10](https://github.com/swishbi/dbt_netsuite_source/pull/10))

# dbt_netsuite_source v0.2.2

## 🚨 Breaking Changes 🚨:
[PR #9](https://github.com/swishbi/dbt_netsuite_source/pull/9) includes the following breaking changes:
- Changes the default identifier for the budgets table from `budget` to `budgets`.

## Contributors
- [phillem15](https://github.com/phillem15) ([#9](https://github.com/swishbi/dbt_netsuite_source/pull/9))

# dbt_netsuite_source v0.2.1

## 🎉 Feature Updates 🎉
[PR #8](https://github.com/swishbi/dbt_netsuite_source/pull/8) includes the following feature updates:
- Incorporates customer categories as a feature via the `netsuite__using_customer_categories` variable.

## Contributors
- [phillem15](https://github.com/phillem15) ([#8](https://github.com/swishbi/dbt_netsuite_source/pull/8))

# dbt_netsuite_source v0.1.0
Refer to the relevant release notes on the Github repository for specific details for the previous releases. Thank you!

# dbt_netsuite_source v0.2.0

## 🚨 Breaking Changes 🚨:
[PR #7](https://github.com/swishbi/dbt_netsuite_source/pull/7) includes the following breaking changes:
- Remove columns from staging models that are feature dependent in NetSuite. These columns can be re-added via the pass through columns.

## 🎉 Feature Updates 🎉

## Contributors
- [phillem15](https://github.com/phillem15) ([#7](https://github.com/swishbi/dbt_netsuite_source/pull/7))

# dbt_netsuite_source v0.1.0
Refer to the relevant release notes on the Github repository for specific details for the previous releases. Thank you!