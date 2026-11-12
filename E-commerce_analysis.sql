/* Brazillian E-commerce Dataset Analysis */

-- Create tables and import data from relevant csv files

CREATE TABLE customers (
    customer_id VARCHAR(50) PRIMARY KEY,
    customer_unique_id VARCHAR(50),
    customer_zip_code_prefix INTEGER,
    customer_city VARCHAR(100),
	customer_state VARCHAR(2)
);

CREATE TABLE orders (
    order_id VARCHAR(50) PRIMARY KEY,
    customer_id VARCHAR(50),
    order_status VARCHAR(50),
    order_purchase_timestamp TIMESTAMP,
    order_approved_at TIMESTAMP,
    order_delivered_carrier_date TIMESTAMP,
    order_delivered_customer_date TIMESTAMP,
    order_estimated_delivery_date TIMESTAMP,
	FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_id VARCHAR(50),
    order_item_id INTEGER,
    product_id VARCHAR(50),
    seller_id VARCHAR(50),
    shipping_limit_date TIMESTAMP,
    price NUMERIC(10,2),
    freight_value NUMERIC(10,2)
);

CREATE TABLE order_payments (
    order_id VARCHAR(50),
    payment_sequential INTEGER,
    payment_type VARCHAR(50),
    payment_installments INTEGER,
    payment_value NUMERIC(10,2)
);

CREATE TABLE order_reviews (
    review_id VARCHAR(50),
    order_id VARCHAR(50),
    review_score INTEGER,
    review_comment_title TEXT,
    review_comment_message TEXT,
    review_creation_date TIMESTAMP,
    review_answer_timestamp TIMESTAMP
);

CREATE TABLE products (
    product_id VARCHAR(50),
	product_category_name VARCHAR(100),
	product_name_length INTEGER,
	product_description_length INTEGER,
	product_photos_qty INTEGER,
	product_weight_g INTEGER,
	product_length_cm INTEGER,
	product_height_cm INTEGER,
	product_width_cm INTEGER
);
	
CREATE TABLE sellers (
    seller_id VARCHAR(50),
	seller_zip_code_prefix INTEGER,
	seller_city VARCHAR(50),
	seller_state VARCHAR(2)
);

CREATE TABLE product_category_name_translation (
    product_category_name VARCHAR(100) PRIMARY KEY,
	product_category_name_english VARCHAR(100)
);




-- DATA ANALYSIS
----------------------------------------------------------------------------------------------------------
 




-- Calculating Delivery Delay Rate By State

SELECT COUNT(CASE WHEN order_delivered_customer_date > order_estimated_delivery_date THEN 1 END) AS delayed_orders,
COUNT(*) AS total_orders_count,
customer_state,
ROUND((COUNT(CASE WHEN order_delivered_customer_date > order_estimated_delivery_date THEN 1.0 END)) * 100.0 / COUNT(*),2)  AS delay_rate
FROM orders
LEFT JOIN customers ON orders.customer_id = customers.customer_id
WHERE order_status = 'delivered' GROUP BY customer_state ORDER BY delay_rate DESC;


-- Avg Review By State ( To check if delivery affect reviews)

SELECT ROUND(AVG(review_score),2) AS avg_review, customer_state
FROM orders
LEFT JOIN customers ON orders.customer_id = customers.customer_id
LEFT JOIN order_reviews ON orders.order_id = order_reviews.order_id
WHERE order_status = 'delivered' GROUP BY customer_state ORDER BY avg_review ASC;


-- Avg Review Of Products

SELECT product_category_name_english, ROUND(AVG(review_score),2) AS avg_review, SUM(price) AS revenue FROM products
LEFT JOIN order_items ON products.product_id = order_items.product_id 
LEFT JOIN product_category_name_translation ON products.product_category_name = product_category_name_translation.product_category_name
LEFT JOIN order_reviews ON order_items.order_id = order_reviews.order_id
GROUP BY product_category_name_english ORDER BY avg_review DESC LIMIT 10;


-- Revenue Analysis By Product Category

SELECT product_category_name_english, SUM(price) AS revenue FROM products
LEFT JOIN order_items ON products.product_id = order_items.product_id 
LEFT JOIN product_category_name_translation ON products.product_category_name = product_category_name_translation.product_category_name 
GROUP BY product_category_name_english ORDER BY revenue DESC LIMIT 10;







---------------------------------------------------------------------------------------------------------
