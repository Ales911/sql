-- Right Join – indicates we want all data from the right table even without a corresponding match in the left table
SELECT C.customer_name, O.order_id
FROM chapter04.ORDERS AS O
RIGHT JOIN chapter04.CUSTOMERS AS C 
ON C.customer_id = O.customer_id;
