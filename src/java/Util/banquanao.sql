-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 21, 2025 lúc 02:41 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `banquanao`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cartdetails`
--

CREATE TABLE `cartdetails` (
  `cartID` int(11) NOT NULL,
  `MaGioHang` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  `size` varchar(10) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `carts`
--

CREATE TABLE `carts` (
  `MaGioHang` varchar(30) NOT NULL,
  `username` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `carts`
--

INSERT INTO `carts` (`MaGioHang`, `username`) VALUES
('GH1753067834718', 'tuan789');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart_items`
--

CREATE TABLE `cart_items` (
  `MaGioHang` varchar(30) NOT NULL,
  `productID` int(11) NOT NULL,
  `tensanpham` varchar(30) NOT NULL,
  `size` varchar(5) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price` double NOT NULL,
  `username` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danhmucsp`
--

CREATE TABLE `danhmucsp` (
  `MaDanhMuc` int(11) NOT NULL,
  `DanhMuc` varchar(30) NOT NULL,
  `MoTa` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `danhmucsp`
--

INSERT INTO `danhmucsp` (`MaDanhMuc`, `DanhMuc`, `MoTa`) VALUES
(1, 'Áo sơ mi', 'Các loại áo sơ mi nam công sở, dự tiệc, casual.'),
(2, 'Áo thun', 'Áo thun nam phong cách trẻ trung, năng động.'),
(3, 'Quần jeans', 'Các mẫu quần jeans nam, nhiều form dáng.'),
(4, 'Áo khoác', 'Áo khoác thời trang, chống nắng, giữ ấm.'),
(5, 'Quần short', 'Quần short kaki, jeans, thể thao cho nam.');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `orderID` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `HoTen` varchar(30) NOT NULL,
  `SDT` int(11) NOT NULL,
  `DiaChi` varchar(100) NOT NULL,
  `paymentMethod` enum('COD','BANK','MOMO') NOT NULL,
  `note` varchar(250) NOT NULL,
  `NgayDatHang` date NOT NULL,
  `totalAmount` double NOT NULL,
  `status` enum('Chưa thanh toán','Đang giao','Đã giao thành công') DEFAULT 'Chưa thanh toán'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_details`
--

CREATE TABLE `order_details` (
  `detailId` int(11) NOT NULL,
  `orderID` int(11) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `productID` int(11) NOT NULL,
  `size` varchar(11) NOT NULL,
  `tensanpham` varchar(30) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `productID` int(11) NOT NULL,
  `tensanpham` varchar(30) NOT NULL,
  `hinhanh` varchar(30) NOT NULL,
  `gia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`productID`, `tensanpham`, `hinhanh`, `gia`) VALUES
(1, 'Áo sơ mi trắng', 'media/somi1.jpg', 320000),
(2, 'Áo thun đen basic', 'media/ao1.webp', 220000),
(3, 'Quần Đùi nam', 'media/quandui1.jpg', 160000),
(4, 'Áo Hoodie', 'media/aohoodie.jpeg', 300000),
(5, 'Quần Jean đen', 'media/quanbo1.jpg', 450000),
(6, 'Nón lưỡi trai', 'media/mu1.jpeg', 120000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham`
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
-- Đang đổ dữ liệu cho bảng `sanpham`
--

INSERT INTO `sanpham` (`MaSP`, `TenSP`, `MoTa`, `GiaBan`, `SLTrongKho`, `DanhMuc`, `NgayThemSP`) VALUES
(1, 'Áo sơ mi trắng', 'Áo sơ mi trắng tay dài, vải cotton cao cấp.', 350000, 25, 'Áo sơ mi', '2025-07-01'),
(2, 'Quần jeans xanh', 'Quần jeans co giãn, form slim fit.', 450000, 40, 'Quần jeans', '2025-07-01'),
(3, 'Áo thun nam basic', 'Áo thun cổ tròn, chất liệu thấm hút mồ hôi.', 199000, 60, 'Áo thun', '2025-07-01'),
(4, 'Áo khoác bomber', 'Áo khoác bomber thời trang, có khóa kéo.', 650000, 15, 'Áo khoác', '2025-07-01'),
(5, 'Quần short kaki', 'Quần short kaki trẻ trung, thích hợp đi chơi.', 280000, 30, 'Quần short', '2025-07-01');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `userId` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `HoTen` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `SDT` varchar(30) DEFAULT NULL,
  `DiaChi` varchar(255) DEFAULT NULL,
  `role` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`userId`, `username`, `password`, `HoTen`, `email`, `SDT`, `DiaChi`, `role`) VALUES
(1, 'trungdoan', '123456', 'Đoàn Quốc Trung', 'trunglay2k4@gmail.com', '0393664604', 'Hà Nội', 'admin'),
(2, 'linh456', '123456', 'Trần Thị Linh', 'linh456667@gmail.com', '0933229929', 'Đà nẵng', 'user'),
(3, 'tuan789', 'tuan789', 'Lương Tuấn', 'tuan567@yahoo.com', '0933445566', 'Hà nội', 'user'),
(4, 'hoa111', 'hoahoaha', 'Phạm Thị Hoa', 'hoa111@outlook.com', '0922334455', 'Huế', 'user'),
(5, 'khoa222', 'khoa222', 'Lê Văn Khoa', 'khoa222@gmail.com', '0933445566', 'Cần Thơ', 'user'),
(6, 'trung', '123456', 'Đoàn Quốc Trung', 'trung@gmail.com', '0987654321', 'Hà Nội', 'user'),
(7, 'linhtran', '123456', 'tran linh', 'tranlinh@gmail.com', '0993434575', 'Hà nội', 'user');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `cartdetails`
--
ALTER TABLE `cartdetails`
  ADD PRIMARY KEY (`cartID`);

--
-- Chỉ mục cho bảng `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`MaGioHang`);

--
-- Chỉ mục cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`detailId`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`productID`);

--
-- Chỉ mục cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`MaSP`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userId`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `cartdetails`
--
ALTER TABLE `cartdetails`
  MODIFY `cartID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `order_details`
--
ALTER TABLE `order_details`
  MODIFY `detailId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `productID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
