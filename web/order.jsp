<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="Model.Order" %>
<%@ page import="Model.OrderDetail" %>

<%
    String username = (String) session.getAttribute("username");
%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Đơn Mua</title>
        <link rel="stylesheet" href="style/user.css" />
        <style>
            html, body {
                margin: 0;
                padding: 0;
                font-family: "Segoe UI", sans-serif;
                background: url('media/anh1.jpg') no-repeat center center fixed;
                background-size: cover;
                color: #2f3640;
                height: 100%;
            }

            .page-wrapper {
                display: flex;
                flex-direction: column;
                min-height: 100vh;
            }

            .container {
                max-width: 900px;
                margin: 40px auto;
                padding: 30px;
                background-color: white;
                border-radius: 12px;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
                flex: 1;
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

            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
                border: 1px solid #ccc;
            }

            th, td {
                padding: 12px;
                border: 1px solid #ccc;
                text-align: center;
            }

            th {
                background-color: #f0f0f0;
                font-weight: bold;
            }

            h2 {
                color: #006466;
                margin-bottom: 25px;
            }

            .search-cart {
                display: flex;
                align-items: center;
            }

            .search-box input {
                padding: 5px;
                border-radius: 4px;
                border: none;
            }

            .search-box button {
                padding: 5px;
                margin-left: 5px;
            }

            .cart-icon {
                margin-left: 15px;
                font-size: 20px;
            }

            .user-menu {
                position: relative;
                cursor: pointer;
            }

            .dropdown {
                display: none;
                position: absolute;
                right: 0;
                top: 100%;
                background-color: white;
                color: black;
                border: 1px solid #ccc;
                border-radius: 4px;
                z-index: 999;
            }

            .dropdown a {
                display: block;
                padding: 10px;
                text-decoration: none;
                color: #333;
            }

            .dropdown a:hover {
                background-color: #eee;
            }

            footer {
                background-color: rgba(0,0,0,0.8);
                backdrop-filter: blur(5px);
                color: white;
                padding: 20px;
                text-align: center;
            }

            footer a {
                color: #00cec9;
            }
        </style>
    </head>
    <body>
        <div class="page-wrapper">

            <!-- Navbar -->
            <div class="navbar">
                <div class="logo">Shop Quần Áo Nam</div>
                <div class="nav-links">
                    <a href="ProductListServlet">Sản phẩm</a>
                    <a href="CartServlet">Giỏ hàng</a>
                    <a href="OrderServlet">Đơn Hàng</a>
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
            <div class="container">
                <h2>📦 Danh sách đơn hàng của <%= username %></h2>
                <%
                    List<Order> orders = (List<Order>) request.getAttribute("orders");
                    if (orders != null && !orders.isEmpty()) {
                %>
                <table>
                    <thead>
                        <tr>
                            <th>Mã đơn</th>
                            <th>Ngày đặt</th>
                            <th>Phương thức</th>
                            <th>Trạng thái</th>
                            <th>Tổng tiền</th>
                            <th>Hành động</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if (orders != null) {
                                for (Order order : orders) {
                        %>
                        <!-- Dòng chính hiển thị thông tin đơn -->
                        <tr>
                            <td><%= order.getOrderID() %></td>
                            <td><%= order.getNgayDatHang() %></td>
                            <td><%= order.getPaymentMethod() %></td>
                            <td><%= order.getStatus() %></td>
                            <td><%= String.format("%,.0f", order.getTotalAmount()) %> đ</td>
                            <td>
                                <button onclick="toggleDetails('detail-<%= order.getOrderID() %>')">Chi tiết</button>
                            </td>
                        </tr>

                        <!-- Dòng ẩn: chứa chi tiết sản phẩm -->
                        <tr id="detail-<%= order.getOrderID() %>" style="display: none;">
                            <td colspan="6">
                                <table style="width:100%; border: 1px solid #ccc;">
                                    <thead>
                                        <tr>
                                            <th>Product ID</th>
                                            <th>Tên Sản Phẩm</th>
                                            <th>Size</th>
                                            <th>Số lượng</th>
                                            <th>Giá</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            for (OrderDetail detail : order.getOrderDetails()) {
                                        %>
                                        <tr>
                                            <td><%= detail.getProductID() %></td>
                                            <td><%= detail.getProductName() %></td>
                                            <td><%= detail.getSize() %></td>
                                            <td><%= detail.getQuantity() %></td>
                                            <td><%= detail.getPrice() %></td>
                                        </tr>
                                        <%
                                            }
                                        %>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                        <%
                                }
                            }
                        %>
                    </tbody>
                </table>
                <% } else { %>
                <p>Không có đơn hàng nào được tìm thấy.</p>
                <% } %>
            </div>

            <!-- Footer -->
            <footer>
                <p>&copy; 2025 Shop Quần Áo Nam. All rights reserved.</p>
                <p>📍 218 Lĩnh Nam, Hoàng Mai, Hà Nội | ☎ 0987 123 456</p>
                <p>
                    ✉ <a href="mailto:shopquannaonam@gmail.com">Email</a> |
                    🌐 <a href="https://facebook.com/tuyens.hoangs.33" target="_blank">Facebook</a>
                </p>
            </footer>
        </div>

        <!-- JavaScript Dropdown -->
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
        <script>
            function toggleDetails(id) {
                var row = document.getElementById(id);
                if (row.style.display === 'none') {
                    row.style.display = 'table-row';
                } else {
                    row.style.display = 'none';
                }
            }
        </script>
    </body>
</html>