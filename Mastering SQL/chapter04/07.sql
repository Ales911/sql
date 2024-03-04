-- Retrieve order date, customer's name, and all salespersons, sorted by customer name
SELECT O.order_date, C.customer_name, S.salesperson_name
FROM chapter04.ORDERS AS O
JOIN chapter04.CUSTOMERS AS C ON O.customer_id = C.customer_id
RIGHT JOIN chapter04.SALESPERSON AS S ON O.salesperson_id = S.salesperson_id
ORDER BY C.customer_name;
