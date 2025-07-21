<%-- 
    Document   : success
    Created on : Jul 16, 2025, 9:54:52 PM
    Author     : PC
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>🎉 Đặt hàng thành công</title>
    <style>
        body {
            margin: 0;
            font-family: "Segoe UI", sans-serif;
            background: url('media/anh1.jpg') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        .container {
            background: rgba(255, 255, 255, 0.95);
            max-width: 600px;
            margin: auto;
            margin-top: 80px;
            padding: 40px 30px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.15);
            text-align: center;
        }

        h2 {
            color: #00b894;
            font-size: 28px;
            margin-bottom: 10px;
        }

        p {
            font-size: 16px;
            color: #333;
            margin-bottom: 20px;
        }

        .icon {
            font-size: 50px;
            color: #00b894;
            margin-bottom: 15px;
        }

        .btn {
            display: inline-block;
            margin: 10px;
            padding: 12px 24px;
            background-color: #00cec9;
            color: white;
            text-decoration: none;
            font-weight: bold;
            border-radius: 8px;
            transition: background-color 0.3s;
        }

        .btn:hover {
            background-color: #00b894;
        }

        footer {
            margin-top: auto;
            background-color: rgba(0,0,0,0.8);
            color: white;
            padding: 15px;
            text-align: center;
            font-size: 14px;
        }

        footer a {
            color: #00cec9;
            text-decoration: none;
        }

        footer a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="icon">✅</div>
    <h2>Đặt hàng thành công!</h2>
    <p>Cảm ơn bạn đã tin tưởng và mua sắm tại <strong>Shop Quần Áo Nam</strong>.</p>
    <p>Chúng tôi sẽ liên hệ xác nhận đơn hàng trong thời gian sớm nhất.</p>
    <a href="OrderServlet" class="btn"> Xem đơn hàng của bạn</a>
    <a href="ProductListServlet" class="btn">🏠 Tiếp tục mua sắm</a>
</div>

<footer style= "background-color: rgba(0,0,0,0.8); backdrop-filter: blur(5px);color:white; padding:20px; text-align:center;">
            <p>&copy; 2025 Shop Quần Áo Nam. All rights reserved.</p>
            <p>📍 218 Lĩnh Nam, Hoàng Mai, Hà Nội | ☎ 0987 123 456</p>
            <p>
                ✉ <a href="mailto:shopquannaonam@gmail.com" style="color:#00cec9;">Email</a> |
                🌐 <a href="https://facebook.com/tuyens.hoangs.33" style="color:#00cec9;" target="_blank">Facebook</a>
            </p>
</footer>

</body>
</html>