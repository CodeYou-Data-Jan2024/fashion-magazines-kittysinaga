-- Add your sql here
WITH previous_query AS
(SELECT orders.subscription_id, orders.customer_id, orders.order_status, customers.customer_name 
FROM orders 
JOIN customers 
ON orders.customer_id=customers.customer_id 
WHERE orders.order_status='unpaid')

SELECT previous_query.customer_name AS 'Customer', printf('$%.2f',SUM(subscriptions.price_per_month * subscriptions.subscription_length)) AS 'Amount Due'
FROM previous_query 
JOIN subscriptions 
ON previous_query.subscription_id=subscriptions.subscription_id 
WHERE subscriptions.description='Fashion Magazine'
GROUP BY previous_query.customer_name;





