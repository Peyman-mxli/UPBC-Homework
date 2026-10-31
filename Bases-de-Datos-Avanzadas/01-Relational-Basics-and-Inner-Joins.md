# Lesson 1 — Relational Basics and INNER JOIN

**Source:** Unit 1, section 1.1(a), PDF pages 1–6.

## 1. Why relational tables?
A database stores organized information in **tables**. A row represents one record; a column represents one property. In a library, the books table has a `publisher_id`, while the publishers table holds the publisher's actual name.

**Primary key:** uniquely identifies a record, for example `publishers.id`.  
**Foreign key:** holds a reference to a primary key, for example `books.publisher_id`.  
**DQL:** Data Query Language, commonly `SELECT` statements.

Illustration:

**publishers**: `(1, Planeta), (2, Emece), (3, Siglo XXI)`

**books**: `(1, El Aleph, Borges, 2), (2, Martin Fierro, Jose Hernandez, 1), (3, Learn PHP, Mario Molina, 3)`

## 2. INNER JOIN
An INNER JOIN returns *only rows for which the ON condition matches*. The keywords `JOIN` and `INNER JOIN` are equivalent here.

```sql
SELECT b.title, b.author, p.name AS publisher
FROM books AS b
INNER JOIN publishers AS p
    ON b.publisher_id = p.id;
```

Line by line:
1. `SELECT`: choose the desired output columns.
2. `FROM books AS b`: use `b` as a short alias for books.
3. `INNER JOIN publishers AS p`: connect the publisher data.
4. `ON b.publisher_id = p.id`: match each book to its publisher.

Example output:

| title | author | publisher |
|---|---|---|
| El Aleph | Borges | Emece |
| Martin Fierro | Jose Hernandez | Planeta |
| Learn PHP | Mario Molina | Siglo XXI |

Rows without a matching publisher do not appear in an INNER JOIN.

## 3. Filtering and sorting
```sql
SELECT b.title, b.author, p.name AS publisher
FROM books AS b
JOIN publishers AS p ON b.publisher_id = p.id
WHERE p.name = 'Siglo XXI'
ORDER BY b.title ASC;
```

`WHERE` filters the matched rows. `ORDER BY` sorts; `ASC` means ascending and `DESC` descending.

## 4. Multiple-column join conditions
The class handout's sports-club exercise has registrations and absences. A registration is identified by **both** document number and sport. Join on both, or you could incorrectly attach a tennis absence to a swimming registration:

```sql
SELECT r.student_name, r.sport, a.absence_date
FROM registrations AS r
JOIN absences AS a
  ON r.document_number = a.document_number
 AND r.sport = a.sport
ORDER BY r.student_name, r.sport, a.absence_date;
```

## 5. Important T-SQL syntax
```sql
CREATE DATABASE LibraryPractice;
GO
USE LibraryPractice;
GO
CREATE TABLE publishers (
    id TINYINT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(30) NOT NULL
);
```

- `IDENTITY(1,1)`: auto-increment starting at 1.
- `VARCHAR(30)`: up to 30 characters.
- `NOT NULL`: value required.
- `GO`: SQL Server tooling batch separator (not itself a T-SQL statement).
- `DEFAULT 'Unknown'`: use a default when a value is omitted.
- `DECIMAL(7,2)`: fixed-precision number with two decimal digits.

**Practice:** show customers, city, and province using two tables; then add `ORDER BY province_name` and filter `WHERE province_name = 'Santa Fe'`.
