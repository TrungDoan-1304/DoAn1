<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <body>

        <!-- Navbar giống trang user -->
        <div class="navbar">
            <div class="logo">Shop Quần Áo Nam</div>

            <div class="nav-links"> 
                <a href="user_list.jsp">Sản phẩm</a>
                <a href="cart.jsp">Giỏ hàng</a>
                <a href="order.jsp">Đơn Hàng</a>
                <a href="user_profile.jsp">Tài Khoản</a>
            </div>

            <div class="search-cart">
                <div class="search-box">
                    <input type="text" placeholder="Tìm sản phẩm...">
                    <button>&#128269;</button>
                </div>
                <div class="cart-icon">&#128722;</div>
            </div>

            <%
                String username = (String) session.getAttribute("username");
                if (username != null) {
            %>
            <div class="user-menu" onclick="toggleDropdown()">
                <span style="margin-left: 8px; font-weight: 500; color: white">Xin chào <%= username %></span>
                <div class="dropdown" id="dropdownMenu">
                    <a href="user_profile.jsp">Tài Khoản Của Tôi</a>
                    <a href="order.jsp">Đơn Mua</a>
                    <a href="logout.jsp">Đăng Xuất</a>
                </div>
            </div>
            <% } else { %>
            <a href="login.jsp" class="login-link" style="color: white; font-weight: 500;">Đăng nhập</a>
            <% } %>
        </div>

        <!-- Nội dung đơn hàng -->
        <div class="container">
            <h2>🧾 Đơn Mua</h2>

            <!-- Đơn hàng 1 -->
            <div class="order">
                <div class="order-header">
                    <span>📅 Ngày đặt: 10/07/2025</span>
                    <span class="status">Đang xử lý</span>
                </div>
                <div class="order-body">
                    <div class="order-item">
                        <span>Áo sơ mi trắng (x2)</span>
                        <span>300,000đ</span>
                    </div>
                    <div class="order-item">
                        <span>Quần jeans đen (x1)</span>
                        <span>350,000đ</span>
                    </div>
                </div>
                <div class="order-total">Tổng: 650,000đ</div>
                <div class="order-actions">
                    <button class="btn btn-view" onclick="alert('Xem chi tiết DH001')">Xem chi tiết</button>
                    <button class="btn btn-cancel" onclick="confirm('Bạn có chắc muốn hủy đơn hàng?')">Hủy đơn</button>
                </div>
            </div>

            <!-- Đơn hàng 2 -->
            <div class="order">
                <div class="order-header">
                    <span>📅 Ngày đặt: 08/07/2025</span>
                    <span class="status" style="background-color:#dff9fb; color:#0984e3;">Đã giao</span>
                </div>
                <div class="order-body">
                    <div class="order-item">
                        <span>Áo thun đen (x1)</span>
                        <span>200,000đ</span>
                    </div>
                </div>
                <div class="order-total">Tổng: 200,000đ</div>
                <div class="order-actions">
                    <button class="btn btn-view" onclick="alert('Xem chi tiết DH002')">Xem chi tiết</button>
                </div>
            </div>
        </div>

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
