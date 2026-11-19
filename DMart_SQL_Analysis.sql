USE dmart_analytics;
DESCRIBE dmart_sales;

SELECT COUNT(*) AS total_records
FROM dmart_sales;

#Q. Which product category generates the highest sales?
SELECT
    category,
    SUM(sales) AS total_sales
FROM dmart_sales
GROUP BY category
ORDER BY total_sales DESC;

#Q. Find the most profitable category
SELECT
    category,
    SUM(profit) AS total_profit
FROM dmart_sales
GROUP BY category
ORDER BY total_profit DESC;

#Q. Which region generates the highest sales 
SELECT
    region,
    SUM(sales) AS total_sales
FROM dmart_sales
GROUP BY region
ORDER BY total_sales DESC;

#Q. Find the most profitable region
SELECT
    region,
    SUM(profit) AS total_profit
FROM dmart_sales
GROUP BY region
ORDER BY total_profit DESC;

#Q.Find out which customer type generates the highest sales
SELECT
    customer_type,
    SUM(sales) AS total_sales
FROM dmart_sales
GROUP BY customer_type
ORDER BY total_sales DESC;

#Q. Which payment mode is most popular
SELECT
    payment_mode,
    COUNT(*) AS total_orders
FROM dmart_sales
GROUP BY payment_mode
ORDER BY total_orders DESC;

#Q. Does a higher discount affect profit
SELECT
    discount,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM dmart_sales
GROUP BY discount
ORDER BY discount;

#Q. Calculate overall profit margin
SELECT
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    ROUND(
        SUM(profit) / SUM(sales) * 100, 2
    ) AS profit_margin_percentage
FROM dmart_sales;

# Monthly sales trend
SELECT
    YEAR(STR_TO_DATE(order_date, '%d-%m-%Y')) AS sales_year,
    MONTH(STR_TO_DATE(order_date, '%d-%m-%Y')) AS sales_month,
    SUM(sales) AS monthly_sales
FROM dmart_sales
GROUP BY sales_year, sales_month
ORDER BY sales_year, sales_month;

# Delivery time analysis
SELECT
    ROUND(
        AVG(
            DATEDIFF(
                STR_TO_DATE(delivery_date, '%d-%m-%Y'),
                STR_TO_DATE(order_date, '%d-%m-%Y')
            )
        ), 2
    ) AS average_delivery_days
FROM dmart_sales;