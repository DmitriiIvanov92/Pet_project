USE megamarket;

-- Разные способы доставить:
INSERT users (firstname, secondname, phone) VALUES
	('Dmitrii', 'Ivanov', '89600636417'),
	('Olga', 'Abrazheeva', '89600663641'),
	('Julia', 'Ivanova', '89600636419'),
	('Oleg', 'Ivanov', '89600636363');

	
INSERT users (firstname, secondname, lastname, phone, email) VALUES
	('Daniil', 'Koltunov', 'Victorovich', '89600636362', 'koltunov@mail.ru'),
	('Ivan', 'Fedorovich', 'Ivanov', '89600636364', 'ivan-92@ya.ru');
	
INSERT users VALUES
	(DEFAULT,'Dmitrii', 'Olegovich', DEFAULT, '89600636465', DEFAULT, DEFAULT, DEFAULT),
	(DEFAULT, 'Elena', 'Vladimirovna', DEFAULT, '89600631010', DEFAULT, DEFAULT, DEFAULT),
	(DEFAULT, 'Gyzel', 'Faritovna', DEFAULT, '89100101010', DEFAULT, DEFAULT, DEFAULT);

INSERT users SET firstname = 'Yana', secondname = 'Ivanova', phone = '89800001010';

INSERT profiles(gender, birthday, city) VALUES
	('male', '1992-09-15', 'Chelny'),
	('female', '1970-01-01', 'Kazan'),
	('female', '1992-06-01', 'Chelny'),
	('male', '1992-10-10', 'Moscow'),
	('male', '1992-05-01', 'Saratov'),
	('male', '1991-05-01', 'Moscow'),
	('male', '1990-05-15', 'Kazan'),
	('female', '1980-09-09', 'Nizhnekamsk'),
	('female', '1985-06-01', 'Nizhniy Novgorod'),
	('female', '1987-07-10', 'Moscow');

INSERT password_user (id, user_pass) VALUES
	(1, 'qwertY9!'),
	(2, 'QwerTY1!'),
	(3, 'PAssword10!'),
	(4, 'VOLume01!');

INSERT `catalog` (id,description) VALUES 
	(DEFAULT, 'Овощи'),
	(DEFAULT, 'Cыр'),
	(DEFAULT, 'Мясо'),
	(DEFAULT, 'Колбасы'),
	(DEFAULT, 'Алкоголь 18+');

INSERT store (store_id, name, description) VALUES
(DEFAULT,'Metro', 'В России история METRO началась в 2000 году. Уже год спустя, в ноябре 2001 года, в Москве были открыты два торговых центра компании.');

INSERT products_store (id, store_id, category_id, product_name, price) VALUES
	(DEFAULT, LAST_INSERT_ID(), 1, 'Кабачки грунтовые', '75.89'),
	(DEFAULT, LAST_INSERT_ID(), 1, 'Перец красный сладкий', '80.70'),
	(DEFAULT, LAST_INSERT_ID(), 2, 'Сыр полутвердый Ламбер 50%', '878.90'),
	(DEFAULT, LAST_INSERT_ID(), 2, 'Сыр полутвердый Arta Natura', '409.00');

INSERT products_store (id, store_id, category_id, product_name, description, price) VALUES 
	(DEFAULT, LAST_INSERT_ID(), 3, 'Фарш говяжий', 'Тип продукта: Полуфабрикат из мяса', '219.00'),
	(DEFAULT, LAST_INSERT_ID(), 4, 'Колбаса вареная Родные места Доктораская', '400г.', '229.00'),
	(DEFAULT, LAST_INSERT_ID(), 5, 'Виски Jameson 40% 0.7 л', 'Регион Дублин', '2129.00');

INSERT store (store_id, name, description) VALUES
	(DEFAULT, 'Perekrestok', '"Перекресток" - одна из первых сетей городских супермаркетов в России номер 1');

INSERT products_store (id, store_id, category_id, product_name, price) VALUES 
	(DEFAULT, LAST_INSERT_ID(), 1, 'Огурцы короткоплодные', '52.60'),
	(DEFAULT, LAST_INSERT_ID(), 2, 'Сыр полутвердый Ламбер 50%', '1239.03'),
	(DEFAULT, LAST_INSERT_ID(), 3, 'Фарш говяжий', '286.40'),
	(DEFAULT, LAST_INSERT_ID(), 4, 'Колбаса Вязанка', '273.90'),
	(DEFAULT, LAST_INSERT_ID(), 5, 'Виски Dewards', '2429.00');

INSERT product_like_user (id, user_id, products) VALUES 
	(DEFAULT, 1, 7),
	(DEFAULT, 2, 5),
	(DEFAULT, 3, 10),
	(DEFAULT, 5, 7),
	(DEFAULT, 8, 12),
	(DEFAULT, 7, 6);

