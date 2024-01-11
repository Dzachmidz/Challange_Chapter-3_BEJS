-- Membuat Database
CREATE DATABASE bank_account -- Tabel Nasabah (Customer)
CREATE TABLE Customer (
    CustomerID BIGSERIAL PRIMARY KEY NOT NULL,
    Nama VARCHAR(255) NOT NULL,
    Alamat VARCHAR(255) NOT NULL,
    NomorTelepon VARCHAR(15) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    TanggalLahir DATE NOT NULL,
    JenisKelamin VARCHAR(10) NOT NULL,
    Pekerjaan VARCHAR(255) NOT NULL
);

-- Tabel Akun (Account)
CREATE TABLE Account (
    AccountID BIGSERIAL PRIMARY KEY NOT NULL,
    CustomerID INT NOT NULL,
    JenisAkun VARCHAR(20) NOT NULL,
    Saldo INT NOT NULL,
    TanggalDibuka DATE NOT NULL,
    Status VARCHAR(10) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

-- Tabel Transaksi (Transaction)
CREATE TABLE Transaction (
    TransactionID BIG SERIAL PRIMARY KEY NOT NULL,
    AccountID INT NOT NULL,
    TanggalTransaksi DATE NOT NULL,
    JenisTransaksi VARCHAR(10) NOT NULL,
    JumlahTransaksi INT NOT NULL,
    Keterangan VARCHAR(255),
    FOREIGN KEY (AccountID) REFERENCES Account(AccountID)
);

-- Menambahkan Nasabah baru
INSERT INTO
    Customer (
        CustomerID,
        Nama,
        Alamat,
        NomorTelepon,
        Email,
        TanggalLahir,
        JenisKelamin,
        Pekerjaan
    )
VALUES
    (
        1,
        'Achmad Fahmi Al Hafidz',
        'Sugihwaras, Candi, Sidoarjo',
        '08123094728',
        'fahmi@mail.com',
        '2002-01-01',
        'Laki-laki',
        'PNS'
    ),
    (
        2,
        'Muhammad Syauqi Al Hasani',
        'Jambangan, Surabaya',
        '08574927482',
        'syauqi@mail.com',
        '2005-12-01',
        'Laki-laki',
        'Pilot'
    ),
    (
        3,
        'Achmad Syafiq Al Falah',
        'Bekasi, Gresik',
        '08924639104',
        'falah@mail.com',
        '2004-08-15',
        'Laki-laki',
        'Nahkoda'
    );

-- Menambahkan Akun baru untuk Nasabah
INSERT INTO
    Account (
        AccountID,
        CustomerID,
        JenisAkun,
        Saldo,
        TanggalDibuka,
        Status
    )
VALUES
    (
        101,
        1,
        'Tabungan',
        1000000,
        '2023-05-04',
        'Aktif'
    ),
    (
        102,
        2,
        'Pembayaran',
        1500000,
        '2023-09-10',
        'Aktif'
    ),
    (
        103,
        3,
        'Pemindahan Dana',
        2000000,
        '2023-10-10',
        'Aktif'
    );

-- Menambahkan Transaksi baru untuk Akun
INSERT INTO
    Transaction (
        TransactionID,
        AccountID,
        TanggalTransaksi,
        JenisTransaksi,
        JumlahTransaksi,
        Keterangan
    )
VALUES
    (
        1001,
        101,
        '2023-09-22',
        'Kredit',
        50000,
        'Setoran'
    ),
    (
        1002,
        102,
        '2023-12-12',
        'Penarikan',
        14900000,
        'Top Up EPEP'
    ),
    (
        1003,
        103,
        '2023-01-01',
        'Pemasukan',
        1500000,
        'Gajian'
    );

-- Mengambil informasi semua Nasabah
SELECT
    *
FROM
    Customer;

-- Mengambil informasi semua Akun
SELECT
    *
FROM
    Account;

-- Mengambil informasi semua Transaksi
SELECT
    *
FROM
    Transaction;

-- Mengambil informasi Akun yang dimiliki oleh seorang Nasabah
SELECT
    *
FROM
    Account
WHERE
    CustomerID = 1;

-- Mengambil informasi Transaksi yang terkait dengan suatu Akun
SELECT
    *
FROM
    Transaction
WHERE
    AccountID = 103;

-- Mengubah alamat seorang Nasabah
UPDATE
    Customer
SET
    Alamat = 'Bandung, Jawa Barat'
WHERE
    CustomerID = 2;

-- Mengubah saldo suatu Akun
UPDATE
    Account
SET
    Saldo = 1500000
WHERE
    AccountID = 103;

-- Mengubah keterangan suatu Transaksi
UPDATE
    Transaction
SET
    Keterangan = 'Pegeluaran'
WHERE
    TransactionID = 1002;

-- Menghapus seorang Nasabah dan seluruh Akun yang dimilikinya
DELETE FROM
    Customer
WHERE
    CustomerID = 1;

-- Menghapus suatu Akun beserta semua Transaksi yang terkait
DELETE FROM
    Account
WHERE
    AccountID = 101;

-- Menghapus suatu Transaksi
DELETE FROM
    Transaction
WHERE
    TransactionID = 1002;