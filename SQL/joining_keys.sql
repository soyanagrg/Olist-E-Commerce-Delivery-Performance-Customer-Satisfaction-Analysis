-- JOINING keys

SELECT COUNT(*) AS orders_without_customer
FROM olist.orders_dataset
LEFT JOIN olist.customer_dataset ON olist.orders_dataset.customer_id = olist.customer_dataset.customer_id
WHERE olist.customer_dataset.customer_id IS NULL;

SELECT COUNT(*) AS items_without_order
FROM olist.order_items_dataset
LEFT JOIN olist.orders_dataset ON olist.order_items_dataset.order_id = olist.orders_dataset.order_id
WHERE olist.orders_dataset.order_id IS NULL;