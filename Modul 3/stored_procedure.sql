-- START SOAL 1

-- AddUMKM
DELIMITER //

CREATE PROCEDURE addUMKM (
    IN p_nama_usaha VARCHAR(200),
    IN p_jumlah_karyawan INT
)
BEGIN
    INSERT INTO umkm (nama_usaha, jumlah_karyawan, tanggal_registrasi)
    VALUES (p_nama_usaha, p_jumlah_karyawan, CURDATE());
END //

DELIMITER ;

CALL addUMKM('ayam geprek', 15);
SELECT nama_usaha,jumlah_karyawan,tanggal_registrasi FROM umkm WHERE tanggal_registrasi = CURDATE();

-- UpdateKategoriUMKM
DELIMITER //

CREATE PROCEDURE updateKategoriUMKM (
    IN p_id_kategori INT,
    IN p_nama_baru VARCHAR(100)
)
BEGIN
    UPDATE kategori_umkm
    SET nama_kategori = p_nama_baru
    WHERE id_kategori = p_id_kategori;
END //

DELIMITER ;

CALL updateKategoriUMKM(4, 'netrworking');
SELECT id_kategori, nama_kategori FROM kategori_umkm WHERE id_kategori = 3;
SELECT * FROM kategori_umkm;

-- DeletePemilikUMKM
DELIMITER //

CREATE OR REPLACE PROCEDURE deletePemilikUMKM (
    IN p_id_pemilik INT
)
BEGIN
    DELETE FROM pemilik_umkm WHERE id_pemilik = p_id_pemilik;
END //

DELIMITER ;
CALL deletePemilikUMKM(2);


INSERT INTO pemilik_umkm (id_pemilik, nama_lengkap) VALUES (2,'ridho subianto');
UPDATE umkm SET id_pemilik = 4 WHERE id_umkm = 5;
SELECT * FROM umkm;
SELECT * FROM pemilik_umkm;

-- AddProduk
DELIMITER //

CREATE PROCEDURE addProduk (
    IN p_id_umkm INT,
    IN p_nama_produk VARCHAR(200),
    IN p_harga DECIMAL(15,2)
)
BEGIN
    INSERT INTO produk_umkm (id_umkm, nama_produk, harga)
    VALUES (p_id_umkm, p_nama_produk, p_harga);
END //

DELIMITER ;

CALL addProduk(2, 'Keripik Pisang', 15000.00);

SELECT id_umkm , nama_produk, harga FROM produk_umkm WHERE id_umkm = 2;
-- getUMKMByID
DELIMITER //

CREATE PROCEDURE GetUMKMByID (
    IN p_id_umkm INT,
    OUT p_nama_usaha VARCHAR(200),
    OUT p_jumlah_karyawan INT
)
BEGIN
    SELECT nama_usaha, jumlah_karyawan
    INTO p_nama_usaha, p_jumlah_karyawan
    FROM umkm
    WHERE id_umkm = p_id_umkm;
END //

DELIMITER ;

CALL GetUMKMByID(6, @nama_usaha, @jumlah_karyawan);
SELECT @nama_usaha, @jumlah_karyawan;


-- END SOAL 1

-- START SOAL 2

-- UpdateDataMaster
DELIMITER //

CREATE PROCEDURE UpdateDataMaster (
    IN id INT,
    IN nilai_baru DECIMAL(10,2),
    OUT status_msg VARCHAR(100)
)
BEGIN
    DECLARE ROW_COUNT INT;

    UPDATE products SET harga = nilai_baru WHERE id_produk = id;
    SET ROW_COUNT = ROW_COUNT();

    IF ROW_COUNT > 0 THEN
        SET status_msg = 'Update berhasil';
    ELSE
        SET status_msg = 'Data tidak ditemukan';
    END IF;
END //

DELIMITER ;

CALL UpdateDataMaster(11, 70.00, @status_msg);
SELECT @status_msg;
SELECT * FROM products;

-- CountTransaksi
DELIMITER //

CREATE PROCEDURE CountTransaksi (
    OUT total_transaksi INT
)
BEGIN
    SELECT COUNT(*) INTO total_transaksi FROM orders;
END //

DELIMITER ;
CALL CountTransaksi(@total_transaksi);
SELECT @total_transaksi;

-- GetDataMasterByID
DELIMITER //

CREATE OR REPLACE PROCEDURE GetDataMasterByID (
    INOUT id INT,
    OUT nama_produk VARCHAR(100),
    OUT harga_produk DECIMAL(10,2)
)
BEGIN
    SELECT id ,NAME ,harga INTO id,nama_produk, harga_produk
    FROM products
    WHERE id_produk = id;
END //

DELIMITER ;
SET @id =6;
CALL GetDataMasterByID(@id,@nama_produk, @harga_produk);
SELECT @id,@nama_produk, @harga_produk ;


-- UpdateFieldTransaksi
DELIMITER //

CREATE PROCEDURE UpdateFieldTransaksi (
    IN id INT,
    INOUT total_price_param DECIMAL(10,2),
    INOUT status_param ENUM('Pending', 'Shipped', 'Completed', 'Canceled')
)
BEGIN
    

    UPDATE orders
    SET total_price = total_price_param,
        STATUS = status_param
    WHERE order_id = id;
END //

DELIMITER ;

SET @total_price = 200.00;
SET @status = 'completed';

CALL UpdateFieldTransaksi(3, @total_price, @status);
SELECT * FROM orders;

SET @total_price = 175000.00;
SET @status = 'Shipped';

CALL UpdateFieldTransaksi(3, @total_price, @status);


-- DeleteEntriesByIDMaster
DELIMITER //

CREATE PROCEDURE DeleteEntriesByIDMaster (
    IN id INT
)
BEGIN
    DELETE FROM products WHERE id_produk = id;
END //

DELIMITER ;

CALL DeleteEntriesByIDMaster(7);
SELECT * FROM products;


-- END SOAL 2