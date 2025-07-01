<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="navbar.jsp" %>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Trang Người Dùng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            margin: 0;
            padding: 0;
            background: url('media/anh1.jpg') no-repeat center center fixed;
            background-size: cover;
            font-family: 'Segoe UI', sans-serif;
            color: white;
        }
        .overlay {
            background-color: rgba(0, 0, 0, 0.65);
            min-height: 100vh;
            padding: 60px 20px;
        }
        .card {
            background-color: rgba(0, 0, 0, 0.7);
            color: #fff;
            transition: 0.3s;
        }
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 0 15px rgba(0,255,100,0.6);
        }
        .welcome {
            text-align: center;
            font-size: 28px;
            font-weight: bold;
            margin-bottom: 30px;
            text-shadow: 0 0 10px #00ffcc;
        }
    </style>
</head>
<body>
    <div class="overlay">
        <div class="container">
            <div class="welcome">👋 Xin chào <%= username %>! Chào mừng bạn trở lại!</div>
            <div class="row justify-content-center g-4">
                <div class="col-md-3">
                    <div class="card text-center p-3">
                        <h5>🛒 Xem Sản Phẩm</h5>
                        <p>Khám phá bộ sưu tập thời trang nam hot nhất.</p>
                        <a href="list.jsp" class="btn btn-outline-light">Xem ngay</a>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card text-center p-3">
                        <h5>📦 Đơn Hàng</h5>
                        <p>Kiểm tra trạng thái và lịch sử đơn hàng của bạn.</p>
                        <a href="orders.jsp" class="btn btn-outline-light">Xem đơn hàng</a>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card text-center p-3">
                        <h5>👤 Thông Tin Cá Nhân</h5>
                        <p>Cập nhật hồ sơ người dùng của bạn dễ dàng.</p>
                        <a href="profile.jsp" class="btn btn-outline-light">Cập nhật</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="footer.jsp" %>
</body>
</html>
