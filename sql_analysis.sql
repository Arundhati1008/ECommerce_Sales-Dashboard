CREATE DATABASE ecommerce_project;
USE ecommerce_project;

SELECT COUNT(*) FROM transactions;

DESCRIBE transactions;

create index idx_customer
on transactions(`Customer ID`);

create index idx_invoice
on transactions (InvoiceDate);

alter table transactions 
add column InvoiceDate_new DATETIME;

SET SQL_SAFE_UPDATES = 0;
UPDATE transactions
SET InvoiceDate_new = STR_TO_DATE(InvoiceDate,'%m/%d/%Y %H:%i');

SELECT InvoiceDate, InvoiceDate_new
FROM transactions
LIMIT 10;

ALTER TABLE transactions
DROP COLUMN InvoiceDate;


ALTER TABLE transactions
CHANGE InvoiceDate_new InvoiceDate DATETIME;


CREATE INDEX idx_invoice_date
ON transactions(InvoiceDate);

CREATE INDEX idx_country 
ON transactions(Country);

CREATE INDEX idx_product 
ON transactions(StockCode);

ALTER TABLE transactions
MODIFY StockCode VARCHAR(20);

ALTER TABLE transactions
MODIFY Country VARCHAR(20);


select country, SUM(REVENUE) as total_sales
from transactions 
group by country 
order by total_sales desc;


SELECT 
DATE_FORMAT(InvoiceDate,'%Y-%m') AS month,
SUM(Revenue) AS monthly_sales
FROM transactions
GROUP BY month
ORDER BY month;

select description,sum(quantity) as total_sold
from transactions
group by description 
order by total_sold desc
limit 10;


select `customer id` , sum(revenue) as total_spent 
from transactions
group by `customer id` 
order by total_spent desc 
limit 10;


SELECT
`Customer ID`,
COUNT(DISTINCT Invoice) AS total_orders
FROM transactions
GROUP BY `Customer ID`
HAVING total_orders >1
ORDER BY total_orders DESC;

