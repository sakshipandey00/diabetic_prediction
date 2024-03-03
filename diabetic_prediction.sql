SELECT * FROM sales.customers;
SELECT * FROM sales.transactions;
SELECT * FROM sales.products;
SELECT * FROM sales.markets;
SELECT COUNT(*) FROM sales.transactions;
SELECT COUNT(*) FROM sales.customers;

--Select Chennia record

SELECT COUNT(*) FROM sales.transactions WHERE market_code = "Mark001";

# See Currency in usd
SELECT * FROM transactions WHERE currency = "USD";

--Join to table to see transactions in 2020

SELECT * 
FROM transactions as t
INNER JOIN date as d
ON t.order_date = d.date
WHERE year = 2020;

SELECT SUM(sales_amount)
FROM transactions as t
INNER JOIN date as d
ON t.order_date = d.date
WHERE year = 2020;

--For 2019
SELECT SUM(sales_amount)
FROM transactions as t
INNER JOIN date as d
ON t.order_date = d.date
WHERE year = 2019 AND market_code = "Mark001";

SELECT DISTINCT product_code FROM transactions WHERE market_code = "Mark001";