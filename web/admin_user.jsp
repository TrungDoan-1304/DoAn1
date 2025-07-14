<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quản lý người dùng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fc;
            font-family: 'Segoe UI', sans-serif;
        }

        .sidebar {
            background: linear-gradient(180deg, #4e73df 10%, #224abe 100%);
            min-height: 100vh;
            color: white;
        }

        .sidebar a {
            color: white;
            text-decoration: none;
            padding: 12px;
            display: block;
        }

        .sidebar a:hover {
            background-color: rgba(255,255,255,0.1);
            border-left: 4px solid #fff;
        }

        .table th {
            background-color: #f1f3f9;
        }

        .btn-action {
            margin-right: 5px;
        }

        .top-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
    <div class="container-fluid">
        <a class="navbar-brand text-primary fw-bold" href="#">🛍️ Shop Quần Áo Nam</a>
        <div class="d-flex">
            <span class="me-3 mt-2 fw-semibold">Xin chào, Admin</span>
            <a href="logout.jsp" class="btn btn-outline-danger">Đăng xuất</a>
        </div>
    </div>
</nav>

<!-- Layout -->
<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <div class="col-md-2 sidebar">
            <h4 class="mt-4 ms-3"><i class="fas fa-user-shield"></i> Admin</h4>
            <a href="admin.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
            <a href="admin_product.jsp"><i class="fas fa-tshirt"></i> Quản lý sản phẩm</a>
            <a href="admin-user.jsp"><i class="fas fa-users"></i> Quản lý người dùng</a>
            <a href="admin-order.jsp"><i class="fas fa-receipt"></i> Quản lý đơn hàng</a>
            <a href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Đăng xuất</a>
        </div>

        <!-- Content -->
        <div class="col-md-10 p-4">
            <div class="top-bar">
                <h3><i class="fas fa-users"></i> Danh sách người dùng</h3>
                <a href="add_user.jsp" class="btn btn-primary"><i class="fas fa-user-plus"></i> Thêm người dùng</a>
            </div>

            <table class="table table-bordered table-hover text-center">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Tên đăng nhập</th>
                        <th>Email</th>
                        <th>Vai trò</th>
                        <th>Trạng thái</th>
                        <th>Hành động</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>U001</td>
                        <td>cubin2k4</td>
                        <td>cubin2k4@gmail.com</td>
                        <td>Khách hàng</td>
                        <td>Hoạt động</td>
                        <td>
                            <a href="edit_user.jsp?id=U001" class="btn btn-sm btn-warning btn-action"><i class="fas fa-edit"></i></a>
                            <a href="ban_user.jsp?id=U001" class="btn btn-sm btn-danger btn-action" onclick="return confirm('Bạn có chắc muốn chặn người dùng này?')"><i class="fas fa-ban"></i></a>
                        </td>
                    </tr>
                    <!-- Lặp thêm user nếu có -->
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
