DROP DATABASE IF EXISTS  HW6;
CREATE DATABASE IF NOT EXISTS  HW6;
USE HW6;

/* 
1. Создайте процедуру, которая принимает кол-во сек и формат их в кол-во дней часов. Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
2. Создайте функцию, которая выводит только четные числа от 1 до 10. Пример: 2,4,6,8,10
*/

-- 1)
DELIMITER //
CREATE FUNCTION seconds_in_date(seconds INT)  
RETURNS VARCHAR(55)
DETERMINISTIC 
BEGIN
DECLARE days INT;
DECLARE hours INT;
DECLARE minutes INT;
DECLARE text_date VARCHAR(55);
    SET days = FLOOR(seconds / (24 * 3600));
    SET seconds = seconds % (24 * 3600);
    SET hours = FLOOR(seconds / 3600);
    SET seconds = seconds % 3600;
    SET minutes = FLOOR(seconds / 60);
    SET seconds = seconds % 60;
SET text_date = CONCAT(days, " days ", hours, " hours ", minutes, " minutes ", seconds, " seconds");
RETURN text_date;
END //
DELIMITER ;
SELECT seconds_in_date(123456);

-- 2)
DROP PROCEDURE IF EXISTS even_nums;
DELIMITER //
CREATE PROCEDURE even_nums()
BEGIN
DECLARE i INT DEFAULT 1;
DECLARE result VARCHAR(45) DEFAULT '';
WHILE i <= 10 DO
        IF i % 2 = 0 THEN
            IF result = '' THEN
                SET result = i;
            ELSE
                SET result = CONCAT(result, ',', i);
            END IF;
        END IF;
        SET i = i + 1;
END WHILE;
SELECT result;
END //
DELIMITER ;
CALL even_nums();