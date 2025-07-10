<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Tài Khoản Của Tôi</title>
    <style>
        body {
            margin: 0;
    font-family: "Segoe UI", sans-serif;
    background-color: #f5f6fa;
    color: #2f3640;
        }

        .navbar {
            background-color: #333333;
            padding: 15px 30px;
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        .navbar h1 {
            color: #00cccc;
            margin: 0;
            font-size: 20px;
        }

        .navbar .user-menu {
            position: relative;
            cursor: pointer;
        }

        .navbar .user-menu img {
            width: 36px;
            height: 36px;
            border-radius: 50%;
            vertical-align: middle;
        }

        .navbar .user-menu span {
            margin-left: 8px;
            font-weight: 500;
        }

        .dropdown {
            display: none;
            position: absolute;
            top: 48px;
            right: 0;
            background-color: white;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            border-radius: 6px;
            overflow: hidden;
            z-index: 1000;
        }

        .dropdown a {
            display: block;
            padding: 10px 20px;
            text-decoration: none;
            color: #333;
            font-weight: 500;
        }

        .dropdown a:hover {
            background-color: #f0f0f0;
        }

        .container {
            display: flex;
            margin: 20px;
        }

        .sidebar {
            width: 220px;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            display: flex;
            flex-direction: column;
            position: sticky;
            top: 80px;
            height: fit-content;
            box-shadow: 0 2px 6px rgba(0,0,0,0.05);
        }

        .sidebar a {
            padding: 12px 10px;
            color: #333;
            text-decoration: none;
            font-weight: 500;
            border-bottom: 1px solid #eee;
            cursor: pointer;
        }

        .sidebar a:hover {
            color: #ee4d2d;
        }

        .profile-form {
            flex: 1;
            background-color: white;
            margin-left: 20px;
            padding: 30px;
            border-radius: 8px;
            font-weight: 400;
            box-shadow: 0 2px 6px rgba(0,0,0,0.05);
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            font-weight: 500;
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="email"],
        input[type="date"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-family: 'Roboto', sans-serif;
        }

        .radio-group {
            display: flex;
            gap: 20px;
            align-items: center;
        }

        .submit-btn {
            background-color: #00cccc;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            font-weight: 500;
        }

        .submit-btn:hover {
            background-color: #d94424;
        }
    </style>
</head>
<body>

<div class="navbar">
    <h1>Shop Quần Áo Nam</h1>
    <div class="user-menu" onclick="toggleDropdown()">
        <img src="https://i.imgur.com/8Km9tLL.png" alt="Avatar">
        <span>cubin2k4</span>
        <div class="dropdown" id="dropdownMenu">
            <a onclick="showTab('profile')">Tài Khoản Của Tôi</a>
            <a onclick="showTab('orders')">Đơn Mua</a>
            <a href="#">Đăng Xuất</a>
        </div>
    </div>
</div>

<div class="container">
    <div class="sidebar">
        <a onclick="showTab('notifications')">Thông báo</a>
        <a onclick="showTab('orders')">Đơn hàng</a>
        <a onclick="showTab('cart')">Giỏ hàng</a>
        <a onclick="showTab('profile')">Tài khoản</a>
        <a href="#">Đăng xuất</a>
    </div>

    <div class="profile-form" id="profile">
        <h2>Hồ Sơ Của Tôi</h2>
        <div class="form-group">
            <label for="username">Tên đăng nhập</label>
            <input type="text" id="username" value="cubin2k4" disabled>
        </div>
        <div class="form-group">
            <label for="name">Tên</label>
            <input type="text" id="name" value="Hoàng">
        </div>
        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" id="email" value="hu********@gmail.com">
        </div>
        <div class="form-group">
            <label for="phone">Số điện thoại</label>
            <input type="text" id="phone" value="*******42">
        </div>
        <div class="form-group">
            <label>Giới tính</label>
            <div class="radio-group">
                <label><input type="radio" name="gender" checked> Nam</label>
                <label><input type="radio" name="gender"> Nữ</label>
                <label><input type="radio" name="gender"> Khác</label>
            </div>
        </div>
        <div class="form-group">
            <label for="dob">Ngày sinh</label>
            <input type="date" id="dob" value="2004-01-01">
        </div>
        <button class="submit-btn">Lưu</button>
    </div>

    <div class="profile-form" id="orders" style="display: none">
        <h2>Đơn hàng của tôi</h2>
        <p>Danh sách đơn hàng...</p>
    </div>

    <div class="profile-form" id="cart" style="display: none">
        <h2>Giỏ hàng</h2>
        <p>Danh sách sản phẩm trong giỏ...</p>
    </div>

    <div class="profile-form" id="notifications" style="display: none">
        <h2>Thông báo</h2>
        <p>Danh sách thông báo...</p>
    </div>
</div>

<script>
    function toggleDropdown() {
        const dropdown = document.getElementById('dropdownMenu');
        dropdown.style.display = dropdown.style.display === 'block' ? 'none' : 'block';
    }

    document.addEventListener('click', function(event) {
        const userMenu = document.querySelector('.user-menu');
        const dropdown = document.getElementById('dropdownMenu');
        if (!userMenu.contains(event.target)) {
            dropdown.style.display = 'none';
        }
    });

    function showTab(tabId) {
        const tabs = ['profile', 'orders', 'cart', 'notifications'];
        tabs.forEach(id => {
            document.getElementById(id).style.display = (id === tabId) ? 'block' : 'none';
        });
    }
</script>

</body>
</html>
