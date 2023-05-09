use homework;
CREATE TABLE cars (
Id int PRIMARY KEY,
Name VARCHAR(50) NOT NULL,
Cost int NOT NULL);

INSERT INTO cars values
( 1, 'Audi', 52642),
( 2, 'Mercedes', 57127),
( 3, 'Skoda', 9000),
( 4, 'Volvo', 29000),
( 5, 'Bentley', 350000),
( 6, 'Citroen', 21000),
( 7, 'Hummer', 41400),
( 8, 'Volkswagen', 21600);

-- 1
create view carscheap as select * from cars where Cost < 25000;
select * from carscheap;

-- 2
alter view carscheap as select * from cars where Cost < 30000;
select * from carscheap;

-- 3
create view scoda_audi as select * from cars where Name in('Skoda', 'Audi');
select * from scoda_audi;

CREATE TABLE Analysis (
  an_id INT PRIMARY KEY,
  an_name VARCHAR(50) NOT NULL,
  an_cost DECIMAL(10, 2) NOT NULL,
  an_price DECIMAL(10, 2) NOT NULL,
  an_group INT NOT NULL
);

INSERT INTO Analysis values
( 1, 'Пероксидаза щитовидной железы', 9, 11.84, 10, 1001),
(2, 'Аывфв', 8, 11.88, 10, 1003);


CREATE TABLE Groupss (
  gr_id INT PRIMARY KEY,
  gr_name VARCHAR(50) NOT NULL,
  gr_temp VARCHAR(10) NOT NULL
);

INSERT INTO Groupss values
( 1, '1001', '-5'),
(2, '1003', '+2');

CREATE TABLE Orders (
  ord_id INT PRIMARY KEY,
  ord_datetime DATETIME NOT NULL,
  ord_an INT NOT NULL
);

INSERT INTO Orders values
( 1, '10.10.2020', 1),
(2, '05.02.2020', 2);


SELECT Analysis.an_name, Analysis.an_price
FROM Orders
INNER JOIN Analysis ON Orders.ord_an = Analysis.an_id
WHERE Orders.ord_datetime BETWEEN '2020-02-05' AND '2020-02-12';
