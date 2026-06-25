SELECT COUNT(CASE WHEN order_delivered_customer_date > order_estimated_delivery_date THEN 1 END) AS delayed_orders,
COUNT(*) AS total_orders_count,
customer_state,
ROUND((COUNT(CASE WHEN order_delivered_customer_date > order_estimated_delivery_date THEN 1.0 END)) * 100.0 / COUNT(*),2)  AS delay_rate
FROM orders
LEFT JOIN customers ON orders.customer_id = customers.customer_id
WHERE order_status = 'delivered' GROUP BY customer_state ORDER BY delay_rate DESC;
