# Lesson 5 — User-Defined Functions in SQL Server

**Source:** Unit 1's later "User-Created Functions" section and examples.

A SQL Server **user-defined function** packages reusable logic. SQL Server supports scalar functions (one value) and table-valued functions (rows/columns).

## 1. Scalar function: average of two numbers
```sql
CREATE FUNCTION dbo.fn_average
(
    @first DECIMAL(8,2),
    @second DECIMAL(8,2)
)
RETURNS DECIMAL(9,2)
AS
BEGIN
    DECLARE @answer DECIMAL(9,2);
    SET @answer = (@first + @second) / 2;
    RETURN @answer;
END;
GO

SELECT dbo.fn_average(5.50, 8.50) AS average_result;
-- 7.00
```

- `CREATE FUNCTION` defines it.
- `dbo` is the schema.
- `@first`, `@second` are input parameters.
- `RETURNS` declares the result type.
- `DECLARE` creates a local variable.
- `SET` assigns a value.
- `RETURN` supplies the result.

## 2. Scalar function: area of a triangle
Formula: **area = (base × height) / 2**.

```sql
CREATE FUNCTION dbo.fn_triangle_area
(
    @base FLOAT,
    @height FLOAT
)
RETURNS FLOAT
AS
BEGIN
    RETURN (@base * @height) / 2;
END;
GO

SELECT dbo.fn_triangle_area(10, 6) AS area;
-- 30
```

## 3. Inline table-valued function
Return a filtered table of books for an author:

```sql
CREATE FUNCTION dbo.fn_books_by_author
(
    @author VARCHAR(50)
)
RETURNS TABLE
AS
RETURN
(
    SELECT title, author, price
    FROM dbo.books
    WHERE author LIKE '%' + @author + '%'
);
GO

SELECT * FROM dbo.fn_books_by_author('Bach');
```

## 4. ALTER FUNCTION
To modify an existing function, use `ALTER FUNCTION` and provide its full updated definition:

```sql
ALTER FUNCTION dbo.fn_books_by_author(@author VARCHAR(50))
RETURNS TABLE
AS
RETURN
(
    SELECT id, title, author, price
    FROM dbo.books
    WHERE author LIKE '%' + @author + '%'
);
GO
```

## 5. Handout exercises
- Create a practice store database (the handout calls it **ALMACEN300**) and an inline table-valued function returning products whose price is at least 100.
- Create a department-based product lookup, then alter it to include price.
- Create a company practice database (**EMPRESA020**) with department and employee tables, then query accounting employees and employees with the greatest seniority.

Illustrative function for the store exercise (assumes `dbo.Products(name, price)` exists):

```sql
CREATE FUNCTION dbo.fn_products_at_least_100()
RETURNS TABLE
AS
RETURN
(
    SELECT name, price
    FROM dbo.Products
    WHERE price >= 100
);
```

**Caution:** In SQL Server, `CREATE FUNCTION` must begin an appropriate batch. Use `GO` between setup scripts and separate function definitions in SSMS. These examples are meant for SQL Server rather than PostgreSQL.
