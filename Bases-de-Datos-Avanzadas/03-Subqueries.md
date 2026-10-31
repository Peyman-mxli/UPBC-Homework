# Lesson 3 — Subqueries

**Source:** Unit 1, section 1.2, PDF pages 27 onward (examples: scalar, IN, ANY/SOME/ALL, correlated, EXISTS, self-join, derived table).

A **subquery** is a query nested within another statement. Most appear inside parentheses. They can be used in `SELECT`, `WHERE`, `FROM`, and data modification statements. Their result can be a single value, a list, or a relation.

## 1. Scalar subquery (single value)
Find the most expensive book:

```sql
SELECT title, price
FROM books
WHERE price = (SELECT MAX(price) FROM books);
```

The inner query returns the maximum price; the outer query returns *every* book tied at that price.

Calculate each price difference from the maximum:

```sql
SELECT title, price,
       price - (SELECT MAX(price) FROM books) AS difference_from_max
FROM books;
```

## 2. IN and NOT IN
Find publishers that have books by Richard Bach:

```sql
SELECT p.name
FROM publishers AS p
WHERE p.id IN (
    SELECT b.publisher_id
    FROM books AS b
    WHERE b.author = 'Richard Bach'
);
```

`IN` checks membership. `NOT IN` checks non-membership, but if the subquery returns NULL, `NOT IN` can produce unexpected results; a correlated `NOT EXISTS` is often safer.

## 3. ANY, SOME, ALL
Imagine the subquery returns three book prices: `15, 18, 20`.

- `price > ANY (...)` means price is greater than **at least one** of them. Price 17 qualifies.
- `price > ALL (...)` means price is greater than **every** value. Price 21 qualifies.
- `SOME` is a synonym of `ANY`.

```sql
SELECT title, price
FROM books
WHERE author = 'Borges'
  AND price > ANY (
      SELECT price FROM books WHERE author = 'Richard Bach'
  );
```

Change `ANY` to `ALL` to require being more expensive than **all** of Bach's books. **Important:** `= ALL` is more restrictive than `= ANY` when the returned values differ.

## 4. Correlated subquery
An inner query references a row from the outer query. The handout illustrates invoices and their line items.

```sql
SELECT i.invoice_no, i.customer,
       (SELECT COUNT(*) FROM invoice_lines AS d
        WHERE d.invoice_no = i.invoice_no) AS line_count,
       (SELECT SUM(d.unit_price * d.quantity)
        FROM invoice_lines AS d
        WHERE d.invoice_no = i.invoice_no) AS invoice_total
FROM invoices AS i;
```

For an invoice containing 100 pencils at 1.00 and 150 erasers at 0.50, the total is `100 + 75 = 175`. `COUNT(*)` counts **line items**, not units purchased; use `SUM(quantity)` for total units.

## 5. EXISTS and NOT EXISTS
`EXISTS` is true when the subquery returns at least one row. `SELECT 1` is common because the returned column's value does not matter.

```sql
SELECT i.invoice_no, i.customer
FROM invoices AS i
WHERE EXISTS (
    SELECT 1
    FROM invoice_lines AS d
    WHERE d.invoice_no = i.invoice_no
      AND d.item = 'pencil'
);
```

Use `NOT EXISTS` to find invoices without pencils.

## 6. A table joined to itself
To compare books with the same title and author but different publishers:

```sql
SELECT DISTINCT a.title, a.author
FROM books AS a
JOIN books AS b
  ON a.title = b.title
 AND a.author = b.author
WHERE a.publisher_id <> b.publisher_id;
```

This is a self-join (the handout discusses a related subquery/self-comparison exercise).

## 7. Derived table in FROM
```sql
SELECT expensive.title, expensive.price
FROM (
    SELECT title, price
    FROM books
    WHERE price > 20
) AS expensive;
```

The inner query becomes a temporary result set with required alias `expensive`.

## 8. Safety around UPDATE and DELETE
The handout uses subqueries to update the highest-priced book and delete the cheapest. Always preview affected rows with a `SELECT` and run on practice data first. More than one book can tie for the minimum or maximum.
