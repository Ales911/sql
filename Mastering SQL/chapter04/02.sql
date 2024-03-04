-- Return order ID, customer's name, and salesperson's name
-- Inner Join with 3 tables
SELECT O.order_id, C.customer_name, S.salesperson_name
FROM chapter04.ORDERS AS O
INNER JOIN chapter04.CUSTOMERS AS C ON O.customer_id = C.customer_id
INNER JOIN chapter04.SALESPERSON AS S ON O.salesperson_id = S.salesperson_id;

-- SELECT O.order_id, C.customer_name, S.salesperson_name
-- FROM chapter04.ORDERS AS O, 
-- chapter04.CUSTOMERS AS C, 
-- chapter04.SALESPERSON AS S
-- WHERE O.customer_id = C.customer_id
-- AND O.salesperson_id = S.salesperson_id;