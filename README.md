# sample_superstore  
# 1️⃣ Query 1 – Checking Raw Dates
SELECT `Order Date`
FROM `sample - superstore`
LIMIT 10;

# Purpose:

This query is a sanity check.

You want to see what format the dates are stored in before running any aggregation.

# Breakdown:

SELECT Order Date → selects only the column Order Date.

FROM sample - superstore → pulls data from the table sample - superstore.

LIMIT 10 → restricts output to the first 10 rows (helps in quickly previewing without scrolling through the entire dataset).  
# Why it’s needed:

In the Superstore dataset, Order Date is usually stored as a string (MM/DD/YYYY, e.g., 11/8/2016).

Since MySQL needs proper date formatting for grouping (by year/month), this check tells us what conversion functions we must use later.
# 2️⃣ Query 2 – Aggregating Revenue & Orders by Month
SELECT 
    DATE_FORMAT(STR_TO_DATE(`Order Date`, '%m/%d/%Y'), '%Y-%m') AS order_year_month,
    SUM(Sales) AS Total_revenue,
    COUNT(DISTINCT `Order ID`) AS order_volume
FROM `sample - superstore`
GROUP BY order_year_month
ORDER BY order_year_month;

# Purpose:

To analyze sales trends over time by grouping data by Year-Month.

It gives you monthly revenue and order volume.

# Breakdown:

Date Conversion:

STR_TO_DATE(`Order Date`, '%m/%d/%Y')


Converts text dates (11/8/2016) into proper DATE objects so MySQL can work with them.

Date Formatting:

DATE_FORMAT(..., '%Y-%m') AS order_year_month


Extracts Year and Month only (e.g., 2016-11).

Aliased as order_year_month.

Revenue Calculation:

SUM(Sales) AS Total_revenue


Adds up all sales values per month.

Shows you the total revenue generated each month.

Order Volume Calculation:

COUNT(DISTINCT `Order ID`) AS order_volume


Counts unique orders placed in each month (avoids double-counting items in the same order).

Grouping:

GROUP BY order_year_month


Groups all rows by their year-month.

Sorting:

ORDER BY order_year_month


Ensures the report is listed in chronological order.  
# 📈 Insights You Get:

Seasonality of Sales → Identify peak months (e.g., Nov/Dec usually higher due to holiday sales).

Order Volume vs Revenue → Compare whether high sales months come from more orders or higher-value orders.

Year-on-Year Growth → Spot revenue growth patterns across years.
