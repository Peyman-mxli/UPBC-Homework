# Advanced Databases | Unit 1: Data Extraction (DQL)

**Course:** Advanced Databases (Bases de Datos Avanzadas)  
**University:** Universidad Politécnica de Baja California (UPBC)  
**Student:** Peyman Miyandashti  
**Classroom:** https://classroom.google.com/c/ODc2NzA0MTE4NDM0  
**Source:** *APUNTES U1.pdf*, 66-page class handout.  
**Language:** English throughout. **Database dialect:** Microsoft SQL Server / T-SQL.

## Learning objectives
1. Create and populate relational tables in SQL Server.
2. Join two tables using INNER, LEFT, RIGHT, and related joins.
3. Query using scalar, IN, ANY/SOME/ALL, correlated, and EXISTS subqueries.
4. Compute aggregates and calculated fields.
5. Create and modify scalar and table-valued user-defined functions.
6. Complete the unit's exercises and explain query results.

## Course contents
| Order | File | Focus |
|---|---|---|
| 1 | [01-Relational-Basics-and-Inner-Joins.md](01-Relational-Basics-and-Inner-Joins.md) | Tables, keys, aliases, INNER JOIN |
| 2 | [02-Outer-Joins.md](02-Outer-Joins.md) | LEFT, RIGHT, FULL and unmatched rows |
| 3 | [03-Subqueries.md](03-Subqueries.md) | Scalar, IN, ANY, ALL, EXISTS, correlated queries |
| 4 | [04-Calculated-Fields-and-Grouping.md](04-Calculated-Fields-and-Grouping.md) | Aggregates and GROUP BY |
| 5 | [05-User-Defined-Functions.md](05-User-Defined-Functions.md) | Scalar functions and inline table-valued functions |
| 6 | [06-Practice-and-Review.md](06-Practice-and-Review.md) | Assignments, explanations, quiz |
| 7 | [sql/01-library-joins.sql](sql/01-library-joins.sql) | Runnable sample library database |
| 8 | [sql/02-invoices-and-subqueries.sql](sql/02-invoices-and-subqueries.sql) | Runnable invoices and correlated queries |

## How to study
Install SQL Server (Developer or Express) and SQL Server Management Studio, open a new query, then run one SQL example at a time. Read the matching lesson before running the scripts. Execute sample scripts in a **test database only**: setup uses DROP TABLE and DELETE may appear in explanatory material.

The original PDF is a teaching handout. The notes below paraphrase and organize its instructional material in English, supplementing it with clearly labeled learning examples. The sample code intentionally corrects minor syntax and reference issues where necessary for standalone execution; it is not a verbatim transcription. SQL Server is the target dialect, not PostgreSQL or SQLite.

## SQL command quick reference
- `CREATE DATABASE`: create database
- `CREATE TABLE`: create table
- `INSERT`: add rows
- `SELECT ... FROM`: retrieve columns from tables
- `JOIN ... ON`: combine matching rows
- `WHERE`: filter rows
- `ORDER BY`: sort output
- `GROUP BY`: group rows
- `HAVING`: filter groups
- `CREATE FUNCTION`: define reusable functions

**Note:** Adding this folder to GitHub does not create or alter anything inside Google Classroom; the classroom URL is included only as a course reference.
