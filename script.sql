SELECT * FROM customers
LIMIT 10;
SELECT * FROM orders
LIMIT 10;
SELECT * FROM books
LIMIT 10;

SELECT * FROM pg_Indexes
WHERE tablename='customers';
SELECT * FROM pg_Indexes
WHERE tablename='orders';
SELECT * FROM pg_Indexes
WHERE tablename='books';

EXPLAIN ANALYZE SELECT customer_id, quantity FROM orders
WHERE quantity>18;

CREATE INDEX orders_quantity_idx ON
orders(quantity);

EXPLAIN ANALYZE SELECT customer_id, quantity FROM orders
WHERE quantity>18;

ALTER TABLE customers 
ADD CONSTRAINT customers_pkey
PRIMARY KEY (customer_id);
EXPLAIN ANALYZE SELECT * FROM customers
WHERE customer_id<100;

CREATE INDEX orders_customer_id_book_id ON orders(customer_id,book_id);

DROP INDEX IF EXISTS
orders_customer_id_book_id ;

EXPLAIN ANALYZE SELECT * FROM orders
WHERE quantity * price_base > 100;

CREATE INDEX orders_quantity_price_base
ON orders((quantity*price_base>100));

EXPLAIN ANALYZE SELECT * FROM orders
WHERE quantity * price_base > 100;

SELECT *
FROM pg_indexes
WHERE tablename IN ('customers', 'books', 'orders')
ORDER BY tablename, indexname;