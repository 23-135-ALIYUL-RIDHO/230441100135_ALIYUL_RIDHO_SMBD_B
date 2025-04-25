-- 1. Menambahkan kolom 'keterangan' di tabel orders
ALTER TABLE orders
ADD keterangan TEXT AFTER STATUS;
SELECT * FROM orders;
UPDATE orders SET keterangan = 'pesanan sedang dalam tujuan' WHERE STATUS='Shipped';
UPDATE orders SET keterangan = 'pesanan sudah samapi di alamat tujuan' WHERE STATUS='Completed';


-- 2. Gabungan tabel orders dan customers
SELECT 
    a.order_id, 
    b.name AS nama_pelanggan, 
    a.total_price, 
    a.STATUS
FROM orders a
JOIN customers b ON a.customer_id = b.customer_id;

-- 3. Urutan data menggunakan ORDER BY DESC dan ASC

-- 3a. Urutkan produk berdasarkan harga dari tertinggi (DESC)
SELECT * FROM products a
ORDER BY a.harga DESC;

-- 3b. Urutkan pelanggan berdasarkan nama (ASC)
SELECT * FROM customers a
ORDER BY a.NAME ASC;

-- 3c. Urutkan pesanan berdasarkan tanggal terbaru (DESC)
SELECT * FROM orders a
ORDER BY a.order_date DESC;

-- 4. Mengubah tipe data kolom phone di tabel customers
ALTER TABLE customers
MODIFY phone VARCHAR(20);
SELECT * FROM customers;

-- 5. JOIN (LEFT JOIN, RIGHT JOIN, SELF JOIN)

-- 5a. LEFT JOIN: semua produk dan pemasok
SELECT 
    a.NAME AS nama_produk,
    c.nama_pemasok
FROM products a
LEFT JOIN product_suppliers b ON a.id_produk = b.id_produk
LEFT JOIN suppliers c ON b.id_pemasok = c.id_pemasok;

-- 5b. RIGHT JOIN: semua pemasok dan produk yang mereka suplai (jika ada)
SELECT 
    c.nama_pemasok,
    a.NAME AS nama_produk
FROM products a
RIGHT JOIN product_suppliers b ON a.id_produk = b.id_produk
RIGHT JOIN suppliers c ON b.id_pemasok = c.id_pemasok;

SELECT * FROM suppliers;
SELECT * FROM product_suppliers;
INSERT INTO product_suppliers VALUES(1,4);
-- 5c. SELF JOIN: pelanggan dengan alamat yang sama
SELECT 
    a.NAME AS pelanggan_1,
    b.NAME AS pelanggan_2,
    a.address
FROM customers a
JOIN customers b ON a.address = b.address AND a.customer_id <> b.customer_id;
SELECT * FROM customers;
INSERT INTO customers (NAME,address) VALUES ('ridho slebew','Desa Konoha, Rumah Uchiha');
-- 6. Operator perbandingan (>, <, <=, >=, <>)

-- 6a. Produk dengan harga lebih dari 100
SELECT * FROM products a WHERE a.harga > 100;

-- 6b. Produk dengan harga kurang dari atau sama dengan 50
SELECT * FROM products a WHERE a.harga <= 50;

-- 6c. Pesanan dengan total harga lebih dari atau sama dengan 100
SELECT * FROM orders a WHERE a.total_price >= 100;

-- 6d. Produk yang stok-nya tidak sama dengan 0
SELECT * FROM products a WHERE a.stok <> 0;

-- 6e. Pelanggan dengan ID kurang dari 5
SELECT * FROM customers a WHERE a.customer_id < 5;
