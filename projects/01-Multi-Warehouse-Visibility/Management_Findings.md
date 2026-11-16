# Management Findings
## Executive summary
The synthetic snapshot (16 November 2026) contains 14,220 on-hand units, 2,473 allocated units and 11,747 available units. Illustrative inventory value is QAR 502,963.84. There are 235 warehouse-SKU records at or below reorder point, including 37 with no available stock.

## Warehouse comparison
| Warehouse | On-hand | Allocated | Available | Value QAR | Reorder lines | Out of stock |
| Doha Central | 5,324 | 1,125 | 4,199 | 197,788.00 | 44 | 4 |
| North Hub | 3,416 | 544 | 2,872 | 134,511.88 | 61 | 10 |
| Projects Store | 1,820 | 315 | 1,505 | 61,933.52 | 71 | 11 |
| South Hub | 3,660 | 489 | 3,171 | 108,730.44 | 59 | 12 |

## Recommended actions
1. Validate out-of-stock and below-reorder exceptions against open orders, pending receipts and confirmed demand.
2. Check transferable surplus at other warehouses before creating new purchase orders.
3. Prioritise critical items with days of cover below supplier lead time.
4. Review demand, lead times, safety stock and reorder settings with planners.
5. Establish a weekly exception review with an owner, due date and resolution status.
6. Improve SKU, warehouse and planning master-data governance.

## Limitations
Synthetic demonstration data only. The model does not include open POs, goods in transit, backorders, actual supplier performance or service-level history. Do not use suggested replenishment as an automatic purchase instruction.
