# Multi-Warehouse Inventory Visibility

## Business problem
Compare on-hand, allocated, available and reorder positions across warehouse locations.

## Dataset
Use the shared synthetic dataset at `../../data/inventory_snapshot.csv`.
For stock reconciliation, also use `../../data/physical_count.csv`.

> **Data note:** These are synthetic demonstration records created for portfolio practice. They are not company data.

## Business questions
1. What does the data reveal about the current inventory position?
2. Which SKUs, categories or warehouses require management attention?
3. What is the financial or service-level implication?
4. What action should the inventory or supply chain manager take?

## Suggested KPIs
- Total on-hand quantity
- Available stock
- Inventory value
- Exception count
- Warehouse/category contribution
- Relevant project-specific measures

## Practical exercises
1. Clean and validate the source data.
2. Build an Excel analysis using PivotTables, formulas and conditional formatting.
3. Write SQL queries to answer the business questions.
4. Create a Power BI report with KPI cards, trend or category visuals, and an exception table.
5. Write a one-page management summary with findings and recommended actions.

## Deliverables
- Cleaned dataset
- Excel analysis workbook
- SQL scripts
- Power BI report (`.pbix`, created in Power BI Desktop)
- Screenshots of key dashboard pages
- Management recommendations

## Definition of done
A reviewer should be able to understand the business problem, reproduce the analysis from the supplied synthetic data, inspect the queries and see how the findings support a decision.
