with source as (
      select * from {{ var('netsuite_transaction_lines') }}
),
renamed as (
    select
        id as transaction_line_id,
        transaction as transaction_id,
        class as class_id,
        department as department_id,
        entity as entity_id,
        location as location_id,
        item as item_id,
        subsidiary as  subsidiary_id,
        linelastmodifieddate as line_last_modified_date,
        linesequencenumber as line_sequence_number,
        memo,
        quantity,
        rate,
        cleared = 'T' as is_cleared,
        commitmentfirm = 'T' as is_commitment_firm,
        isbillable = 'T' as is_billable,
        isclosed = 'T' as is_closed,
        iscogs = 'T' as is_cogs,
        mainline = 'T' as is_main_line,
        taxline = 'T' as is_tax_line

        --The below macro adds the fields defined within your transaction_lines_pass_through_columns variable into the staging model
        {{ fivetran_utils.fill_pass_through_columns('transaction_lines_pass_through_columns') }}

    from source
)
select * from renamed
  