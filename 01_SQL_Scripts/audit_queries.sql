The "Revenue Leak" Query: Calculate the total revenue for every order before and after the Discount was applied.
SELECT 
    o.order_id,
    o.order_date,
    ROUND(SUM(od.unit_price * od.quantity)::numeric, 2) AS gross_revenue,
    ROUND(SUM(od.unit_price * od.quantity * (1 - od.discount))::numeric, 2) AS net_revenue,
    ROUND(SUM(od.unit_price * od.quantity * od.discount)::numeric, 2) AS total_discount_value
FROM orders o
JOIN order_details od ON o.order_id = od.order_id
GROUP BY o.order_id, o.order_date
ORDER BY total_discount_value DESC;


The "Slow Movers" Audit: Use a LEFT JOIN to find products that have been in the catalog but have had zero sales in the last 6 months.
SELECT 
    p.product_id, 
    p.product_name, 
    c.category_name,
    p.unit_price
FROM products p
INNER JOIN categories c ON p.category_id = c.category_id
LEFT JOIN order_details od ON p.product_id = od.product_id
LEFT JOIN orders o ON od.order_id = o.order_id 
    -- Updated line for PostgreSQL:
    AND o.order_date >= CURRENT_DATE - INTERVAL '6 months'
WHERE o.order_id IS NULL
ORDER BY p.product_name;


Subqueries/CTEs: Write a query to find the "Most Valuable Employee." Rank them by the total revenue they generated, but only for orders that were shipped on time.
WITH ShippedOnTime AS (
    SELECT 
        o.employee_id, 
        (od.unit_price * od.quantity * (1 - od.discount)) AS LineTotal
    FROM orders o
    JOIN order_details od ON o.order_id = od.order_id
    WHERE o.shipped_date <= o.required_date
      AND o.employee_id IS NOT NULL
)
SELECT 
    employee_id,
    -- Cast the sum to numeric to allow rounding to 2 decimal places
    ROUND(SUM(LineTotal)::numeric, 2) AS Total_On_Time_Revenue,
    RANK() OVER (ORDER BY SUM(LineTotal) DESC) AS Sales_Rank
FROM ShippedOnTime
GROUP BY employee_id;
