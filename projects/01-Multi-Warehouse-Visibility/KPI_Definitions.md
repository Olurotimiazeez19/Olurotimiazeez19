# KPI Definitions
| KPI | Calculation | Use |
|---|---|---|
| On-hand units | SUM(on_hand_qty) | Recorded physical/system stock |
| Allocated units | SUM(allocated_qty) | Stock committed to demand |
| Available units | SUM(available_qty) | On-hand less allocated |
| Inventory value | SUM(on_hand_qty × unit_cost_qAR) | Financial value of on-hand stock |
| Reorder lines | Count available_qty <= reorder_point_qty | Replenishment exceptions |
| Days of cover | available_qty / avg_daily_demand | Compare with supplier lead time |
| Allocation rate | allocated_qty / on_hand_qty × 100 | Share of stock already committed |
| Lead-time risk | Count days_of_cover < lead_time_days | Potential supply exposure |

## Assumptions and controls
- Snapshot date: 16 November 2026; currency is illustrative QAR.
- All data, costs, demand and planning parameters are synthetic.
- One row represents one warehouse-SKU combination.
- Validate available_qty = on_hand_qty - allocated_qty.
- Validate inventory_value_qAR = on_hand_qty × unit_cost_qAR.
- Suggested replenishment is not an automatic purchase instruction.
