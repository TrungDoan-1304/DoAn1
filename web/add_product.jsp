<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thêm sản phẩm</title>
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
        .form-container {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
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
            <a href="AdminUserServlet"><i class="fas fa-users"></i> Quản lý người dùng</a>
            <a href="AdminOrderServlet"><i class="fas fa-receipt"></i> Quản lý đơn hàng</a>
            <a href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Đăng xuất</a>
        </div>

        <!-- Content -->
        <div class="col-md-10 p-4">
            <h3 class="mb-4"><i class="fas fa-plus-circle"></i> Thêm sản phẩm mới</h3>

            <div class="form-container">
                <form action="${pageContext.request.contextPath}/AddProductServlet" method="post">
                    <div class="mb-3">
                        <label for="productName" class="form-label">Tên sản phẩm</label>
                        <input type="text" class="form-control" id="productName" name="productName" required>
                    </div>
                    <div class="mb-3">
                        <label for="gia" class="form-label">Giá (VNĐ)</label>
                        <input type="number" class="form-control" id="gia" name="gia" required>
                    </div>
                    <div class="mb-3">
                        <label for="sltrongkho" class="form-label">Số lượng trong kho</label>
                        <input type="number" class="form-control" id="sltrongkho" name="sltrongkho" required>
                    </div>
                    <div class="mb-3">
                        <label for="ngaythem" class="form-label">Ngày thêm</label>
                        <input type="date" class="form-control" id="ngaythem" name="ngaythem" required>
                    </div>
                    <div class="mb-3">
                        <label for="hinhanh" class="form-label">Đường dẫn ảnh (ví dụ: media/ao1.jpg)</label>
                        <input type="text" class="form-control" id="hinhanh" name="hinhanh" required>
                    </div>
                    <button type="submit" class="btn btn-primary"><i class="fas fa-save"></i> Lưu sản phẩm</button>
                    <a href="admin_product.jsp" class="btn btn-secondary"><i class="fas fa-arrow-left"></i> Quay lại</a>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>