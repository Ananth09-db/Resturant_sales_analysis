# Resturant_sales_analysis
## Project Overview
This project is part of the Maven Analytics platform, designed to enhance SQL skills through real-world business scenarios.
This project involves creating and analyzing a structured database for a restaurant business. The database is designed to store and manage information about restaurants, menu items, customers, orders, and order details. SQL queries are used for data analysis, helping derive insights such as top-selling items, customer behavior, and revenue trends.

## Files in the Repository
- **create_restaurant_db.sql**: This script creates the database schema, including tables, relationships, and constraints.
- **project.sql**: This script contains SQL queries for analyzing restaurant data, such as sales trends, customer activity, and order insights.

## Database Schema
The project includes the following key tables:
1. **restaurants** - Stores restaurant details.
2. **menu_items** - Lists food and beverages available for order.
3. **customers** - Stores customer information.
4. **orders** - Logs customer orders.
5. **order_details** - Provides details about each order, including menu items purchased.

## Key SQL Queries & Analysis
The SQL queries in `project.sql` perform the following:
- Identify top-selling menu items.
- Analyze revenue trends over time.
- Track customer orders and frequency.
- Determine peak business hours.

## SQL Queries & Answers
**Query 1:**
```sql
-- Number of items on the menu
SELECT COUNT(*) 
FROM menu_items;
```

**Query 2:**
```sql
-- Most and Least expensive item on menu
SELECT item_name,price AS expensive 
FROM menu_items
ORDER BY price DESC
LIMIT 1;
```

**Query 3:**
```sql
SELECT item_name,price AS cheapest
FROM menu_items
ORDER BY price 
LIMIT 1;
```

**Query 4:**
```sql
-- Italian Dishes
SELECT COUNT(*)
FROM menu_items
WHERE category = 'Italian';
```

**Query 5:**
```sql
-- most expensive
SELECT item_name,price AS expensive 
FROM menu_items
WHERE category = 'Italian'
ORDER BY price DESC
LIMIT 1;
```

**Query 6:**
```sql
-- least expensive
SELECT item_name,price AS cheap
FROM menu_items
WHERE category = 'Italian'
ORDER BY price ASC
LIMIT 1;
```

**Query 7:**
```sql
SELECT category,COUNT(*) AS num_of_items,AVG(price) AS average
FROM menu_items
GROUP BY category;
```

**Query 8:**
```sql
-- View of order table
SELECT * FROM order_details;
```

**Query 9:**
```sql
-- Date range orders
SELECT MIN(order_date) AS first_order, MAX(order_date) AS last_order
FROM orders;
```

## How to Use
1. Run `create_restaurant_db.sql` to set up the database.
2. Insert sample data (if applicable).
3. Execute `project.sql` to generate insights.

## Technologies Used
- **SQL** (Structured Query Language)
- **Relational Database Management Systems (RDBMS)**

## Contact
For any queries, feel free to reach out:
- **LinkedIn**: [Ananth J](https://www.linkedin.com/in/ananth-j-6413732a5)
- **Email**: ananthj575@gmail.com

