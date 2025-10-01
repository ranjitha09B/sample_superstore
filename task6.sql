use evlda;

SELECT `Order Date`
FROM `sample - superstore`
LIMIT 10;

SELECT 
    DATE_FORMAT(STR_TO_DATE(`Order Date`, '%m/%d/%Y'), '%Y-%m') AS order_year_month,
    SUM(Sales) AS Total_revenue,
    COUNT(DISTINCT `Order ID`) AS order_volume
FROM `sample - superstore`
GROUP BY order_year_month
ORDER BY order_year_month;

