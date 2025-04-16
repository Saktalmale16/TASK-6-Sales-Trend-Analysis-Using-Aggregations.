
use online_sales ;
CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  order_date DATE,
  amount DECIMAL(10,2),
  product_id INT
);

INSERT INTO orders (order_id, order_date, amount, product_id) VALUES
(101, '2023-01-10', 250.00, 1),
(102, '2023-01-15', 180.00, 2),
(103, '2023-02-01', 320.00, 1),
(104, '2023-02-20', 150.00, 3),
(105, '2023-03-05', 500.00, 2),
(106, '2023-03-18', 400.00, 1),
(107, '2023-04-01', 220.00, 4),
(108, '2023-04-15', 330.00, 2),
(109, '2023-05-02', 600.00, 3),
(110, '2023-05-20', 450.00, 1);

select * from orders ;

# 🔹 a. Use EXTRACT(MONTH FROM order_date) for month

SELECT
  EXTRACT(YEAR FROM order_date) AS order_year,
  EXTRACT(MONTH FROM order_date) AS order_month
FROM orders;



# 🔹 b. GROUP BY year/month

SELECT
  EXTRACT(YEAR FROM order_date) AS order_year,
  EXTRACT(MONTH FROM order_date) AS order_month
FROM orders
GROUP BY order_year, order_month;


# 🔹 c. Use SUM() for revenue
SELECT
  EXTRACT(YEAR FROM order_date) AS order_year,
  EXTRACT(MONTH FROM order_date) AS order_month,
  SUM(amount) AS total_revenue
FROM orders
GROUP BY EXTRACT(YEAR FROM order_date), EXTRACT(MONTH FROM order_date);


# 🔹 d. Use COUNT(DISTINCT order_id) for volume.

SELECT
  EXTRACT(YEAR FROM order_date) AS order_year,
  EXTRACT(MONTH FROM order_date) AS order_month,
  SUM(amount) AS total_revenue,
  COUNT(DISTINCT order_id) AS total_orders
FROM orders
GROUP BY EXTRACT(YEAR FROM order_date), EXTRACT(MONTH FROM order_date);


# 🔹 e. Use ORDER BY for sorting.

SELECT
  YEAR(order_date) AS order_year,
  MONTH(order_date) AS order_month,
  SUM(amount) AS total_revenue,
  COUNT(DISTINCT order_id) AS volume
FROM orders
WHERE order_date BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY order_year, order_month;


# 🔹 f. Limit results for specific time periods.

SELECT
  YEAR(order_date) AS order_year,
  MONTH(order_date) AS order_month,
  SUM(amount) AS total_revenue,
  COUNT(DISTINCT order_id) AS total_orders
FROM orders
WHERE order_date BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY YEAR(order_date), MONTH(order_date);