INSERT feedback (user_id, products, comment) VALUES
	(1, 7, 'Хороший виски!'),
	(2, 5, 'Вкусный фарш!');
	
INSERT INTO feedback  (user_id, products, pluses, comment) VALUES
	(3, 10, 'Свежий фарш', 'Буду брать еще!'),
	(7, 6, 'Очень вкусная колбаса', 'Попробуйте сами!'),
	(10, 11, NULL, 'Класс!');

UPDATE 
	feedback
SET 
	raiting = '*****' 
WHERE 
	id IN (3,4);

INSERT delivery_order (user_id, product_id, adress) VALUES
	(1, 7, 'г.Москва, ул.Ахтубина, д.1'),
	(1, 5, 'г.Москва, ул.Ахтубина, д.1'),
	(1, 10, 'г.Москва, ул.Ахтубина, д.1'),
	(2, 5, 'г.Москва, ул.Щербакова, д.10'),
	(2, 8, 'г.Москва, ул.Щербакова, д.10'),
	(2, 6, 'г.Москва, ул.Щербакова, д.10');

INSERT orders (user_id, product_id) VALUES
	(5, 1),
	(6, 2),
	(8, 3),
	(5, 4),
	(6, 8);

SELECT id, product_name  FROM products_store ps;

-- Подзапрос для таблицы feedback:
SELECT
	(SELECT CONCAT(firstname, ' ', SUBSTR(secondname, 1, 1), '.') FROM users WHERE users.id = feedback.id) AS username,
	(SELECT product_name FROM products_store  WHERE products_store.id = products) AS products,
	pluses,
	comment,
	raiting
FROM 
	feedback
ORDER BY
	raiting DESC;

-- Выборка с использованием JOIN для таблицы product_like_user:
SELECT
-- 	COUNT(*) count, 
	CONCAT(u.firstname, ' ', SUBSTR(u.secondname, 1, 1), '.') AS username, s.name AS store, ps.product_name AS product,
	(SELECT description FROM `catalog` c WHERE c.id = ps.category_id) AS category , ps.price 
FROM
	product_like_user plu 
JOIN
	users u 
ON 
	u.id = plu.id 
JOIN
	products_store ps 
ON 
	ps.id = plu.products
JOIN
	store s 
ON
	s.store_id = ps.store_id
-- GROUP BY category
ORDER BY
	 price DESC;

-- JOIN для таблицы products_store:
SELECT 
	s.name AS store, c.description, ps.product_name AS product, ps.price  
FROM
	products_store ps 
JOIN 
	store s 
ON 
	s.store_id = ps.store_id 
JOIN 
	`catalog` c 
ON c.id  = ps.category_id
ORDER BY 
	price DESC;

-- CREATE OR REPLACE VIEW №1:
CREATE OR REPLACE VIEW delivery_order_view AS 
SELECT 
	o.order_id , CONCAT(u.firstname, ' ', SUBSTR(u.secondname, 1, 1), '.') AS username, ps.product_name AS products  
FROM 
	orders o 
JOIN 
	users u 
ON 
	u.id = o.user_id
JOIN
	products_store ps 
ON 
	ps.id = o.product_id; 

ALTER TABLE
	password_user 
ADD COLUMN 
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE 
	password_user 
ADD COLUMN 
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

INSERT password_user (id, user_pass) VALUES
	(5, 'Example10!'),
	(6, 'gOOOO99!');

INSERT password_user (id, user_pass) VALUES
	(8, 'Example_password1!'),
	(9, 'Password_user10!'),
	(10, 'Year2022!');
	
-- CREATE OR REPLACE VIEW №2:
CREATE OR REPLACE VIEW users_info AS 
SELECT 
	CONCAT(u.firstname, ' ', u.secondname) AS username, pu.user_pass 
FROM
	users u 
JOIN
	password_user pu 
ON 
	pu.id = u.id;


ALTER TABLE users DROP CONSTRAINT `check_phone_check`;

DELIMITER //

CREATE TRIGGER check_birthday_before_insert BEFORE INSERT ON profiles
FOR EACH ROW
BEGIN
	IF NEW.birthday >= CURRENT_DATE() THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Неправильная дата!';
	END IF;
END//

DELIMITER ;

INSERT users (firstname, secondname , phone) VALUES 
	('Олег', 'Колтунов', '89179172020');

INSERT profiles (gender, birthday, city) VALUES 
	('male', '1970-05-18', 'Chelny');

INSERT profiles (gender, birthday, city) VALUES 
	('male', '2025-08-05', 'Chelny');

