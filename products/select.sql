SELECT p.product_name, p.product_value
FROM products.PRODUCTS p
JOIN products.CATEGORIES c ON p.category_id = c.category_id
WHERE c.category_name = 'Home Appliances';