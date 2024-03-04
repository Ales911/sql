-- Inner Join with WHERE and ORDER BY
SELECT O.order_id, C.customer_name
FROM chapter04.ORDERS AS O
INNER JOIN chapter04.CUSTOMERS AS C USING (customer_id)
WHERE C.customer_name LIKE 'Bob%'
ORDER BY O.order_id DESC;
