-- Inner Join - ANSI Standard
SELECT O.order_id, C.customer_name
FROM chapter04.ORDERS AS O
JOIN chapter04.CUSTOMERS AS C ON O.customer_id = C.customer_id;