-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 08 Nov 2023 pada 23.24
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `penjualan2`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `penjualan`
--

CREATE TABLE `penjualan` (
  `no_jual` varchar(50) NOT NULL,
  `tgl_jual` date NOT NULL,
  `kode_brg` varchar(50) NOT NULL,
  `nama_brg` varchar(50) NOT NULL,
  `harga` decimal(10,0) NOT NULL,
  `id_customer` varchar(50) NOT NULL,
  `nama_customer` varchar(50) NOT NULL,
  `qty_penjualan` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `penjualan`
--

INSERT INTO `penjualan` (`no_jual`, `tgl_jual`, `kode_brg`, `nama_brg`, `harga`, `id_customer`, `nama_customer`, `qty_penjualan`) VALUES
('v001,\'v001,\'v002', '0000-00-00', '', '', '0', '', '', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `penjualan_brg`
--

CREATE TABLE `penjualan_brg` (
  `no_jual` varchar(50) NOT NULL,
  `tgl_jual` decimal(10,0) NOT NULL,
  `id_customer` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_barang`
--

CREATE TABLE `tb_barang` (
  `kode_brg` varchar(50) NOT NULL,
  `nama_brg` varchar(50) NOT NULL,
  `harga` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_customer`
--

CREATE TABLE `tb_customer` (
  `id_customer` varchar(50) NOT NULL,
  `nama_customer` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_detail_penjualan_brg`
--

CREATE TABLE `tb_detail_penjualan_brg` (
  `no_jual` varchar(50) NOT NULL,
  `kode-brg` varchar(50) NOT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_id_customer`
--

CREATE TABLE `tb_id_customer` (
  `id_customer` varchar(50) NOT NULL,
  `nama_customer` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_kode_brg`
--

CREATE TABLE `tb_kode_brg` (
  `kode_brg` varchar(50) NOT NULL,
  `nama_brg` varchar(50) NOT NULL,
  `harga` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_penjualan_brg`
--

CREATE TABLE `tb_penjualan_brg` (
  `no_jual` varchar(50) NOT NULL,
  `tgl_jual` date NOT NULL,
  `kode_brg` varchar(50) NOT NULL,
  `id_customer` varchar(50) NOT NULL,
  `qty_penjualan` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `penjualan_brg`
--
ALTER TABLE `penjualan_brg`
  ADD PRIMARY KEY (`no_jual`),
  ADD KEY `id_customer` (`id_customer`);

--
-- Indeks untuk tabel `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD KEY `kode_brg` (`kode_brg`);

--
-- Indeks untuk tabel `tb_customer`
--
ALTER TABLE `tb_customer`
  ADD PRIMARY KEY (`id_customer`);

--
-- Indeks untuk tabel `tb_detail_penjualan_brg`
--
ALTER TABLE `tb_detail_penjualan_brg`
  ADD PRIMARY KEY (`no_jual`,`kode-brg`),
  ADD KEY `no_jual,kode_brg` (`qty`),
  ADD KEY `kode-brg` (`kode-brg`);

--
-- Indeks untuk tabel `tb_id_customer`
--
ALTER TABLE `tb_id_customer`
  ADD KEY `id_customer` (`id_customer`);

--
-- Indeks untuk tabel `tb_kode_brg`
--
ALTER TABLE `tb_kode_brg`
  ADD PRIMARY KEY (`kode_brg`);

--
-- Indeks untuk tabel `tb_penjualan_brg`
--
ALTER TABLE `tb_penjualan_brg`
  ADD KEY `kode_brg` (`kode_brg`),
  ADD KEY `id_customer` (`id_customer`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `penjualan_brg`
--
ALTER TABLE `penjualan_brg`
  ADD CONSTRAINT `penjualan_brg_ibfk_1` FOREIGN KEY (`id_customer`) REFERENCES `tb_id_customer` (`id_customer`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_detail_penjualan_brg`
--
ALTER TABLE `tb_detail_penjualan_brg`
  ADD CONSTRAINT `tb_detail_penjualan_brg_ibfk_1` FOREIGN KEY (`kode-brg`) REFERENCES `tb_barang` (`kode_brg`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_detail_penjualan_brg_ibfk_2` FOREIGN KEY (`no_jual`) REFERENCES `penjualan_brg` (`no_jual`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_penjualan_brg`
--
ALTER TABLE `tb_penjualan_brg`
  ADD CONSTRAINT `tb_penjualan_brg_ibfk_1` FOREIGN KEY (`kode_brg`) REFERENCES `tb_kode_brg` (`kode_brg`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_penjualan_brg_ibfk_2` FOREIGN KEY (`id_customer`) REFERENCES `tb_customer` (`id_customer`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
