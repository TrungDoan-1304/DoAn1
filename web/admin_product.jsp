<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, Model.Product, DAO.ProductDAO" %>
<%
    List<Product> list = (List<Product>) request.getAttribute("productList");
    if (list == null) {
        list = new ArrayList<>();
    }
%>
<%
    String msg = request.getParameter("msg");
    if ("success".equals(msg)) {
%>
    <div class="alert alert-success">Thêm sản phẩm thành công!</div>
<%
    }
%>
<!DOCTYPE html>
<html>
<head>
    
    <meta charset="UTF-8">
    <title>Quản lý Sản phẩm</title>
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
        img.thumb {
            width: 50px;
            height: 50px;
            object-fit: cover;
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
            <a href="AdminDashboardServlet"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
            <a href="AdminProductServlet"><i class="fas fa-tshirt"></i> Quản lý sản phẩm</a>
            <a href="AdminUserServlet"><i class="fas fa-users"></i> Quản lý người dùng</a>
            <a href="AdminOrderServlet"><i class="fas fa-receipt"></i> Quản lý đơn hàng</a>
            <a href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Đăng xuất</a>
        </div>

        <!-- Content -->
        <div class="col-md-10 p-4">
            <h3 class="mb-4"><i class="fas fa-tshirt"></i> Danh sách sản phẩm</h3>

            <div class="mb-3 text-end">
                <a href="AddProductServlet" class="btn btn-primary">
                    <i class="fas fa-plus"></i> Thêm sản phẩm
                </a>
            </div>

            <table class="table table-bordered table-hover text-center">
                <thead>
                <tr>
                    <th>Mã</th>
                    <th>Tên sản phẩm</th>
                    <th>Giá</th>
                    <th>Ảnh</th>
                    <th>Số lượng trong kho</th>
                    <th>Ngày thêm</th>
                    <th>Hành động</th>
                </tr>
                </thead>
                <tbody>
                <%
                    for (Product p : list) {
                %>
                <tr>
                    <td><%= p.getProductID() %></td>
                    <td><%= p.getProductName() %></td>
                    <td><%= String.format("%,d", p.getGia()) %>đ</td>
                    <td><img src="<%= p.getHinhanh() %>" class="thumb"></td>
                    <td><%= p.getSltrongkho() %></td>
                    <td><%= p.getNgaythem() %></td>
                    <td>
                        <a href="UpdateProductServlet?productID=<%= p.getProductID() %>" class="btn btn-sm btn-warning btn-action">
                            <i class="fas fa-edit"></i>
                        </a>
                        <a href="DeleteProductServlet?productID=<%= p.getProductID() %>" class="btn btn-sm btn-danger btn-action"
                           onclick="return confirm('Bạn có chắc chắn muốn xóa sản phẩm này?')">
                            <i class="fas fa-trash-alt"></i>
                        </a>
                    </td>
                </tr>
                <% } %>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>