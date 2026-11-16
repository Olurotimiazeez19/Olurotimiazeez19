-- Project 01: Multi-Warehouse Inventory Visibility (SQLite)
-- Import the CSVs as sku_master, warehouse_master, inventory_snapshot, monthly_inventory_movements.

-- 1. Warehouse stock position
SELECT warehouse_name, SUM(on_hand_qty) on_hand_units, SUM(allocated_qty) allocated_units,
 SUM(available_qty) available_units, ROUND(SUM(inventory_value_qAR),2) inventory_value_qAR,
 SUM(CASE WHEN reorder_flag='REORDER' THEN 1 ELSE 0 END) reorder_lines
FROM inventory_snapshot GROUP BY warehouse_name ORDER BY inventory_value_qAR DESC;

-- 2. Replenishment exceptions
SELECT warehouse_name, sku, description, available_qty, reorder_point_qty, days_of_cover, lead_time_days, stock_status
FROM inventory_snapshot WHERE reorder_flag='REORDER'
ORDER BY days_of_cover ASC;

-- 3. Value by category and warehouse
SELECT warehouse_name, category, ROUND(SUM(inventory_value_qAR),2) inventory_value_qAR
FROM inventory_snapshot GROUP BY warehouse_name, category ORDER BY inventory_value_qAR DESC;

-- 4. Allocation rate
SELECT warehouse_name, ROUND(100.0*SUM(allocated_qty)/NULLIF(SUM(on_hand_qty),0),2) allocation_pct
FROM inventory_snapshot GROUP BY warehouse_name;

-- 5. Lead-time risk
SELECT warehouse_name, sku, available_qty, days_of_cover, lead_time_days
FROM inventory_snapshot WHERE days_of_cover < lead_time_days OR available_qty=0
ORDER BY days_of_cover;

-- 6. Monthly issues and receipts
SELECT warehouse_id, month, SUM(issues_qty) issues_qty, SUM(receipts_qty) receipts_qty
FROM monthly_inventory_movements GROUP BY warehouse_id, month ORDER BY warehouse_id, month;

-- 7. Suggested replenishment to target (investigate before ordering)
SELECT warehouse_name, sku, available_qty, target_stock_qty,
 MAX(0,target_stock_qty-available_qty) suggested_replenishment_qty
FROM inventory_snapshot WHERE available_qty < target_stock_qty;
