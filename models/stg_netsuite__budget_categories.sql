with source as (
      select * from {{ source('netsuite', 'budgetcategory') }}
),
renamed as (
    select
        budgettype as budget_type,
        id as budget_category_id,
        isinactive as is_inactive,
        name as budget_category,
        _swishbi_id,
        _change_type,
        _commit_version,
        _commit_timestamp

    from source
)
select * from renamed
  