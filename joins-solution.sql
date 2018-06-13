-- Question 1 - Get all customers and their addresses.
SELECT * FROM customers
JOIN addresses ON customers.id = addresses.id;

-- Question 2 - Get all orders and their line items

-- Question 3 - 
SELECT * FROM products
JOIN warehouse_product ON products.id = warehouse_product.product_id
JOIN warehouse ON warehouse_product.warehouse_id = warehouse.id
WHERE products.description = 'cheetos';

-- Which warehouses have diet pepsi?
SELECT * FROM products
JOIN warehouse_product ON products.id = warehouse_product.product_id
JOIN warehouse ON warehouse_product.warehouse_id = warehouse.id
WHERE products.description = 'diet pepsi';

-- Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT customers.first_name, count(orders) FROM customers
JOIN addresses ON addresses.customer_id = customers.id
JOIN orders ON orders.address_id = addresses.id
GROUP BY customers.first_name;

-- How many customers do we have?
SELECT count(*) FROM customers;

-- How many products do we carry?
SELECT count(*) FROM products;

-- What is the total available on-hand quantity of diet pepsi?
SELECT SUM(on_hand) FROM warehouse_product
JOIN products ON products.id = warehouse_product.product_id
WHERE products.description = 'diet pepsi'
GROUP BY products.description;