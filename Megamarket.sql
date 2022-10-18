/*
 * База данных "Мегамаркет" (продуктовый магазин) была задумана,как возможность оформить заказ на самовывоз или доставку из 
 * предложенных магазинов. В процессе разработки базы данных были созданы такие таблицы как: пользователи, профиль пользователей,
 * пароли пользователей, таблица "магазин" где выбираем магазин,
 * единая таблица с каталогом разделов и разные таблицы с продуктовыми позициями, ссылающиеся на единый каталог. 
 * Так же была созданы таблицы "Понравившийся товар" и "Отзыв на товар".
 */

DROP DATABASE IF EXISTS megamarket;
CREATE DATABASE IF NOT EXISTS megamarket;

USE megamarket;
 
CREATE TABLE IF NOT EXISTS users(
	id SERIAL PRIMARY KEY,
	firstname VARCHAR(255) NOT NULL,
	secondname VARCHAR(255) NOT NULL,
	lastname VARCHAR(255) DEFAULT NULL COMMENT 'Отчество',
	phone BIGINT UNSIGNED UNIQUE NOT NULL,
	email VARCHAR(150) UNIQUE DEFAULT NULL,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE NOW(),
	CONSTRAINT check_phone_check CHECK (regexp_like(phone, '^[0-9]{11}$')),
	CONSTRAINT check_email_check CHECK (regexp_like(email, '^.+@.+\..+$')))
	COMMENT = 'Пользователи';

CREATE TABLE IF NOT EXISTS password_user(
	id BIGINT UNSIGNED PRIMARY KEY,
	user_pass VARCHAR(40) NOT NULL,
	CONSTRAINT fk_password_user FOREIGN KEY (id) REFERENCES users (id)
	ON UPDATE CASCADE
	ON DELETE CASCADE,
	CONSTRAINT check_password_user 
	CHECK(regexp_like(user_pass, '(?=.*[0-9])(?=.*[!@#$%^&*])(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*]{6,}')))
	COMMENT = 'Пароли пользователей';

CREATE TABLE IF NOT EXISTS profiles(
	user_id SERIAL PRIMARY KEY,
	gender ENUM('male', 'female') NOT NULL COMMENT 'Пол пользователя',
	birthday DATE NOT NULL COMMENT 'Дата рождения',
	city VARCHAR(150) NOT NULL COMMENT 'Город',
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	CONSTRAINT fk_cs_profiles_users FOREIGN KEY (user_id) REFERENCES users (id))
	COMMENT = 'Профиль пользователей';

DROP TABLE IF EXISTS store;

CREATE TABLE IF NOT EXISTS store(
	store_id SERIAL PRIMARY KEY,
	name VARCHAR(150) NOT NULL COMMENT 'Название магазина',
	description TEXT DEFAULT NULL COMMENT 'Описание магазина',
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP)
    COMMENT = 'Магазины';
   
DROP TABLE IF EXISTS `catalog`;
  
CREATE TABLE IF NOT EXISTS `catalog`(
	id SERIAL PRIMARY KEY,
	description VARCHAR(255) NOT NULL COMMENT 'Название разделов',
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP)
   	COMMENT = 'Категории';
   
DROP TABLE IF EXISTS products_store;

CREATE TABLE IF NOT EXISTS products_store(
	id SERIAL PRIMARY KEY,
	store_id BIGINT UNSIGNED NOT NULL,
	category_id BIGINT UNSIGNED NOT NULL,
	product_name VARCHAR(200) NOT NULL COMMENT 'Продукты',
	description TEXT DEFAULT NULL COMMENT 'Описание',
	price DECIMAL(11,2) NOT NULL COMMENT 'Цена руб.',
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_category_id FOREIGN KEY (category_id) REFERENCES `catalog` (id),
    CONSTRAINT fk_store_id FOREIGN KEY (store_id) REFERENCES store (store_id) ON DELETE CASCADE)
   	COMMENT = 'Продукты';

DROP TABLE IF EXISTS product_like_user;

CREATE TABLE IF NOT EXISTS product_like_user(
	id SERIAL PRIMARY KEY,
	user_id BIGINT UNSIGNED NOT NULL,
	products BIGINT UNSIGNED NOT NULL,
	CONSTRAINT fk_product_like_user_id FOREIGN KEY (user_id) REFERENCES users (id),
	CONSTRAINT fk_product_like_user FOREIGN KEY (products) REFERENCES products_store (id))
	COMMENT = 'Избранные товары';

DROP TABLE IF EXISTS feedback;

CREATE TABLE IF NOT EXISTS feedback(
	id SERIAL PRIMARY KEY,
	user_id BIGINT UNSIGNED NOT NULL,
	products BIGINT UNSIGNED NOT NULL,
	pluses VARCHAR(255) COMMENT 'Плюсы',
	minuses VARCHAR(255) COMMENT 'Минусы',
	comment TEXT NOT NULL COMMENT 'Комментарий',
	raiting ENUM ('*', '**', '***', '****', '*****'),
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT fk_feedback_user_id FOREIGN KEY (user_id) REFERENCES users (id),
	CONSTRAINT fk_feedback_products FOREIGN KEY (products) REFERENCES products_store (id))
	COMMENT = 'Отзыв на товар';

DROP TABLE IF EXISTS delivery_order;

CREATE TABLE IF NOT EXISTS delivery_order(
	order_id SERIAL PRIMARY KEY,
	user_id BIGINT UNSIGNED NOT NULL,
	product_id BIGINT UNSIGNED NOT NULL,
	adress TEXT NOT NULL,
	time_order DATETIME DEFAULT NOW(),
	CONSTRAINT fk_delivery_user_id FOREIGN KEY (user_id) REFERENCES users (id),
	CONSTRAINT fk_delivery_products FOREIGN KEY (product_id) REFERENCES products_store (id))
	COMMENT = 'Доставка';

DROP TABLE IF EXISTS `order`;

CREATE TABLE IF NOT EXISTS orders(
	order_id SERIAL PRIMARY KEY,
	user_id BIGINT UNSIGNED NOT NULL,
	product_id BIGINT UNSIGNED NOT NULL,
	time_order DATETIME DEFAULT NOW(),
	CONSTRAINT fk_order_user FOREIGN KEY (user_id) REFERENCES users (id),
	CONSTRAINT fk_order_product_id FOREIGN KEY (product_id) REFERENCES products_store (id))
	COMMENT = 'Самовывоз';
 

