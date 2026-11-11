# E-commerce-Data-Analysis

<img width="1304" height="752" alt="Screenshot 2026-06-25 190351" src="https://github.com/user-attachments/assets/6b4a3495-e839-48ed-9b37-57e02525aecd" />


## Project Objective
**This project analyzes e-commerce sales, delivery performance, and customer behavior using SQL and Power BI.
The goal is to identify key factors affecting revenue and customer satisfaction.**

## Dataset
**Brazilian E-commerce Public Dataset by Olist.**

* 99,441 order
* 100K+ order items
* Customer, product, seller, payment, review, and logistics data

  
## Tools Used
* SQL
* MS Excel
* Power BI

## SQL Work
* Creating Table (adding datatype, constraints or keys)
* Joining Table (product, order_items, order_reviews)
* Calculating KPIs:
    - delivery delay rate
    - revenue by category
    - review score

(Check SQL queries in repo)

## Files
* create_tables.sql : creating tables
* revenue_analysis.sql : total revenue by product category
* product_review_analysis.sql : avg review score of products
* delivery_analysis.sql : state with delayed deliveries
* delivery_review_analysis.sql : state wise avg review score

# Key Findings

* Health Beauty generated highest revenue while maintaining strong customer satisfaction.
* Security and Services recorded lowest revenue and review scores, indicating customer dissatisfaction and low interest in product.
* AL, MA, and PI exhibited highest delivery delay rates.
* States with higher delay rates generally reported lower review scores, suggesting a relationship between delivery performance and customer satisfaction.

# Recommendations

* Improve logistics performance in areas with high delay rate.
* Investigate low performing products.
* Continue investing in high performing products such as Health Beauty.
* Monitor delivery performance as customer experience KPI.


## Additional detail
- You can sort by changing DESC - descending or ASC - ascending for the results.
- Import data from csv after creating tables.

#### Dataset 
- https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce
