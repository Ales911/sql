-- Retrieving Order ID and Customer Name
SELECT o.order_id, c.customer_name
FROM chapter04.ORDERS o
INNER JOIN chapter04.CUSTOMERS c 
ON o.customer_id = c.customer_id;
