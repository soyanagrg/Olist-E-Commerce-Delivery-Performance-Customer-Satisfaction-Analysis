-- Question 2: Which categoroes and routes have the highest late rates?
WITH base AS (
    SELECT
        o.order_id,
        o.customer_id,
        o.order_purchase_timestamp,
        o.order_delivered_carrier_date,
        o.order_delivered_customer_date,
        o.order_estimated_delivered_date,
        DATEDIFF(o.order_delivered_customer_date,
                 o.order_estimated_delivered_date)  AS delivery_delay_days,
        DATEDIFF(o.order_delivered_carrier_date,
                 o.order_purchase_timestamp)        AS seller_processing_days,
        DATEDIFF(o.order_delivered_customer_date,
                 o.order_delivered_carrier_date)    AS carrier_days,
        c.customer_state,
        s.seller_state,
        CONCAT(s.seller_state, ' -> ', c.customer_state) AS route,
        COALESCE(t.product_category_name_english,
                 p.product_category_name)           AS category,
        oi.price + oi.freight_value                 AS order_value,
        r.review_score
    FROM olist.orders_dataset o
    JOIN olist.customer_dataset c       ON o.customer_id  = c.customer_id
    JOIN olist.order_items_dataset oi   ON o.order_id     = oi.order_id
    JOIN olist.sellers_dataset s        ON oi.seller_id   = s.seller_id
    JOIN olist.products_dataset p       ON oi.product_id  = p.product_id
    LEFT JOIN olist.product_category_name_translation t
           ON p.product_category_name = t.product_category_name
    LEFT JOIN olist.order_reviews_dataset r
           ON o.order_id = r.order_id
    WHERE o.order_status = 'delivered'
      AND o.order_delivered_customer_date  IS NOT NULL
      AND o.order_estimated_delivered_date IS NOT NULL
),
flagged AS (
    SELECT *,
        CASE WHEN delivery_delay_days > 0 THEN 1 ELSE 0 END AS is_late,
        CASE
            WHEN delivery_delay_days <= 0 THEN 'On Time'
            WHEN delivery_delay_days <= 3 THEN '1-3 Days Late'
            WHEN delivery_delay_days <= 7 THEN '4-7 Days Late'
            ELSE '7+ Days Late'
        END AS delay_bucket
    FROM base
)
SELECT 
	category,
    COUNT(*) AS total_orders,
    SUM(is_late) AS late_orders,
    ROUND(AVG(is_late) * 100, 1) AS late_rate_pct,
    ROUND(AVG(review_score), 2) AS avg_review_score
FROM flagged
GROUP BY category
HAVING COUNT(*) >= 100
ORDER BY late_rate_pct DESC
LIMIT 10;