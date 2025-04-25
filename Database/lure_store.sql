CREATE DATABASE lure_store;
USE lure_store;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    NAME VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15),
    address VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE products (
    id_produk INT PRIMARY KEY AUTO_INCREMENT,
    NAME VARCHAR(100) NOT NULL,
    kategori VARCHAR(50) NOT NULL,
    harga DECIMAL(10,2) NOT NULL,
    stok INT NOT NULL DEFAULT 0,
    deskripsi TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_price DECIMAL(10,2) NOT NULL,
    STATUS ENUM('Pending', 'Shipped', 'Completed', 'Canceled') DEFAULT 'Pending',
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE
);
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    id_produk INT NOT NULL,
    banyak_item INT NOT NULL CHECK (banyak_item > 0),
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (id_produk) REFERENCES products(id_produk) ON DELETE CASCADE
);
CREATE TABLE suppliers (
    id_pemasok INT PRIMARY KEY AUTO_INCREMENT,
    nama_pemasok VARCHAR(100) NOT NULL,
    phone VARCHAR(15),
    email VARCHAR(100),
    address TEXT
);
CREATE TABLE product_suppliers (
    id_produk INT NOT NULL,
    id_pemasok INT NOT NULL,
    PRIMARY KEY (id_produk, id_pemasok),
    FOREIGN KEY (id_produk) REFERENCES products(id_produk) ON DELETE CASCADE,
    FOREIGN KEY (id_pemasok) REFERENCES suppliers(id_pemasok) ON DELETE CASCADE
);


INSERT INTO customers (NAME, email, phone, address) VALUES
('Sasuke Uchiha', 'sasuke@konoha.com', '08123456789', 'Desa Konoha, Rumah Uchiha'),
('Megumin', 'megumin@explosion.com', '08234567890', 'Belakang Guild Adventurer, Axel Town'),
('Levi Ackerman', 'levi@scoutinglegion.com', '08345678901', 'Dinding Maria, Kamar Kapten Levi'),
('Gintoki Sakata', 'gintoki@yorozuya.com', '08456789012', 'Kabukicho, Edo, Jepang'),
('Aqua', 'aqua@goddess.com', '08567890123', 'Dimensi Dewa, Tempat Reinkarnasi'),
('Zoro Roronoa', 'zoro@strawhats.com', '08678901234', '??? (Dia sendiri juga tidak tahu)'),
('Senku Ishigami', 'senku@100billionpercent.com', '08789012345', 'Stone World, Jepang Masa Batu'),
('Anya Forger', 'anya@elegant.com', '08890123456', 'Rumah Keluarga Forger, Kota Berlint'),
('Kaguya Shinomiya', 'kaguya@shuchiin.com', '08901234567', 'Akademi Shuchiin, Ruang OSIS'),
('Tanjiro Kamado', 'tanjiro@demoncorp.com', '08012345678', 'Gunung Sagiri, Jepang');

INSERT INTO products (NAME, kategori, harga, stok, deskripsi) VALUES
('Sharingan Bait', 'Fishing Lures', 99.99, 10, 'Menarik perhatian ikan dengan Genjutsu!'),
('Explosion Bait', 'Fishing Lures', 77.77, 20, 'Bait ini hanya bisa digunakan sekali. EXPLOSION!'),
('Ackerman Hook', 'Hooks', 129.99, 15, 'Secepat refleks Levi!'),
('Zura Rod', 'Fishing Rods', 88.88, 25, 'Bukan Katsura, tapi pancing Zura!'),
('Divine Water Bait', 'Fishing Lures', 55.55, 30, 'Diberkahi oleh Aqua, tapi jangan percaya airnya.'),
('Lost Navigator Compass', 'Accessories', 10.10, 50, 'Dijamin bikin kamu kehilangan arah seperti Zoro.'),
('100 Billion Percent Rod', 'Fishing Rods', 150.00, 5, 'Rod ini dibuat dengan ilmu pengetahuan!'),
('Elegant Hook', 'Hooks', 49.49, 35, 'Bait ini memiliki ELEGANCE, cocok untuk Anya.'),
('Love Is War Net', 'Nets', 120.00, 12, 'Strategi cerdas menangkap ikan, tapi hati-hati jangan jatuh cinta.'),
('Sun Breathing Line', 'Fishing Line', 200.00, 8, 'Matahari terbit! Jaring yang tak tertandingi.');

INSERT INTO orders (customer_id, total_price, STATUS) VALUES
(1, 99.99, 'Pending'),
(2, 77.77, 'Shipped'),
(3, 129.99, 'Completed'),
(4, 88.88, 'Canceled'),
(5, 55.55, 'Pending'),
(6, 10.10, 'Completed'),
(7, 150.00, 'Pending'),
(8, 49.49, 'Shipped'),
(9, 120.00, 'Pending'),
(10, 200.00, 'Completed');

INSERT INTO order_items (order_id, id_produk, banyak_item, price) VALUES
(1, 1, 1, 99.99),
(2, 2, 1, 77.77),
(3, 3, 1, 129.99),
(4, 4, 1, 88.88),
(5, 5, 1, 55.55),
(6, 6, 1, 10.10),
(7, 7, 1, 150.00),
(8, 8, 1, 49.49),
(9, 9, 1, 120.00),
(10, 10, 1, 200.00);

INSERT INTO suppliers (nama_pemasok, phone, email, address) VALUES
('Uchiha Fishing Corp', '0811223344', 'uchiha@fishing.com', 'Konoha, Jepang'),
('Explosion Supply Co.', '0822334455', 'megumin@boom.com', 'Axel Town, Fantasy World'),
('Ackerman Gear Works', '0833445566', 'levi@gears.com', 'Wall Maria, Paradise Island'),
('Yorozuya Fishing Tools', '0844556677', 'gintoki@yorozuya.com', 'Edo, Jepang'),
('Aqua Holy Water Inc.', '0855667788', 'aqua@water.com', 'Dimensi Dewa'),
('Lost Navigator Supplies', '0866778899', 'zoro@whereami.com', 'Somewhere, IDK'),
('Ishigami Science Lab', '0877889900', 'senku@science.com', 'Stone World, Jepang'),
('Elegant Gear', '0888990011', 'anya@elegant.com', 'Berlint, Westalis'),
('Shuchiin Fishing Tech', '0899001122', 'kaguya@shuchiin.com', 'Tokyo, Jepang'),
('Demon Slayer Corp', '0800112233', 'tanjiro@demonslayer.com', 'Jepang, Era Taisho');

INSERT INTO product_suppliers (id_produk, id_pemasok) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM order_items;
SELECT * FROM suppliers;
SELECT * FROM product_suppliers;

