<%-- 
    Document   : register
    Created on : 27 thg 6, 2025, 23:48:46
    Author     : Admin
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đăng Ký Tài Khoản</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: url('media/anh1.jpg') no-repeat center center fixed;
            background-size: cover;
            font-family: 'Segoe UI', sans-serif;
        }
        .register-box {
            background: rgba(0, 0, 0, 0.85);
            padding: 40px;
            border-radius: 16px;
            max-width: 450px;
            margin: 100px auto;
            color: white;
        }
        .form-control {
            background-color: #2a2a2a;
            border: none;
            color: white;
        }
        .form-control::placeholder {
            color: #ccc;
        }
        .btn-register {
            background-color: #28a745;
            border: none;
            font-weight: bold;
        }
        .btn-register:hover {
            background-color: #218838;
        }
        .back-login a {
            color: #ddd;
            text-decoration: none;
        }
        .back-login a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<%@ include file="navbar.jsp" %>
<div class="register-box text-center">
    <h2 class="fw-bold mb-4">ĐĂNG KÝ TÀI KHOẢN</h2>
    <form action="RegisterServlet" method="post">
        <div class="mb-3">
            <input type="text" class="form-control" name="fullname" placeholder="Họ và tên" required>
        </div>
        <div class="mb-3">
            <input type="text" class="form-control" name="username" placeholder="Tên đăng nhập" required>
        </div>
        <div class="mb-3">
            <input type="email" class="form-control" name="email" placeholder="Email" required>
        </div>
        <div class="mb-3">
            <input type="password" class="form-control" name="password" placeholder="Mật khẩu" required>
        </div>
        <div class="mb-3">
            <input type="password" class="form-control" name="confirm" placeholder="Xác nhận mật khẩu" required>
        </div>
        <button type="submit" class="btn btn-register w-100">TẠO TÀI KHOẢN</button>
    </form>

    <div class="mt-3 back-login">
        <a href="login.jsp">← Quay lại đăng nhập</a>
    </div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>

