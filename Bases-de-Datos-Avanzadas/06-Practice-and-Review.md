# Unit 1 Practice and Review

**Basis:** The exercise sets in the Unit 1 PDF: customers and provinces, sports-club registrations and absences, publisher/book joins, subqueries, invoice summaries, calculated fields, and functions. English names below are teaching adaptations, not literal Spanish table-name copies.

## Exercises
### Exercise 1 — Customers and provinces
Create `provinces(id, name)` and `customers(id, name, address, city, province_id)`. Add at least three provinces, seven customers, and two customers with unmatched province IDs (if not enforcing foreign keys).
1. Display all customers with province names using INNER JOIN.
2. Sort by province name.
3. Return customers from Santa Fe.
4. Return every customer using LEFT JOIN.
5. Return customers whose province_id has no matching province.

### Exercise 2 — Sports-club absences
Create registrations with fields `document_number`, `student_name`, `sport`, and `paid`; create absences with `document_number`, `sport`, and `absence_date`.
1. Join on **both** document number and sport.
2. Order absences by student and sport.
3. Filter absences for one student in one sport.
4. Filter absences of students who paid membership.

### Exercise 3 — Library and publishers
1. List books and publisher names using INNER JOIN.
2. List every publisher, including one with no book, using LEFT JOIN.
3. Rewrite that query using RIGHT JOIN.
4. Show only publishers with no books.
5. Show books from Siglo XXI sorted by title.

### Exercise 4 — Subqueries
1. Find the highest-price book using a scalar subquery.
2. Find publishers of books by Richard Bach using `IN`.
3. Find books that cost more than ANY Bach book, and then ALL Bach books.
4. Find invoices that contain a pencil with `EXISTS`.
5. Find invoices without pencils with `NOT EXISTS`.
6. Create a correlated subquery returning the total for each invoice.

### Exercise 5 — Aggregation and functions
1. Group invoice lines by invoice number; calculate revenue and units.
2. Display only groups with total above 200 using HAVING.
3. Create a scalar average function and a triangle-area function.
4. Create an inline table-valued function for books by a given author.
5. Use ALTER FUNCTION to extend its result columns.

## Short answer key
- Customer/province join condition: `c.province_id = p.id`.
- Customers with invalid province IDs: `LEFT JOIN ... WHERE p.id IS NULL`.
- Registration/absence join condition: `r.document_number = a.document_number AND r.sport = a.sport`.
- Maximum-price condition: `price = (SELECT MAX(price) FROM books)`.
- Publisher IDs for an author: `p.id IN (SELECT publisher_id FROM books WHERE author = 'Richard Bach')`.
- Invoice total: `SUM(unit_price * quantity)`.
- Group filter: `HAVING SUM(unit_price * quantity) > 200`.
- No matching record: `NOT EXISTS (SELECT 1 ...)`.

## Knowledge-check quiz
1. Why can an INNER JOIN omit a row from the first table?
2. Which table's rows are always kept by LEFT JOIN?
3. Why is `IS NULL` required instead of `= NULL`?
4. What is the difference between `> ANY` and `> ALL`?
5. What makes a subquery correlated?
6. What does `COUNT(*)` count?
7. What is the difference between WHERE and HAVING?
8. How does a scalar function differ from a table-valued function?
9. Why should we run dangerous UPDATE/DELETE examples in a test database?
10. What is the effect of adding `ORDER BY title DESC`?

## Suggested submission checklist
- [ ] SQL scripts saved and executed in SQL Server
- [ ] Screenshots show input queries and results
- [ ] Exercise explanations are in English
- [ ] No real personal information or credentials committed
- [ ] All required university instructions checked separately in Classroom

*These are study exercises based on the supplied PDF, not verified live assignments from Google Classroom.*
