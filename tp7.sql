CREATE DATABASE ecommerce;

use ecommerce;

CREATE TABLE products (
	product_id INT AUTO_INCREMENT PRIMARY KEY,
    product VARCHAR(255) NOT NULL,
    prod_description VARCHAR(255),
    price FLOAT NOT NULL,
    stock INT NOT NULL
);

CREATE INDEX idx_price_product ON products(price, product_id);

CREATE TABLE users(
	user_id int AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL
);

CREATE TABLE orders (
	order_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    date DATETIME NOT NULL,
    total_price FLOAT,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);


CREATE TABLE order_detail (
	detail_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    product_price FLOAT NOT NULL,
    total_detail FLOAT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (product_price) REFERENCES products(price)
);



SELECT * FROM order_detail;
SELECT * FROM products;
SELECT * FROM users;
SELECT * FROM orders;

