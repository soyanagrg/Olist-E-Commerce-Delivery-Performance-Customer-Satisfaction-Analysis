-- CHECKING FOR NULLS AND DUPLICATES

-- CHECKING NULLS
SELECT
	COUNT(*) AS total_rows,
    SUM(CASE WHEN order_id IS NULL THEN 1 ELSE 0 END) AS null_order_id,
    SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS null_customer_id,
    SUM(CASE WHEN order_status IS NULL THEN 1 ELSE 0 END) AS null_order_status,
    SUM(CASE WHEN order_purchase_timestamp IS NULL THEN 1 ELSE 0 END) AS null_order_purchase_timestamp,
    SUM(CASE WHEN order_approved_at IS NULL THEN 1 ELSE 0 END) AS null_order_approved_at,
    SUM(CASE WHEN order_delivered_carrier_date IS NULL THEN 1 ELSE 0 END) AS null_order_delivered_carrier_date,
    SUM(CASE WHEN order_delivered_customer_date IS NULL THEN 1 ELSE 0 END) AS null_order_delivered_customer_date,
    SUM(CASE WHEN order_estimated_delivered_date IS NULL THEN 1 ELSE 0 END) AS null_order_estimated_delivered_date
FROM olist.orders_dataset;

-- CHECKING FOR DUPLICATES

SELECT order_id, COUNT(*) AS count
FROM olist.orders_dataset
GROUP BY order_id
HAVING COUNT(*) > 1;

