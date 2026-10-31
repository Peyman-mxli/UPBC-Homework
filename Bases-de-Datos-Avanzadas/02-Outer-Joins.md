# Lesson 2 — LEFT, RIGHT, and FULL OUTER JOIN

**Source:** Unit 1, section 1.1(b), PDF pages 7–26. FULL OUTER JOIN is included as additional comparison material.

## Example data
`students`: (Ali, 101), (Sara, 102), (Reza, 999).  
`classrooms`: (101, 2AFM), (102, 3B), (103, 4C).

The classroom with ID 999 does not exist; classroom 103 has no student.

## 1. LEFT JOIN
Keep **every row from the left table**. When the right table does not match, its selected columns are `NULL`.

```sql
SELECT s.name AS student, c.name AS classroom
FROM students AS s
LEFT JOIN classrooms AS c ON s.classroom_id = c.id;
```

| student | classroom |
|---|---|
| Ali | 2AFM |
| Sara | 3B |
| Reza | NULL |

To find unmatched students:

```sql
SELECT s.name
FROM students AS s
LEFT JOIN classrooms AS c ON s.classroom_id = c.id
WHERE c.id IS NULL;
```

**Tip:** test missing values with `IS NULL`, not `= NULL`.

## 2. RIGHT JOIN
Keep **every row from the right table**.

```sql
SELECT s.name AS student, c.name AS classroom
FROM students AS s
RIGHT JOIN classrooms AS c ON s.classroom_id = c.id;
```

| student | classroom |
|---|---|
| Ali | 2AFM |
| Sara | 3B |
| NULL | 4C |

The same result can be written using LEFT JOIN after switching table order:

```sql
SELECT s.name AS student, c.name AS classroom
FROM classrooms AS c
LEFT JOIN students AS s ON c.id = s.classroom_id;
```

## 3. FULL OUTER JOIN
Keep **every row from both tables**, including rows without matches.

```sql
SELECT s.name AS student, c.name AS classroom
FROM students AS s
FULL OUTER JOIN classrooms AS c ON s.classroom_id = c.id;
```

| student | classroom |
|---|---|
| Ali | 2AFM |
| Sara | 3B |
| Reza | NULL |
| NULL | 4C |

## 4. When JOIN conditions and WHERE matter
```sql
-- Show only publishers with no books
SELECT p.name
FROM publishers AS p
LEFT JOIN books AS b ON b.publisher_id = p.id
WHERE b.id IS NULL;
```

Filtering the right side in a `WHERE` clause can accidentally remove the unmatched rows of a LEFT JOIN. For example, `WHERE b.price > 20` excludes rows where `b.price` is NULL. If retaining every left row matters, consider applying the condition within `ON` instead.

## 5. Side-by-side
| Join | Keeps |
|---|---|
| INNER | matching left/right combinations |
| LEFT | all left rows and matching right rows |
| RIGHT | all right rows and matching left rows |
| FULL OUTER | all rows on both sides |

**Handout exercises:** the customers/provinces example asks for all customers, those with valid province codes, and those with province codes that are missing from the province table. The latter is an excellent `LEFT JOIN ... WHERE p.id IS NULL` exercise.
