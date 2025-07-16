<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Chỉnh Sửa Thông Tin</title>
    <style>
        body {
            margin: 0;
            font-family: "Segoe UI", sans-serif;
            background-color: #f0f2f5;
            color: #2c3e50;
        }

        .navbar {
            background-color: #006466;
            padding: 15px 30px;
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .navbar h1 {
            margin: 0;
            font-size: 22px;
        }

        .container {
            max-width: 700px;
            margin: 50px auto;
            background-color: white;
            padding: 35px;
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #006466;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            font-weight: 600;
            margin-bottom: 6px;
        }

        input[type="text"],
        input[type="email"],
        input[type="tel"],
        input[type="password"] {
            width: 100%;
            padding: 10px 12px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 15px;
        }

        .form-section {
            margin-top: 30px;
            border-top: 1px solid #ddd;
            padding-top: 20px;
        }

        .form-section h3 {
            color: #006466;
            margin-bottom: 15px;
        }

        .btn-group {
            display: flex;
            justify-content: space-between;
            gap: 20px;
            margin-top: 30px;
        }

        .submit-btn, .back-btn {
            flex: 1;
            padding: 12px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .submit-btn {
            background-color: #00b894;
            color: white;
        }

        .submit-btn:hover {
            background-color: #27ae60;
        }

        .back-btn {
            background-color: #b2bec3;
            color: #2d3436;
        }

        .back-btn:hover {
            background-color: #636e72;
            color: white;
        }
    </style>
</head>
<body>

<div class="navbar">
    <h1>🛍 Shop Quần Áo Nam</h1>
</div>

<div class="container">
    <h2>Chỉnh Sửa Thông Tin Cá Nhân</h2>
    <form action="UpdateProfileServlet" method="post">
        <!-- Thông tin cá nhân -->
        <div class="form-group">
            <label for="username">Tên đăng nhập</label>
            <input type="text" id="username" name="username" value="cubin2k4" disabled>
        </div>

        <div class="form-group">
            <label for="name">Họ tên</label>
            <input type="text" id="name" name="name" value="Hoàng Văn Tuyên">
        </div>

        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" id="email" name="email" value="abc@gmail.com">
        </div>

        <div class="form-group">
            <label for="phone">Số điện thoại</label>
            <input type="tel" id="phone" name="phone" value="0987654321">
        </div>

        <!-- Đổi mật khẩu -->
        <div class="form-section">
            <h3>Đổi Mật Khẩu</h3>

            <div class="form-group">
                <label for="oldPassword">Mật khẩu hiện tại</label>
                <input type="password" id="oldPassword" name="oldPassword">
            </div>

            <div class="form-group">
                <label for="newPassword">Mật khẩu mới</label>
                <input type="password" id="newPassword" name="newPassword">
            </div>

            <div class="form-group">
                <label for="confirmPassword">Xác nhận mật khẩu mới</label>
                <input type="password" id="confirmPassword" name="confirmPassword">
            </div>
        </div>

        <div class="btn-group">
            <button type="submit" class="submit-btn">💾 Lưu Thay Đổi</button>
            <button type="button" class="back-btn" onclick="window.location.href='user_profile.jsp'">🔙 Quay về Hồ sơ</button>
        </div>
    </form>
</div>

</body>
</html>
