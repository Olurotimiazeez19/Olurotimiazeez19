# Power BI Build Guide
A native `.pbix` is not included; create and save it in Power BI Desktop.

## Load CSVs
Load `inventory_snapshot.csv`, `sku_master.csv`, `warehouse_master.csv` and `monthly_inventory_movements.csv`.

## Relationships
- inventory_snapshot[sku] → sku_master[sku] (many-to-one)
- inventory_snapshot[warehouse_id] → warehouse_master[warehouse_id] (many-to-one)
- monthly_inventory_movements[sku] → sku_master[sku]
- monthly_inventory_movements[warehouse_id] → warehouse_master[warehouse_id]

## Report pages
1. Executive Overview: KPI cards, inventory value by warehouse, on-hand/allocated/available by warehouse, category matrix.
2. Replenishment Exceptions: exception table, reorder lines by warehouse, status formatting.
3. Stock Cover & Movement: days cover versus lead time, monthly receipts/issues, lead-time risk table.

## DAX measures
```DAX
On Hand Units = SUM(inventory_snapshot[on_hand_qty])
Allocated Units = SUM(inventory_snapshot[allocated_qty])
Available Units = SUM(inventory_snapshot[available_qty])
Inventory Value QAR = SUM(inventory_snapshot[inventory_value_qAR])
Reorder Lines =
CALCULATE(COUNTROWS(inventory_snapshot), inventory_snapshot[reorder_flag] = "REORDER")
Out of Stock Lines =
CALCULATE(COUNTROWS(inventory_snapshot), inventory_snapshot[stock_status] = "OUT OF STOCK")
Allocation Rate % = DIVIDE([Allocated Units], [On Hand Units], 0)
Lead-Time Risk Lines =
COUNTROWS(FILTER(inventory_snapshot, inventory_snapshot[days_of_cover] < inventory_snapshot[lead_time_days]))
Suggested Replenishment Units =
SUMX(inventory_snapshot, MAX(0, inventory_snapshot[target_stock_qty] - inventory_snapshot[available_qty]))
```
Reconcile all card totals to the Excel KPI Summary. Label the report synthetic demonstration data.
Save as `Multi_Warehouse_Inventory_Visibility.pbix`.
