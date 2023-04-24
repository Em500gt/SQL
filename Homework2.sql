USE homework;

CREATE TABLE sales(
	id SERIAL PRIMARY KEY,
    order_date DATE,
    count_product INT
);

INSERT INTO sales(order_date, count_product)
VALUES
('2022-01-01', 156),
('2022-01-02', 180),
('2022-01-03', 21),
('2022-01-04', 124),
('2022-01-05', 341); 

SELECT * FROM sales;

ALTER TABLE sales
ADD COLUMN order_type VARCHAR(20);

SET SQL_SAFE_UPDATES = 0;

UPDATE sales SET order_type = CASE
WHEN count_product < 100 THEN "маленький заказ"
WHEN count_product >= 100 AND count_product <= 300 THEN "средний заказ"
WHEN count_product > 300 THEN "большой заказ"
END;

SELECT * FROM sales;

CREATE TABLE orders(
	id SERIAL PRIMARY KEY,
    employee_id VARCHAR(5),
    amount DOUBLE,
    order_status VARCHAR(10)
);

INSERT INTO orders(employee_id, amount, order_status) VALUES
('e03', 15.00, 'OPEN'),
('e01', 25.50, 'OPEN'),
('e05', 100.70, 'CLOSED'),
('e02', 22.18, 'OPEN'),
('e04', 9.50, 'CANCELLED');

SELECT *, CASE order_status
WHEN 'OPEN' THEN 'Order is in open state'
WHEN 'CLOSED' THEN 'Order is closed'
WHEN 'CANCELLED' THEN 'Order is canselled'
END AS full_order_status
FROM orders;

