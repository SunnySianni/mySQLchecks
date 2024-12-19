# mySQLchecks
Concept Checks for MySQL



1. How do primary and foreign keys help maintain data integrity?
   
Primary Keys: Ensure that each record in a table is uniquely identifiable. For example, the customer_id in the customers table ensures that no two customers have the same ID, preventing duplicate or ambiguous records.
Foreign Keys: Establish relationships between tables and ensure that data remains consistent. For instance, the customer_id in the orders table must reference a valid ID in the customers table. This prevents orphaned records, such as an order being linked to a nonexistent customer.


2. What insights can be gained by joining multiple tables?
   
Joining tables enables us to combine data from related entities to gain deeper insights:

Customer-Order Analysis: By joining the customers and orders tables, we can see which customers are generating the most revenue.
Order Details: Joining orders, order_items, and products provides a breakdown of products purchased in each order, helping identify popular items.
Behavioral Insights: Combining orders and customers can reveal trends, such as repeat purchases or customer segmentation by location.


3. How can aggregate functions summarize data?
Aggregate functions are useful for summarizing and analyzing data across multiple records:

SUM: Calculate total revenue (SUM(total_amount) in the orders table).
AVG: Determine the average order value, which helps understand customer spending habits.
COUNT: Count the number of orders placed by each customer or the total number of items sold.
MAX/MIN: Identify the highest or lowest product prices, or the largest single order.


4. What types of analyses are enabled by date functions?
Date functions allow us to perform time-based analyses:

Trend Analysis: Group orders by month or day to observe sales trends over time.
Customer Retention: Calculate the time between a customer's first and last order to measure loyalty.
Seasonal Insights: Identify peak shopping periods, such as holidays.
Order Aging: Find orders older than a specific period to analyze delivery performance or outstanding invoices.


5. How might you extend this database for additional e-commerce features?
To enhance the e-commerce database, you could add:

Reviews and Ratings: A table for product reviews, capturing review_id, product_id, customer_id, rating, and review_text.
Shipping Details: A shipping table with fields for order_id, address, shipping_status, and delivery_date to track logistics.
Coupons and Discounts: A promotions table for managing promo_id, description, discount_amount, and applicable dates.
Wishlist: A wishlist table to allow customers to save products for future purchase.
User Activity Tracking: A table for tracking customer actions, such as viewed products or abandoned carts, to enable personalized marketing.
