-- Return the order date, customer's name, all salespersons, with or without an associated order, and order the result by the customer's name.
SELECT
  CASE
    WHEN O.order_date IS NULL THEN 'No Order'
    ELSE O.order_date
  END AS order_date,
  CASE
    WHEN C.customer_name IS NULL THEN 'No Order'
    ELSE C.customer_name
  END AS customer_name,
  S.salesperson_name
FROM chapter04.ORDERS AS O
JOIN chapter04.CUSTOMERS AS C ON O.customer_id = C.customer_id
RIGHT JOIN chapter04.SALESPERSON AS S ON O.salesperson_id = S.salesperson_id
ORDER BY C.customer_name;