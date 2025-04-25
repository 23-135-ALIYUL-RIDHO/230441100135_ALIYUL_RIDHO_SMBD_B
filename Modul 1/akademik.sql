CREATE DATABASE akademik;
USE akademik;

CREATE TABLE jurusan (
    id_jurusan INT PRIMARY KEY AUTO_INCREMENT,
    nama_jurusan VARCHAR(100) NOT NULL
);

INSERT INTO jurusan (nama_jurusan) VALUES
('Ninjutsu'),
('Pirate Studies'),
('Demon Slayer Academy'),
('Shinigami Training'),
('Hero Academia'),
('Tactical Warfare'),
('Sorcery Arts'),
('Hunter Association'),
('Titan Warfare'),
('Cybernetic Engineering');

CREATE TABLE mahasiswa (
    nim VARCHAR(12) PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    tanggal_lahir DATE,
    alamat VARCHAR(255),
    id_jurusan INT,
    FOREIGN KEY (id_jurusan) REFERENCES jurusan(id_jurusan) ON DELETE SET NULL
);
CREATE TABLE dosen (
    nip VARCHAR(12) PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    telepon VARCHAR(15),
    id_jurusan INT,
    FOREIGN KEY (id_jurusan) REFERENCES jurusan(id_jurusan) ON DELETE SET NULL
);
CREATE TABLE mata_kuliah (
    kode_mk VARCHAR(12) PRIMARY KEY,
    nama_mk VARCHAR(100) NOT NULL,
    sks INT NOT NULL,
    nip VARCHAR(12),
    FOREIGN KEY (nip) REFERENCES dosen(nip) ON DELETE SET NULL
);
CREATE TABLE krs (
    id_krs INT PRIMARY KEY AUTO_INCREMENT,
    nim VARCHAR(12),
    semester INT NOT NULL,
    tahun_akademik VARCHAR(10) NOT NULL,
    FOREIGN KEY (nim) REFERENCES mahasiswa(nim) ON DELETE CASCADE
);
CREATE TABLE detail_krs (
    id_detail_krs INT PRIMARY KEY AUTO_INCREMENT,
    id_krs INT,
    kode_mk CHAR(10),
    FOREIGN KEY (id_krs) REFERENCES krs(id_krs) ON DELETE CASCADE,
    FOREIGN KEY (kode_mk) REFERENCES mata_kuliah(kode_mk) ON DELETE CASCADE
);
INSERT INTO mahasiswa (nim, nama, tanggal_lahir, alamat, id_jurusan) VALUES
('230441100001', 'Naruto Uzumaki', '2002-10-10', 'Konohagakure', 1),
('230441100002', 'Sasuke Uchiha', '2002-07-23', 'Konohagakure', 1),
('230441100003', 'Hinata Hyuga', '2002-12-27', 'Konohagakure', 2),
('230441100004', 'Mikasa Ackerman', '2001-02-10', 'Shiganshina', 3),
('230441100005', 'Eren Yeager', '2001-03-30', 'Shiganshina', 3),
('230441100006', 'Gojo Satoru', '2000-12-07', 'Tokyo', 2),
('230441100007', 'Itachi Uchiha', '1995-06-09', 'Konohagakure', 1),
('230441100008', 'Levi Ackerman', '1990-12-25', 'Underground City', 3),
('230441100009', 'Guts', '1985-04-05', 'Midland', 3),
('230441100010', 'Luffy D. Monkey', '2002-05-05', 'East Blue', 2);

INSERT INTO dosen (nip, nama, email, telepon, id_jurusan) VALUES
('100100100001', 'Kakashi Hatake', 'kakashi@example.com', '081234567890', 1),
('100100100002', 'Jiraiya', 'jiraiya@example.com', '082345678901', 2),
('100100100003', 'Orochimaru', 'orochimaru@example.com', '083456789012', 3),
('100100100004', 'All Might', 'allmight@example.com', '084567890123', 1),
('100100100005', 'Aizawa Shouta', 'aizawa@example.com', '085678901234', 2),
('100100100006', 'Meruem', 'meruem@example.com', '086789012345', 3),
('100100100007', 'Silvers Rayleigh', 'rayleigh@example.com', '087890123456', 1),
('100100100008', 'Gojou Satoru', 'gojou@example.com', '088901234567', 2),
('100100100009', 'Genryusai Yamamoto', 'yamamoto@example.com', '089012345678', 3),
('100100100010', 'Zeno Zoldyck', 'zeno@example.com', '080123456789', 1);

SELECT * FROM mahasiswa;
SELECT * FROM dosen;
SELECT * FROM mata_kuliah;
SELECT * FROM krs;
SELECT * FROM detail_krs;

INSERT INTO krs (nim, semester, tahun_akademik) VALUES
('230441100001', 1, '2024/2025'),
('230441100002', 1, '2024/2025'),
('230441100003', 2, '2023/2024'),
('230441100004', 3, '2022/2023'),
('230441100005', 4, '2021/2022');

INSERT INTO mata_kuliah (kode_mk, nama_mk, sks, nip) VALUES
('MK001', 'Jutsu Dasar', 3, '100100100001'),
('MK002', 'Kenjutsu Lanjutan', 2, '100100100002'),
('MK003', 'Teknik Kuno Seiryu', 3, '100100100003'),
('MK004', 'Analisis Strategi Peperangan', 4, '100100100004'),
('MK005', 'Quirk dan Evolusi', 3, '100100100005'),
('MK006', 'Teori Kutukan dan Penghapusan', 3, '100100100006'),
('MK007', 'Haki dan Buah Iblis', 3, '100100100007'),
('MK008', 'Bankai Mastery', 3, '100100100008'),
('MK009', 'Teknik Pembasmian Titan', 3, '100100100009'),
('MK010', 'Pengkodean Cyborg dan AI', 4, '100100100010');

INSERT INTO detail_krs (id_krs, kode_mk) VALUES
(1,'MK001'),
(1,'MK002'),
(2,'MK001')
 
update mata_kuliah set nama_mk='cihuy' where kode_mk ='MK002';
delete from mata_kuliah where kode_mk='MK010';
alter table dosen drop nidn; 
alter 