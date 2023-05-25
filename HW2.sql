/*
1 Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными
2 Сгруппируйте значений количества в 3 сегмента — меньше 100, 100-300 и больше 300 (функция IF).
3 Создайте таблицу “orders”, заполните ее значениями. Покажите “полный” статус заказа, используя оператор CASE
4 Чем NULL отличается от 0?
*/

DROP DATABASE IF EXISTS hw2;
CREATE DATABASE  hw2;
USE hw2;

DROP TABLE IF EXISTS sales;
CREATE TABLE sales (
	id INT PRIMARY KEY,
	order_date DATE,
	count_product INT
);

INSERT INTO sales
(id, order_date, count_product)
VALUES
(1, '2023-01-02', 146),
(2, '2023-02-03', 50),
(3, '2023-03-04', 25),
(4, '2023-04-05', 120),
(5, '2023-05-06', 320);


SELECT 
	id AS 'id заказа',
    count_product AS 'Количество',
	IF (count_product < 100, 'Маленький заказ', 
		IF (count_product BETWEEN 100 AND 300, 'Средний заказ', 'Большой заказ')
	) AS 'Тип заказа'	
FROM sales;

CREATE TABLE orders (
    order_id INT NOT NULL AUTO_INCREMENT,
    employ VARCHAR(5) NOT NULL,
    amount DECIMAL(20, 2) NOT NULL,
    order_status VARCHAR(45) NOT NULL,
    PRIMARY KEY (order_id)
);

INSERT INTO orders (employ, amount, order_status)
VALUES
('01',93.99,'OPEN'),
('02',70.99,'CLOSED'),  
('03',105.00,'CANCELLED'),
('04',83.00,'OPEN'),
('05',125.50,'CLOSED');

SELECT order_id, order_status,
CASE order_status
    WHEN "OPEN" THEN 'Order is open'
    WHEN "CLOSED" THEN 'Order closed'
    ELSE 'Order is cancel'
END AS 'order_summary'
FROM orders;

-- -- NULL это отсутсвие значений в ячейке ("пустое место") — объявленную, но неинициализированную переменную, объект и т.п., а 0 это  значение с которым можно производить математические вычисления.



