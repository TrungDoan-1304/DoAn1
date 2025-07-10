-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 09, 2025 at 05:08 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `banquanao`
--

-- --------------------------------------------------------

--
-- Table structure for table `chitietdonhang`
--

CREATE TABLE `chitietdonhang` (
  `MaDonHang` int(11) NOT NULL,
  `MaSP` int(11) NOT NULL,
  `SLDaMua` int(11) NOT NULL,
  `GiaBan` double NOT NULL,
  `ThanhTien` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `danhmucsp`
--

CREATE TABLE `danhmucsp` (
  `MaDanhMuc` int(11) NOT NULL,
  `DanhMuc` varchar(30) NOT NULL,
  `MoTa` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `danhmucsp`
--

INSERT INTO `danhmucsp` (`MaDanhMuc`, `DanhMuc`, `MoTa`) VALUES
(1, 'Áo sơ mi', 'Các loại áo sơ mi nam công sở, dự tiệc, casual.'),
(2, 'Áo thun', 'Áo thun nam phong cách trẻ trung, năng động.'),
(3, 'Quần jeans', 'Các mẫu quần jeans nam, nhiều form dáng.'),
(4, 'Áo khoác', 'Áo khoác thời trang, chống nắng, giữ ấm.'),
(5, 'Quần short', 'Quần short kaki, jeans, thể thao cho nam.');

-- --------------------------------------------------------

--
-- Table structure for table `donhang`
--

CREATE TABLE `donhang` (
  `MaDonHang` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `NgayDatHang` date NOT NULL,
  `TongTienDH` double NOT NULL,
  `TrangThaiDH` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `giohang`
--

CREATE TABLE `giohang` (
  `MaSP` int(11) NOT NULL,
  `TenSP` varchar(30) NOT NULL,
  `SLTrongGio` int(11) NOT NULL,
  `GiaBan` double NOT NULL,
  `ThanhTien` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sanpham`
--

CREATE TABLE `sanpham` (
  `MaSP` int(11) NOT NULL,
  `TenSP` varchar(30) NOT NULL,
  `MoTa` varchar(255) NOT NULL,
  `GiaBan` double NOT NULL,
  `SLTrongKho` int(11) NOT NULL,
  `DanhMuc` varchar(255) NOT NULL,
  `NgayThemSP` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sanpham`
--

INSERT INTO `sanpham` (`MaSP`, `TenSP`, `MoTa`, `GiaBan`, `SLTrongKho`, `DanhMuc`, `NgayThemSP`) VALUES
(1, 'Áo sơ mi trắng', 'Áo sơ mi trắng tay dài, vải cotton cao cấp.', 350000, 25, 'Áo sơ mi', '2025-07-01'),
(2, 'Quần jeans xanh', 'Quần jeans co giãn, form slim fit.', 450000, 40, 'Quần jeans', '2025-07-01'),
(3, 'Áo thun nam basic', 'Áo thun cổ tròn, chất liệu thấm hút mồ hôi.', 199000, 60, 'Áo thun', '2025-07-01'),
(4, 'Áo khoác bomber', 'Áo khoác bomber thời trang, có khóa kéo.', 650000, 15, 'Áo khoác', '2025-07-01'),
(5, 'Quần short kaki', 'Quần short kaki trẻ trung, thích hợp đi chơi.', 280000, 30, 'Quần short', '2025-07-01');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userId` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `HoTen` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `SDT` varchar(30) NOT NULL,
  `DiaChi` varchar(255) NOT NULL,
  `role` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userId`, `username`, `password`, `HoTen`, `email`, `SDT`, `DiaChi`, `role`) VALUES
(1, 'nam123', '123456', 'Nguyễn Văn Nam', 'nam123@gmail.com', '0912345678', 'Hà Nội', 'admin'),
(2, 'linh456', 'linhpass', 'Trần Thị Linh', 'linh456@gmail.com', '0987654321', 'TP. HCM', 'user'),
(3, 'tuan789', 'tuan789', 'Lương Tuấn', 'tuan789@yahoo.com', '0909009900', 'Đà Nẵng', 'user'),
(4, 'hoa111', 'hoahoaha', 'Phạm Thị Hoa', 'hoa111@outlook.com', '0922334455', 'Huế', 'user'),
(5, 'khoa222', 'khoa222', 'Lê Văn Khoa', 'khoa222@gmail.com', '0933445566', 'Cần Thơ', 'staff');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
