# Lesson 4 — Calculated Fields, Aggregate Functions, and Grouping

**Source:** Unit 1, section 1.3 ("Calculated Fields" and grouping functions).

## 1. Calculated fields
```sql
SELECT item, unit_price, quantity,
       unit_price * quantity AS line_total
FROM invoice_lines;
```

The expression creates a calculated output column; `AS line_total` names it. It does not change stored data.

## 2. Aggregates
| Function | Result | Example |
|---|---|---|
| `COUNT(*)` | number of rows | how many sales lines? |
| `COUNT(column)` | non-NULL values in column | how many recorded prices? |
| `SUM(column)` | total | how many units? |
| `AVG(column)` | average | average price? |
| `MIN(column)` | smallest | least expensive? |
| `MAX(column)` | largest | most expensive? |

```sql
SELECT COUNT(*) AS rows_count,
       SUM(quantity) AS units,
       AVG(unit_price) AS average_unit_price,
       MIN(unit_price) AS lowest_price,
       MAX(unit_price) AS highest_price
FROM invoice_lines;
```

For quantities 5, 3, and 10, `SUM(quantity)` is 18. For prices 10, 30, and 5, `AVG(price)` is 15.

`AVG`, `SUM`, `MIN`, and `MAX` ignore NULL values. `COUNT(*)` counts rows even when columns are NULL.

## 3. GROUP BY
Return totals by invoice:

```sql
SELECT invoice_no,
       SUM(unit_price * quantity) AS invoice_total
FROM invoice_lines
GROUP BY invoice_no
ORDER BY invoice_no;
```

Every nonaggregated column in the SELECT list must be grouped (or be an expression of grouped columns under SQL Server's grouping rules).

## 4. WHERE versus HAVING
```sql
SELECT invoice_no,
       SUM(unit_price * quantity) AS invoice_total
FROM invoice_lines
WHERE quantity > 0
GROUP BY invoice_no
HAVING SUM(unit_price * quantity) > 200;
```

- `WHERE` removes individual rows before groups are formed.
- `GROUP BY` organizes the remaining rows.
- `HAVING` removes groups that fail the aggregate condition.
- `ORDER BY` sorts final output.

## 5. DISTINCT
```sql
SELECT DISTINCT item FROM invoice_lines;
```
Returns each item name once; contrast with `COUNT(DISTINCT item)`, which counts distinct non-NULL items.

**Practice:** compute total quantity and total amount per invoice; then display only invoices with totals above 200.
