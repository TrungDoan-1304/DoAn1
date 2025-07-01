<%-- 
    Document   : forgot
    Created on : 27 thg 6, 2025, 23:54:36
    Author     : Admin
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quên Mật Khẩu</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: url('media/anh1.jpg') no-repeat center center fixed;
            background-size: cover;
            font-family: 'Segoe UI', sans-serif;
        }
        .forgot-box {
            background: rgba(0, 0, 0, 0.85);
            padding: 40px;
            border-radius: 16px;
            max-width: 450px;
            margin: 120px auto;
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
        .btn-forgot {
            background-color: #ffc107;
            border: none;
            font-weight: bold;
            color: black;
        }
        .btn-forgot:hover {
            background-color: #e0a800;
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
<div class="forgot-box text-center">
    <h2 class="fw-bold mb-4">KHÔI PHỤC MẬT KHẨU</h2>
    <p class="mb-3">Nhập địa chỉ email bạn đã đăng ký. Chúng tôi sẽ gửi hướng dẫn đặt lại mật khẩu.</p>
    
    <form action="ForgotPasswordServlet" method="post">
        <div class="mb-3">
            <input type="email" class="form-control" name="email" placeholder="Email của bạn" required>
        </div>
        <button type="submit" class="btn btn-forgot w-100">GỬI YÊU CẦU</button>
    </form>

    <div class="mt-3 back-login">
        <a href="login.jsp">← Quay lại đăng nhập</a>
    </div>
</div>
 <%@ include file="footer.jsp" %>
</body>
</html>

