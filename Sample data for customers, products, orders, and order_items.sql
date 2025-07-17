  CREATE TABLE customers (
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender VARCHAR(10),
    email VARCHAR(100),
    signup_date DATE,
    country VARCHAR(50),
    customer_id INT PRIMARY KEY
);
INSERT INTO customers (first_name, last_name, gender, email, signup_date, country, customer_id) VALUES
('Taylor', 'Saunders', 'Male', 'mackterri@perez.net', '2025-04-30', 'India', 1),
('Joshua', 'Martin', 'Female', 'richardtran@gmail.com', '2024-04-06', 'USA', 2),
('Michael', 'Flores', 'Male', 'jessicaperez@torres.com', '2023-10-03', 'USA', 3),
('Cody', 'Hansen', 'Male', 'brianwalker@dunn.org', '2025-04-27', 'Canada', 4),
('Craig', 'Anderson', 'Male', 'gscott@huff.info', '2024-08-13', 'Canada', 5),
('Terri', 'Osborne', 'Female', 'kenneth84@yahoo.com', '2024-05-26', 'India', 6),
('Robert', 'Peterson', 'Male', 'johnny81@valdez.org', '2024-11-07', 'India', 7),
('Rebecca', 'Edwards', 'Male', 'nicholasmendoza@mcdonald.com', '2024-08-18', 'USA', 8),
('Jason', 'Flynn', 'Male', 'makayla16@cole.com', '2023-11-20', 'Canada', 9),
('Kenneth', 'Bryant', 'Male', 'james93@vargas.com', '2024-12-27', 'Canada', 10),
('Mark', 'Barrett', 'Female', 'anthony04@gmail.com', '2023-09-04', 'USA', 11),
('Christopher', 'Newton', 'Female', 'dbarr@gmail.com', '2023-08-08', 'Canada', 12),
('Suzanne', 'Winters', 'Female', 'xsteele@campbell-hunter.com', '2024-03-30', 'India', 13),
('Megan', 'Church', 'Male', 'xdiaz@summers.com', '2024-04-12', 'Germany', 14),
('Rebecca', 'Wallace', 'Female', 'hayesrobert@gmail.com', '2024-10-05', 'UK', 15),
('Alex', 'Davis', 'Male', 'mullinsmichelle@yahoo.com', '2024-12-30', 'USA', 16),
('John', 'Morales', 'Female', 'amanda74@morrow.net', '2025-03-21', 'Germany', 17),
('Andrea', 'Lambert', 'Female', 'kellyandrew@green.info', '2023-12-09', 'UK', 18),
('Shawn', 'Wright', 'Male', 'zacharyhoover@yahoo.com', '2024-11-16', 'Canada', 19),
('Stacey', 'Richardson', 'Female', 'josephthompson@yahoo.com', '2024-10-17', 'India', 20),
('Raymond', 'Harrison', 'Male', 'michaelcole@stevens.com', '2024-02-20', 'USA', 21),
('Melissa', 'Pierce', 'Female', 'debra85@reed.com', '2025-02-09', 'UK', 22),
('Dustin', 'Washington', 'Male', 'harrisnicholas@gmail.com', '2023-08-01', 'Germany', 23),
('Julia', 'Dean', 'Female', 'brittanymoreno@harrison.net', '2025-01-15', 'Canada', 24),
('Stephen', 'Morris', 'Male', 'sharongreene@gmail.com', '2024-06-07', 'India', 25);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price NUMERIC(10,2)
);
INSERT INTO products (product_id, product_name, category, price) VALUES
(6, 'Toys Product 6', 'Toys', 215.75),
(7, 'Books Product 7', 'Books', 392.17),
(8, 'Toys Product 8', 'Toys', 295.61),
(9, 'Electronics Product 9', 'Electronics', 368.78),
(10, 'Clothing Product 10', 'Clothing', 414.46),
(11, 'Books Product 11', 'Books', 343.34),
(12, 'Electronics Product 12', 'Electronics', 417.63),
(13, 'Toys Product 13', 'Toys', 85.68),
(14, 'Toys Product 14', 'Toys', 434.10),
(15, 'Clothing Product 15', 'Clothing', 87.50),
(16, 'Home & Kitchen Product 16', 'Home & Kitchen', 267.65),
(17, 'Books Product 17', 'Books', 486.23),
(18, 'Home & Kitchen Product 18', 'Home & Kitchen', 183.98),
(19, 'Home & Kitchen Product 19', 'Home & Kitchen', 213.58),
(20, 'Electronics Product 20', 'Electronics', 302.43),
(1, 'Home & Kitchen Product 1', 'Home & Kitchen', 449.93),
(2, 'Home & Kitchen Product 2', 'Home & Kitchen', 187.38),
(3, 'Books Product 3', 'Books', 259.67),
(4, 'Electronics Product 4', 'Electronics', 380.33),
(5, 'Electronics Product 5', 'Electronics', 84.89);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    order_date DATE,
    status VARCHAR(20)
);
INSERT INTO orders (order_id, customer_id, order_date, status) VALUES
(1, 5, '2024-12-15', 'Completed'),
(2, 12, '2025-01-09', 'Completed'),
(3, 20, '2025-03-02', 'Canceled'),
(4, 7, '2024-10-27', 'Returned'),
(5, 15, '2024-09-12', 'Completed'),
(6, 9, '2024-08-25', 'Completed'),
(7, 3, '2025-02-01', 'Returned'),
(8, 17, '2025-04-18', 'Completed'),
(9, 1, '2024-11-08', 'Canceled'),
(10, 10, '2025-06-03', 'Completed'),
(11, 6, '2025-05-14', 'Completed'),
(12, 13, '2025-01-29', 'Canceled'),
(13, 4, '2024-07-19', 'Completed'),
(14, 8, '2025-06-30', 'Completed'),
(15, 11, '2024-09-01', 'Returned');

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT REFERENCES orders(order_id),
    product_id INT REFERENCES products(product_id),
    quantity INT,
    item_price NUMERIC(10,2)
);
INSERT INTO order_items (order_item_id, order_id, product_id, quantity, item_price) VALUES
(1, 1, 3, 2, 259.67),
(2, 1, 15, 1, 87.50),
(3, 2, 7, 3, 392.17),
(4, 3, 10, 2, 414.46),
(5, 4, 14, 1, 434.10),
(6, 4, 13, 2, 85.68),
(7, 5, 1, 4, 449.93),
(8, 6, 2, 1, 187.38),
(9, 6, 17, 2, 486.23),
(10, 7, 11, 3, 343.34),
(11, 8, 5, 1, 84.89),
(12, 8, 19, 1, 213.58),
(13, 9, 4, 2, 380.33),
(14, 10, 12, 1, 417.63),
(15, 11, 6, 2, 215.75),
(16, 12, 16, 3, 267.65),
(17, 13, 8, 1, 295.61),
(18, 14, 18, 2, 183.98),
(19, 15, 9, 1, 368.78),
(20, 15, 20, 1, 302.43);
 
 

 
 










































 









