-- Inventory Intelligence Portfolio | SQL starter queries
-- Dataset: data/inventory_snapshot.csv
-- Dialect: SQLite-compatible SQL. Import CSV as table: inventory_snapshot

-- 1. Warehouse stock position
SELECT warehouse,
       SUM(on_hand_qty) AS on_hand_units,
       SUM(allocated_qty) AS allocated_units,
       SUM(available_qty) AS available_units,
       ROUND(SUM(on_hand_qty * unit_cost), 2) AS stock_value
FROM inventory_snapshot
GROUP BY warehouse
ORDER BY stock_value DESC;

-- 2. Reorder exceptions
SELECT sku, description, warehouse, available_qty, reorder_point
FROM inventory_snapshot
WHERE available_qty <= reorder_point
ORDER BY available_qty ASC;

-- 3. Inventory ageing
SELECT sku, description, warehouse, last_movement_days,
       on_hand_qty, ROUND(on_hand_qty * unit_cost, 2) AS inventory_value,
       CASE
         WHEN last_movement_days >= 365 THEN 'Over 12 months'
         WHEN last_movement_days >= 180 THEN '6-12 months'
         WHEN last_movement_days >= 90 THEN '3-6 months'
         ELSE 'Under 3 months'
       END AS ageing_band
FROM inventory_snapshot
ORDER BY last_movement_days DESC;

-- 4. Inventory value by category
SELECT category,
       ROUND(SUM(on_hand_qty * unit_cost), 2) AS inventory_value
FROM inventory_snapshot
GROUP BY category
ORDER BY inventory_value DESC;

-- 5. Excess stock estimate against target stock
SELECT sku, description, warehouse, on_hand_qty, target_stock_qty,
       CASE WHEN on_hand_qty > target_stock_qty
            THEN on_hand_qty - target_stock_qty ELSE 0 END AS excess_qty,
       ROUND(CASE WHEN on_hand_qty > target_stock_qty
            THEN (on_hand_qty - target_stock_qty) * unit_cost ELSE 0 END, 2) AS excess_value
FROM inventory_snapshot
WHERE on_hand_qty > target_stock_qty
ORDER BY excess_value DESC;

-- 6. Stock accuracy using physical_count table
-- Import data/physical_count.csv as physical_count
SELECT p.warehouse,
       SUM(ABS(p.on_hand_qty - p.physical_count_qty)) AS absolute_variance_units,
       SUM(p.on_hand_qty) AS system_units,
       ROUND(100.0 * (1.0 -
          SUM(ABS(p.on_hand_qty - p.physical_count_qty)) /
          NULLIF(SUM(p.on_hand_qty), 0)), 2) AS indicative_unit_accuracy_pct
FROM physical_count p
GROUP BY p.warehouse
ORDER BY indicative_unit_accuracy_pct ASC;
