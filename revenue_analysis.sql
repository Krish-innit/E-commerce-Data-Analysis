SELECT product_category_name_english, SUM(price) AS revenue FROM products
LEFT JOIN order_items ON products.product_id = order_items.product_id 
LEFT JOIN product_category_name_translation ON products.product_category_name = product_category_name_translation.product_category_name 
GROUP BY product_category_name_english ORDER BY revenue DESC LIMIT 10;




