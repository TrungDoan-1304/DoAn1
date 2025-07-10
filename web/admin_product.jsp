<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý Sản phẩm - Admin</title>
    <style>
       
        body {
            background: url('media/anh1.jpg') no-repeat center center fixed;
                background-size: cover;
                margin: 0;
                font-family: "Segoe UI", sans-serif;
                background-color: #f5f6fa;
                color: #2f3640;
        }

        .admin-wrapper {
            display: flex;
            min-height: 100vh;
        }

        .sidebar {
            width: 220px;
            background: linear-gradient(to bottom right, #2f3640, #353b48);
            padding: 20px;
            color: white;
        }

        .sidebar h2 {
            font-size: 22px;
            margin-bottom: 30px;
        }

        .sidebar a {
            display: block;
            color: white;
            text-decoration: none;
            margin: 15px 0;
            font-size: 16px;
            transition: 0.3s;
        }

        .sidebar a:hover {
            color: #00cec9;
            padding-left: 10px;
        }

        .main-content {
            flex-grow: 1;
            padding: 40px;
            background-color: #f1f2f6;
        }

        h1 {
            margin-bottom: 30px;
            font-size: 28px;
            color: #2f3640;
        }

        .product-table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 12px rgba(0,0,0,0.05);
        }

        .product-table thead {
            background-color: #00b894;
            color: white;
        }

        .product-table th, .product-table td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .product-table tr:hover {
            background-color: #f2f2f2;
        }

        .btn {
            padding: 6px 12px;
            font-size: 14px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .btn-edit {
            background-color: #0984e3;
            color: white;
        }

        .btn-delete {
            background-color: #d63031;
            color: white;
        }

        .btn-add {
            background-color: #00b894;
            color: white;
            padding: 10px 18px;
            font-size: 15px;
            margin-bottom: 20px;
            border-radius: 6px;
            transition: background-color 0.3s;
        }

        .btn-add:hover {
            background-color: #019874;
        }
    </style>
</head>
<body>
<div class="admin-wrapper">
    <div class="sidebar">
        <h2>Admin Panel</h2>
        <a href="#">Dashboard</a>
        <a href="#">Người dùng</a>
        <a href="#">Sản phẩm</a>
        <a href="#">Đơn hàng</a>
        <a href="#">Đăng xuất</a>
    </div>

    <div class="main-content">
        <h1>Qu?n lý S?n ph?m</h1>
        <button class="btn btn-add">+ Thêm s?n ph?m</button>
        <table class="product-table">
            <thead>
            <tr>
                <th>ID</th>
                <th>Hình ?nh</th>
                <th>Tên s?n ph?m</th>
                <th>Lo?i</th>
                <th>Giá</th>
                <th>Thao tác</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>1</td>
                <td><img src="img/product1.jpg" alt="sp1" width="60"></td>
                <td>Áo thun ?en</td>
                <td>Áo</td>
                <td>250.000?</td>
                <td>
                    <button class="btn btn-edit">S?a</button>
                    <button class="btn btn-delete">Xóa</button>
                </td>
            </tr>
            <tr>
                <td>2</td>
                <td><img src="img/product2.jpg" alt="sp2" width="60"></td>
                <td>Qu?n kaki</td>
                <td>Qu?n</td>
                <td>450.000?</td>
                <td>
                    <button class="btn btn-edit">S?a</button>
                    <button class="btn btn-delete">Xóa</button>
                </td>
            </tr>
            <!-- Thêm dòng s?n ph?m khác n?u c?n -->
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
