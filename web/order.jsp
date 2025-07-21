<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="Model.Order" %>

<%
    List<Order> orders = (List<Order>) request.getAttribute("orders");
    String username = (String) session.getAttribute("username");
%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đơn Mua</title>
    <link rel="stylesheet" href="style/user.css" />
    <style>
        body {
            margin: 0;
            font-family: "Segoe UI", sans-serif;
            background: url('media/anh1.jpg') no-repeat center center fixed;
            background-size: cover;
            color: #2f3640;
        }

        .container {
            max-width: 900px;
            margin: 40px auto;
            padding: 30px;
            background-color: white;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
        }

        h2 {
            color: #006466;
            margin-bottom: 25px;
        }

        .navbar {
            background-color: #006466;
            color: white;
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .navbar .logo {
            font-size: 20px;
            font-weight: bold;
        }

        .nav-links a {
            margin-left: 20px;
            color: white;
            text-decoration: none;
        }

        .order {
            border: 1px solid #ddd;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 20px;
            background-color: #fafafa;
        }

        .order-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 10px;
            font-weight: bold;
        }

        .order-body {
            display: flex;
            flex-direction: column;
            gap: 10px;
            padding-left: 10px;
        }

        .order-item {
            display: flex;
            justify-content: space-between;
            font-size: 14px;
        }

        .order-total {
            text-align: right;
            font-size: 15px;
            font-weight: bold;
            margin-top: 10px;
        }

        .order-actions {
            display: flex;
            justify-content: flex-end;
            margin-top: 10px;
            gap: 10px;
        }

        .btn {
            padding: 8px 14px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 14px;
        }

        .btn-view {
            background-color: #00b894;
            color: white;
        }

        .btn-cancel {
            background-color: #d63031;
            color: white;
        }

        .status {
            padding: 4px 10px;
            background-color: #ffeaa7;
            color: #e17055;
            border-radius: 6px;
            font-size: 13px;
        }
    </style>
</head>

<!-- Thân trang sử dụng flexbox để đẩy footer xuống dưới -->
<body style="display: flex; flex-direction: column; min-height: 100vh;">

<!-- Navbar -->
<div class="navbar">
    <div class="logo">Shop Quần Áo Nam</div>

    <div class="nav-links"> 
        <a href="ProductListServlet">Sản phẩm</a>
        <a href="cart.jsp">Giỏ hàng</a>
        <a href="order.jsp">Đơn Hàng</a>
        <a href="ProfileServlet">Tài Khoản</a>
    </div>

    <div class="search-cart">
        <div class="search-box">
            <input type="text" placeholder="Tìm sản phẩm...">
            <button>&#128269;</button>
        </div>
        <div class="cart-icon">&#128722;</div>
    </div>

    <% if (username != null) { %>
        <div class="user-menu" onclick="toggleDropdown()">
            <span style="margin-left: 8px; font-weight: 500; color: white">Xin chào <%= username %></span>
            <div class="dropdown" id="dropdownMenu">
                <a href="ProfileServlet">Tài Khoản Của Tôi</a>
                <a href="order.jsp">Đơn Mua</a>
                <a href="logout.jsp">Đăng Xuất</a>
            </div>
        </div>
    <% } else { %>
        <a href="login.jsp" class="login-link" style="color: white; font-weight: 500;">Đăng nhập</a>
    <% } %>
</div>

<!-- Nội dung chính -->
<div style="flex: 1;">
    <div class="container">
        <h2>🧾 Danh sách đơn hàng</h2>
        <table border="1" width="100%">
            <thead>
                <tr>
                    <th>Mã đơn</th>
                    <th>Ngày đặt</th>
                    <th>Phương thức thanh toán</th>
                    <th>Tổng tiền</th>
                    <th>Trạng thái</th>
                </tr>
            </thead>
            <tbody>
                <% if (orders != null && !orders.isEmpty()) {
                       for (Order order : orders) { %>
                    <tr>
                        <td><%= order.getOrderID() %></td>
                        <td><%= order.getNgayDatHang() %></td>
                        <td><%= order.getPaymentMethod() %></td>
                        <td><%= String.format("%,.0f", order.getTotalAmount()) %>đ</td>
                        <td><%= order.getStatus() %></td>
                    </tr>
                <% }
                   } else { %>
                    <tr><td colspan="5">Bạn chưa có đơn hàng nào.</td></tr>
                <% } %>
            </tbody>
        </table>
    </div>
</div>

<!-- Footer cố định dưới cùng -->
<footer style="background-color: rgba(0,0,0,0.8); backdrop-filter: blur(5px); color:white; padding:20px; text-align:center;">
    <p>&copy; 2025 Shop Quần Áo Nam. All rights reserved.</p>
    <p>📍 218 Lĩnh Nam, Hoàng Mai, Hà Nội | ☎ 0987 123 456</p>
    <p>
        ✉ <a href="mailto:shopquannaonam@gmail.com" style="color:#00cec9;">Email</a> |
        🌐 <a href="https://facebook.com/tuyens.hoangs.33" style="color:#00cec9;" target="_blank">Facebook</a>
    </p>
</footer>

<script>
    function toggleDropdown() {
        const dropdown = document.getElementById('dropdownMenu');
        dropdown.style.display = dropdown.style.display === 'block' ? 'none' : 'block';
    }

    document.addEventListener('click', function (event) {
        const userMenu = document.querySelector('.user-menu');
        const dropdown = document.getElementById('dropdownMenu');
        if (userMenu && !userMenu.contains(event.target)) {
            dropdown.style.display = 'none';
        }
    });
</script>
</body>
</html>