SELECT ROUND(AVG(review_score),2) AS avg_review, customer_state
FROM orders
LEFT JOIN customers ON orders.customer_id = customers.customer_id
LEFT JOIN order_reviews ON orders.order_id = order_reviews.order_id
WHERE order_status = 'delivered' GROUP BY customer_state ORDER BY avg_review ASC;