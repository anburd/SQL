SELECT * FROM phones.mobile_phones;

INSERT INTO mobile_phones (models_phones, manufacturers, prices_phones, quantity_phones) VALUES ('Xiaomi 30 Pro', 'Xiaomi', 25000, 10);
INSERT INTO mobile_phones (models_phones, manufacturers, prices_phones, quantity_phones) VALUES ('iPhone 14 Max 1024GB', 'Apple', 200000, 1);
INSERT INTO mobile_phones (models_phones, manufacturers, prices_phones, quantity_phones) VALUES ('S22 8/512 GB', 'Samsung', 340000, 2);
INSERT INTO mobile_phones (models_phones, manufacturers, prices_phones, quantity_phones) VALUES ('Huawei MATE50', 'Huawei', 25000, 5);
INSERT INTO mobile_phones (models_phones, manufacturers, prices_phones, quantity_phones) VALUES ('S23 5/1024 GB', 'Samsung', 40000, 1);

-- 2. Выведите название, производителя и цену для товаров, количество которых превышает 2
SELECT models_phones, manufacturers, prices_phones 
FROM mobile_phones
WHERE quantity_phones > 2;

-- 3. Выведите весь ассортимент товаров марки “Samsung”
SELECT * FROM mobile_phones
WHERE manufacturers = 'Samsung';

-- 4.1. Товары, в которых есть упоминание "Iphone"
SELECT models_phones, manufacturers, prices_phones
FROM mobile_phones 
WHERE models_phones REGEXP 'Iphone' OR manufacturers REGEXP 'Iphone';

-- 4.2. "Samsung"
SELECT models_phones, manufacturers, prices_phones
FROM mobile_phones 
WHERE models_phones REGEXP 'Samsung' OR manufacturers REGEXP 'Samsung';

-- 4.3. Товары, в которых есть ЦИФРА "8"
