-- Left Join – indicates we want all data from the left table even without a corresponding match in the right table
SELECT C.customer_name, O.order_id
FROM chapter04.CUSTOMERS AS C
LEFT JOIN chapter04.ORDERS AS O 
-- LEFT OUTER JOIN chapter04.ORDERS AS O 
ON C.customer_id = O.customer_id;