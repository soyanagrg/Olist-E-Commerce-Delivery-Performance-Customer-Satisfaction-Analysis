-- ROWS COUNT

SELECT 'customer_id',               COUNT(*) FROM olist.customer_dataset
UNION ALL
SELECT 'geolocation_zip_code_prefix',          COUNT(*) FROM olist.geolocation_dataset
UNION ALL
SELECT 'order_id', COUNT(*) FROM olist.order_items_dataset
UNION ALL
SELECT 'order_id', COUNT(*) FROM order_payments_dataset
UNION ALL
SELECT 'review_id', COUNT(*) FROM order_reviews_dataset
UNION ALL
SELECT 'order_id', COUNT(*) FROM orders_dataset
UNION ALL
SELECT 'product_category_name', COUNT(*) FROM product_category_name_translation
UNION ALL
SELECT 'product_id', COUNT(*) FROM products_dataset
UNION ALL
SELECT 'seller_id', COUNT(*) FROM olist.sellers_dataset;