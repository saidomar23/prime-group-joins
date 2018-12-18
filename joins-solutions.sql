

-- Get all customers and their addresses.
SELECT "customers".id, "customers".first_name, "customers".last_name, "addresses".street, 
 "addresses".city,  "addresses".state,  "addresses".zip,  "addresses".address_type FROM "customers" 
JOIN "addresses" ON "customers".id = "addresses".customer_id;
-- Get all orders and their line items (orders, quantity and product)
SELECT "orders".id, "orders".order_date, "line_items".quantity, "line_items".product_id FROM "orders"
JOIN "line_items" ON "line_items".order_id = "orders".id;
-- Which warehouses have cheetos?
SELECT "warehouse".id, "warehouse".warehouse, "products".description FROM "warehouse"
JOIN "warehouse_product" ON "warehouse".id = "warehouse_product".warehouse_id
JOIN "products" ON "warehouse_product".product_id = "products".id
WHERE "products".id = 5;
-- Which warehouses have diet pepsi?
SELECT "warehouse".id, "warehouse".warehouse, "products".description FROM "warehouse"
JOIN "warehouse_product" ON "warehouse".id = "warehouse_product".warehouse_id
JOIN "products" ON "warehouse_product".product_id = "products".id
WHERE "products".id = 6;
-- Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT COUNT("orders".id), "customers".first_name, "customers".last_name  FROM "orders" 
JOIN "addresses" ON "orders".address_id = "addresses".id
JOIN "customers" ON "addresses".customer_id = "customers".id
GROUP BY "customers".first_name, "customers".last_name;
-- How many customers do we have?
SELECT COUNT(*) FROM "customers";
-- How many products do we carry?
SELECT COUNT(*) FROM "products";
-- What is the total available on-hand quantity of diet pepsi?
SELECT "products".id, "products".description, SUM("warehouse_product".on_hand) FROM "products" 
JOIN "warehouse_product" ON "products".id = "warehouse_product".product_id
WHERE "products".id = 6
GROUP BY "products".id, "products".description;
