USE homework;
CREATE TABLE salespeople(
	snum INT,
    sname text,
    city text,
    comn text
);

INSERT INTO salespeople(snum, sname, city, comn)
values
(1001, 'Peel', 'London', '.12'),
(1002, 'Serres', 'San Jose', '.13'),
(1004, 'Motika', 'London', '.11'),
(1007, 'Rifkin', 'Barcelona', '.15'),
(1003, 'Axelrod', 'New York', '.10');

CREATE TABLE customers(
	cnum INT,
    sname text,
    city text,
    rating INT,
    snum INT
);

INSERT INTO customers(cnum, sname, city, rating, snum)
values
(2001, 'Hoffman', 'London', 100, 1001),
(2002, 'Giovanni', 'Rome', 200, 1003),
(2003, 'Liu', 'San Jose', 200, 1002),
(2004, 'Grass', 'Berlin', 300, 1002),
(2006, 'Clemens', 'London', 100, 1001),
(2008, 'Cisneros', 'San Jose', 300, 1007),
(2007, 'Pereira', 'Rome', 100, 1004);

CREATE TABLE orders(
	onum int,
    amt double,
    odata text,
    cnum int,
    snum int
);

INSERT INTO	orders(onum, amt, odata, cnum, snum)
VALUES
(3001, 18.69, '10/03/1990', 2008, 1007),
(3003, 767.19, '10/03/1990', 2001, 1001),
(3002, 1900.10, '10/03/1990', 2007, 1004),
(3005, 5160.45, '10/03/1990', 2003, 1002),
(3006, 1098.16, '10/03/1990', 2008, 1007),
(3009, 1713.23, '10/04/1990', 2002, 1003),
(3007, 75.75, '10/04/1990', 2004, 1002),
(3008, 4723.00, '10/05/1990', 2006, 1001),
(30010, 1309.95, '10/06/1990', 2004, 1002),
(30011, 9891.88, '10/06/1990', 2006, 1001);

-- 1
SELECT city, sname, snum, comn FROM salespeople;

-- 2
SELECT rating, sname FROM customers WHERE city = 'San Jose';

-- 3
SELECT distinct snum FROM orders;

-- 4
SELECT * FROM customers WHERE sname LIKE 'G%';

-- 5
SELECT * FROM orders WHERE amt > 1000;

-- 6 
SELECT MIN(amt) FROM orders; 

-- 7
SELECT * FROM customers WHERE city = 'Rome' AND rating > 100;

CREATE TABLE staff (
	id INT AUTO_INCREMENT PRIMARY KEY,
	firstname VARCHAR(45),
	lastname VARCHAR(45),
	post VARCHAR(100),
	seniority INT,
	salary INT,
	age INT
);

INSERT INTO staff (firstname, lastname, post, seniority, salary, age)
VALUES
('Вася', 'Петров', 'Начальник', '40', 100000, 60),
('Петр', 'Власов', 'Начальник', '8', 70000, 30),
('Катя', 'Катина', 'Инженер', '2', 70000, 25),
('Саша', 'Сасин', 'Инженер', '12', 50000, 35),
('Иван', 'Иванов', 'Рабочий', '40', 30000, 59),
('Петр', 'Петров', 'Рабочий', '20', 25000, 40),
('Сидр', 'Сидоров', 'Рабочий', '10', 20000, 35),
('Антон', 'Антонов', 'Рабочий', '8', 19000, 28),
('Юрий', 'Юрков', 'Рабочий', '5', 15000, 25),
('Максим', 'Максимов', 'Рабочий', '2', 11000, 22),
('Юрий', 'Галкин', 'Рабочий', '3', 12000, 24),
('Людмила', 'Маркина', 'Уборщик', '10', 10000, 49);

SELECT * FROM staff;

-- 1
SELECT * FROM staff ORDER BY salary DESC;
SELECT * FROM staff ORDER BY salary ASC;

-- 2
SELECT * FROM staff WHERE salary IN (SELECT salary FROM staff ORDER BY salary DESCLIMIT 5);

-- 3
SELECT post, SUM(salary) as total_salary FROM staff
GROUP BY post HAVING total_salary > 100000;