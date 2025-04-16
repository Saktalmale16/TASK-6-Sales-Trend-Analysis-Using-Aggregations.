# TASK-6-Sales-Trend-Analysis-Using-Aggregations.
## Task 6: Sales Trend Analysis Using Aggregations

**Objective:**  
Analyze monthly revenue and order volume using SQL aggregations.

**Tools Used:**  
MySQL (compatible with PostgreSQL / SQLite)

**Dataset:**  
`orders` table from `online_sales` database  
- Columns: `order_id`, `order_date`, `amount`, `product_id`

---

### 🔍 Task Breakdown

- **a.** Extract year and month from the `order_date` column
- **b.** Group the results by year and month
- **c.** Calculate total revenue using `SUM(amount)`
- **d.** Calculate total order volume using `COUNT(DISTINCT order_id)`
- **e.** Sort results by year and month
- **f.** Limit the results to a specific time period (2023)

---

### 🧠 Insights Generated

This query helps identify monthly trends in sales and order volume, which can be used for:
- Understanding seasonality
- Planning inventory
- Marketing strategies based on high/low sales periods

![image alt](https://github.com/Saktalmale16/TASK-6-Sales-Trend-Analysis-Using-Aggregations./blob/main/sql%20query%20image.PNG)
---

### 🧾 SQL Query Used

```sql
SELECT
  EXTRACT(YEAR FROM order_date) AS order_year,
  EXTRACT(MONTH FROM order_date) AS order_month,
  SUM(amount) AS total_revenue,
  COUNT(DISTINCT order_id) AS total_orders
FROM orders
WHERE order_date BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY EXTRACT(YEAR FROM order_date), EXTRACT(MONTH FROM order_date)
ORDER BY order_year, order_month;










