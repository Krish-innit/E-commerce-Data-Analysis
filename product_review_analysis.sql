SELECT product_category_name_english, ROUND(AVG(review_score),2) AS avg_review, SUM(price) AS revenue FROM products
LEFT JOIN order_items ON products.product_id = order_items.product_id 
LEFT JOIN product_category_name_translation ON products.product_category_name = product_category_name_translation.product_category_name
LEFT JOIN order_reviews ON order_items.order_id = order_reviews.order_id
GROUP BY product_category_name_english ORDER BY avg_review DESC LIMIT 10;




