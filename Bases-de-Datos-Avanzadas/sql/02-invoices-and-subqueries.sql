-- ADVANCED DATABASES — Unit 1: invoice practice
-- Requires running 01-library-joins.sql first.
USE UPBC_AdvancedDatabases_Practice;
GO
IF OBJECT_ID('dbo.invoice_lines','U') IS NOT NULL DROP TABLE dbo.invoice_lines;
IF OBJECT_ID('dbo.invoices','U') IS NOT NULL DROP TABLE dbo.invoices;
GO
CREATE TABLE dbo.invoices (
    invoice_no INT PRIMARY KEY,
    invoice_date DATE NOT NULL,
    customer VARCHAR(50) NOT NULL
);
CREATE TABLE dbo.invoice_lines (
    invoice_no INT NOT NULL,
    line_no INT NOT NULL,
    item VARCHAR(50) NOT NULL,
    unit_price DECIMAL(9,2) NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY(invoice_no,line_no),
    CONSTRAINT FK_invoice_lines_invoices
        FOREIGN KEY(invoice_no) REFERENCES dbo.invoices(invoice_no)
);
INSERT dbo.invoices VALUES
(1200,'2018-01-15','Juan Lopez'),
(1201,'2018-01-15','Luis Torres'),
(1202,'2018-01-15','Ana Garcia'),
(1300,'2018-01-20','Juan Lopez');
INSERT dbo.invoice_lines VALUES
(1200,1,'pencil',1.00,100),(1200,2,'eraser',0.50,150),
(1201,1,'ruler',1.50,80),(1201,2,'eraser',0.50,200),
(1201,3,'notebook',4.00,90),(1202,1,'pencil',1.00,200),
(1202,2,'triangle',2.00,100),(1300,1,'pencil',1.00,300);
-- 1. Correlated invoice totals and line counts
SELECT i.invoice_no,i.customer,
       (SELECT COUNT(*) FROM dbo.invoice_lines AS d
        WHERE d.invoice_no=i.invoice_no) AS line_count,
       (SELECT SUM(d.unit_price*d.quantity) FROM dbo.invoice_lines AS d
        WHERE d.invoice_no=i.invoice_no) AS total
FROM dbo.invoices AS i;
-- 2. EXISTS: invoices containing pencils
SELECT i.invoice_no,i.customer FROM dbo.invoices AS i
WHERE EXISTS (SELECT 1 FROM dbo.invoice_lines AS d
  WHERE d.invoice_no=i.invoice_no AND d.item='pencil');
-- 3. NOT EXISTS: invoices without pencils
SELECT i.invoice_no,i.customer FROM dbo.invoices AS i
WHERE NOT EXISTS (SELECT 1 FROM dbo.invoice_lines AS d
  WHERE d.invoice_no=i.invoice_no AND d.item='pencil');
-- 4. GROUP BY and HAVING
SELECT invoice_no,SUM(quantity) AS units,
       SUM(unit_price*quantity) AS total
FROM dbo.invoice_lines
GROUP BY invoice_no
HAVING SUM(unit_price*quantity)>200
ORDER BY invoice_no;
GO
