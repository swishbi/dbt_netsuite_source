with source as (
      select * from {{ source('netsuite', 'transactionline') }}
),
renamed as (
    select
        actualshipdate as actual_ship_date,
        class as class_id,
        costestimaterate as cost_estimate_rate,
        createdfrom as created_from_id,
        createdpo as created_po_id,
        department as department_id,
        dropship = 'T' as is_drop_shipment,
        entity as entity_id,
        id as transaction_line_id,
        isbillable = 'T' as is_billable,
        isclosed = 'T' as is_closed,
        iscogs = 'T' as is_cogs,
        isfullyshipped = 'T' as is_fully_shipped,
        isinventoryaffecting = 'T' as is_inventory_affecting,
        item as item_id,
        linelastmodifieddate as line_last_modified_date,
        linesequencenumber as line_sequence_number,
        location as location_id,
        mainline = 'T' as is_main_line,
        memo,
        quantity,
        quantitybackordered as quantity_back_ordered,
        quantitybilled as quantity_billed,
        quantitycommitted as quantity_committed,
        quantitypacked as quantity_packed,
        quantitypicked as quantity_picked,
        quantityshiprecv as quantity_shipped_received,
        rate,
        specialorder = 'T' as is_special_order,
        subsidiary as  subsidiary_id,
        taxline = 'T' as is_tax_line,
        transaction as transaction_id,
        uniquekey as transaction_line_unique_key,
        _swishbi_id,
        _change_type,
        _commit_version,
        _commit_timestamp

    from source
)
select * from renamed
  