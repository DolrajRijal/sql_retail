SELECT * FROM retail_sales;
-- sql query to calculate average sale of each month and find out the best selling month in each year
SELECT 
YEAR(sale_date) AS year,
MONTH(sale_date)AS month,
AVG(total_sale) AS avg_sale
FROM retail_sales
GROUP BY year, month
ORDER BY 1, 3 DESC;

-- WRITE A SQL QUERY  TO FIND TE TOP 5 CUSTOMERS BASED ON HIGHEST TOTAL SALARY




SELECT customer_id, SUM(total_sale) AS total_sales
FROM retail_sales
GROUP  BY customer_id
ORDER BY 2 DESC
LIMIT 5;

-- SQL QUERY TO FIND THE NO OF UNIQUE CUSTOMERS WHO PURCHASED ITEMS FROM EACH CATEGORY

SELECT 
category, COUNT(DISTINCT customer_id)
FROM retail_sales
GROUP BY category;
  
  
WITH hourly_saleS 
AS
(
SELECT 
	CASE
		WHEN HOUR(sale_time) < 12 THEN 'Morning'
		WHEN HOUR(sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
		ELSE 'Evening'
	END AS shift
    FROM retail_sales
    )
    SELECT 
    shift,
    COUNT(*) AS total_orders
    FROM hourly_sales
    GROUP BY shift
    

	