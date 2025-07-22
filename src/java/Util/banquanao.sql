-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 22, 2025 lúc 07:30 PM
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
-- Cấu trúc bảng cho bảng `carts`
--

CREATE TABLE `carts` (
  `cartID` varchar(30) NOT NULL,
  `username` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `carts`
--

INSERT INTO `carts` (`cartID`, `username`) VALUES
('GH184265', 'trung'),
('GH242069', 'tuan789'),
('GH725254', 'linh456');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart_items`
--

CREATE TABLE `cart_items` (
  `cartID` varchar(30) NOT NULL,
  `productID` int(11) NOT NULL,
  `productName` varchar(30) NOT NULL,
  `size` varchar(5) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price` double NOT NULL,
  `username` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `cart_items`
--

INSERT INTO `cart_items` (`cartID`, `productID`, `productName`, `size`, `quantity`, `price`, `username`) VALUES
('GH725254', 1, 'Áo sơ mi trắng', 'S', 1, 320000, 'linh456');

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
  `orderID` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `HoTen` varchar(30) NOT NULL,
  `SDT` int(11) NOT NULL,
  `DiaChi` varchar(100) NOT NULL,
  `paymentMethod` enum('COD','BANK','MOMO') NOT NULL,
  `note` varchar(250) NOT NULL,
  `NgayDatHang` date NOT NULL,
  `totalAmount` double NOT NULL,
  `status` enum('Chưa thanh toán','Đang giao hàng','Đã giao thành công') DEFAULT 'Chưa thanh toán'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`orderID`, `username`, `HoTen`, `SDT`, `DiaChi`, `paymentMethod`, `note`, `NgayDatHang`, `totalAmount`, `status`) VALUES
(3, 'tuan789', 'Lương Tuấn', 933445566, 'Hà nội', 'BANK', '', '2025-07-22', 440000, 'Đang giao hàng'),
(4, 'tuan789', 'Lương Tuấn', 933445566, 'Hà nội', 'COD', '', '2025-07-22', 120000, 'Đã giao thành công'),
(5, 'linh456', 'Trần Thị Linh', 933229929, 'Đà nẵng', 'MOMO', '', '2025-07-22', 300000, 'Đang giao hàng'),
(6, 'trung', 'Đoàn Quốc Trung', 987654321, 'Hà Nội', 'COD', '', '2025-07-22', 320000, 'Chưa thanh toán'),
(7, 'trung', 'Đoàn Quốc Trung', 987654321, 'Hà Nội', 'BANK', '', '2025-07-22', 300000, 'Đang giao hàng'),
(8, 'trung', 'Đoàn Quốc Trung', 987654321, 'Hà Nội', 'MOMO', '', '2025-07-22', 320000, 'Đang giao hàng');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_details`
--

CREATE TABLE `order_details` (
  `detailId` int(11) NOT NULL,
  `orderID` int(11) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `productID` int(11) NOT NULL,
  `productName` varchar(30) NOT NULL,
  `size` varchar(30) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double NOT NULL,
  `totalAmount` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `order_details`
--

INSERT INTO `order_details` (`detailId`, `orderID`, `username`, `productID`, `productName`, `size`, `quantity`, `price`, `totalAmount`) VALUES
(5, 3, 'tuan789', 1, 'Áo sơ mi trắng', 'S', 1, 320000, 320000),
(6, 3, 'tuan789', 6, 'Nón lưỡi trai', 'S', 1, 120000, 120000),
(7, 4, 'tuan789', 6, 'Nón lưỡi trai', 'S', 1, 120000, 120000),
(8, 5, 'linh456', 4, 'Áo Hoodie', 'S', 1, 300000, 300000),
(9, 6, 'trung', 1, 'Áo sơ mi trắng', 'S', 1, 320000, 320000),
(10, 7, 'trung', 4, 'Áo Hoodie', 'S', 1, 300000, 300000),
(11, 8, 'trung', 1, 'Áo sơ mi trắng', 'S', 1, 320000, 320000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `productID` int(11) NOT NULL,
  `productName` varchar(30) NOT NULL,
  `hinhanh` varchar(30) NOT NULL,
  `gia` int(11) NOT NULL,
  `sltrongkho` int(11) NOT NULL,
  `ngaythem` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`productID`, `productName`, `hinhanh`, `gia`, `sltrongkho`, `ngaythem`) VALUES
(1, 'Áo sơ mi trắng', 'media/somi1.jpg', 320000, 1500, '2025-07-01'),
(2, 'Áo thun đen basic', 'media/ao1.webp', 220000, 1000, '2025-07-01'),
(3, 'Quần Đùi nam', 'media/quandui1.jpg', 160000, 1000, '2025-07-01'),
(4, 'Áo Hoodie', 'media/aohoodie.jpeg', 300000, 1000, '2025-07-01'),
(5, 'Quần Jean đen', 'media/quanbo1.jpg', 450000, 1000, '2025-07-01'),
(6, 'Nón lưỡi trai', 'media/mu1.jpeg', 120000, 1000, '2025-07-01');

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
(2, 'linh456', '123456', 'Trần Hà Linh', 'linh456667@gmail.com', '0933229929', 'Đà nẵng', 'user'),
(4, 'hoa111', 'hoahoaha', 'Phạm Thị Hoa', 'hoa111@outlook.com', '0922334455', 'Huế', 'user'),
(5, 'khoa222', 'khoa222', 'Lê Văn Khoa', 'khoa222@gmail.com', '0933445566', 'Cần Thơ', 'user'),
(6, 'trung', 'trung123', 'Đoàn Quốc Trung', 'trung@gmail.com', '0998998898', 'Hà Nội', 'user'),
(7, 'linhtran', '123456', 'tran linh', 'tranlinh@gmail.com', '0993434575', 'Hà nội', 'user'),
(8, 'nam123', '123456', 'Hoàng Nam', 'Nam1121@gmail.com', '0988877887', 'Bắc Ninh', 'user');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`cartID`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderID`);

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
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userId`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `orderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `order_details`
--
ALTER TABLE `order_details`
  MODIFY `detailId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `productID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
