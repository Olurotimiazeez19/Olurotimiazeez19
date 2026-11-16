# Project 01: Multi-Warehouse Inventory Visibility
**Portfolio owner:** Olurotimi Azeez | [GitHub](https://github.com/Olurotimiazeez19)

## Executive summary
A synthetic inventory intelligence case study consolidating stock across four warehouses and 80 SKUs. The model includes on-hand, allocated and available balances, inventory value, replenishment parameters, days of cover and 12 months of movement history.

**Snapshot date:** 16 November 2026 | **Currency:** Illustrative QAR | **Data:** Synthetic

## Business objective
Provide managers with a consolidated warehouse/SKU view, identify replenishment exceptions and support investigation of inter-warehouse transfers and purchasing priorities.

## Dataset
- 4 warehouses; 80 SKUs; 320 warehouse-SKU snapshot records.
- 12 months of monthly receipts/issues history.
- SKU and warehouse reference tables.

## Initial metrics
| Measure | Result |
|---|---:|
| On-hand units | 14,220 |
| Allocated units | 2,473 |
| Available units | 11,747 |
| Inventory value | QAR 502,963.84 |
| Reorder exception lines | 235 |
| Out-of-stock lines | 37 |
| Low-cover lines | 0 |

## Business questions
1. How much stock and value does each warehouse hold?
2. What proportion is allocated versus available?
3. Which warehouse-SKU records are at or below reorder point?
4. Which items have days of cover below supplier lead time?
5. Where is inventory value concentrated?
6. Which replenishment or transfer decisions need investigation?

## Repository contents
- `data/`: four CSV datasets.
- `excel/`: Excel analysis workbook.
- `sql/`: SQLite-compatible queries.
- `power-bi/`: dashboard build guide and DAX measures.
- `reports/`: management findings.
- `documentation/`: KPI definitions and data dictionary.

## Reproduce the analysis
1. Import the CSVs into Excel or SQLite.
2. Review the data dictionary and KPI definitions.
3. Run `sql/multi_warehouse_queries.sql`.
4. Review the Excel workbook.
5. Follow the Power BI guide and reconcile totals to Excel.

## Management caution
Before purchasing, validate open purchase orders, goods in transit, inter-warehouse transfer options, reservations, demand changes, minimum order quantities and item criticality. The suggested replenishment calculation is indicative only.

## Limitations
All records are synthetic and are not actual employer or customer data. Planning settings and costs are simulated and must not be used for real procurement or financial decisions.
