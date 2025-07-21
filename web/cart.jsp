<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.*, java.util.*, Model.CartItem, DAO.CartDAO" %>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<Map<String, Object>> cartItems = new ArrayList<>();
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/banquanao", "root", ""); // Cập nhật nếu cần
        PreparedStatement ps = conn.prepareStatement("SELECT * FROM cart_items WHERE username = ?");
        ps.setString(1, username);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            Map<String, Object> item = new HashMap<>();
            item.put("productID", rs.getInt("productID"));
            item.put("tensanpham", rs.getString("tensanpham"));
            item.put("size", rs.getString("size"));
            item.put("quantity", rs.getInt("quantity"));
            item.put("price", rs.getDouble("price"));
            cartItems.add(item);
        }
        rs.close();
        ps.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Giỏ Hàng</title>
        <link rel="stylesheet" href="style/user.css" />
        <style>
            body {
                background: url('media/anh1.jpg') no-repeat center center fixed;
                background-size: cover;
                font-family: "Segoe UI", sans-serif;
                margin: 0;
                padding: 0;
            }

            .container {
                max-width: 1000px;
                margin: 50px auto;
                padding: 30px;
                background-color: #fff;
                border-radius: 12px;
                box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            }

            h2 {
                color: #2d3436;
                margin-bottom: 30px;
                text-align: center;
            }

            table {
                width: 100%;
                border-collapse: collapse;
            }

            table thead {
                background-color: #dfe6e9;
            }

            table th, table td {
                padding: 15px;
                text-align: center;
                font-size: 15px;
                border-bottom: 1px solid #eee;
            }

            table img {
                width: 60px;
                height: 60px;
                object-fit: cover;
                border-radius: 6px;
            }

            input[type="number"] {
                width: 60px;
                padding: 6px;
                font-size: 14px;
                border-radius: 6px;
                border: 1px solid #ccc;
            }

            .btn {
                padding: 8px 14px;
                border: none;
                border-radius: 6px;
                font-size: 14px;
                cursor: pointer;
            }

            .btn-update {
                background-color: #00b894;
                color: white;
            }

            .btn-delete {
                background-color: #d63031;
                color: white;
            }

            .btn:hover {
                opacity: 0.9;
            }

            .cart-footer {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-top: 30px;
                padding-top: 15px;
                border-top: 1px solid #ccc;
                background-color: #fff;
                border-radius: 0 0 12px 12px;
            }

            .total {
                font-size: 18px;
                font-weight: bold;
                color: #2d3436;
            }

            .checkout-btn {
                padding: 12px 22px;
                background-color: #0984e3;
                color: white;
                font-size: 16px;
                font-weight: bold;
                border: none;
                border-radius: 8px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            .checkout-btn:hover {
                background-color: #d63031;
            }

            /* Dropdown chỉnh */
            .navbar .user-menu {
                position: relative;
                cursor: pointer;
            }

            .navbar .user-menu span {
                margin-left: 8px;
                font-weight: 500;
                color: white;
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
        </style>
    </head>
    <body>

        <!-- Navbar từ user -->
        <div class="navbar">
            <div class="logo">Shop Quần Áo Nam</div>

            <div class="nav-links">
                <a href="ProductListServlet">Sản phẩm</a>
                <a href="CartServlet.jsp">Giỏ hàng</a>
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

            <%
               
                if (username != null) {
            %>
            <div class="user-menu" onclick="toggleDropdown()">
                <span>Xin chào <%= username %></span>
                <div class="dropdown" id="dropdownMenu">
                    <a href="user_profile.jsp">Tài Khoản Của Tôi</a>
                    <a href="order.jsp">Đơn Mua</a>
                    <a href="logout.jsp">Đăng Xuất</a>
                </div>
            </div>
            <%
                } else {
            %>
            <a href="login.jsp" class="login-link" style="color: white; font-weight: 500;">Đăng nhập</a>
            <%
                }
            %>
        </div>

        <!-- Nội dung giỏ hàng -->
        <div class="container">
    <h2>🛒 Giỏ hàng của bạn</h2>

    <c:if test="${empty cartItems}">
        <div class="empty-cart">Giỏ hàng của bạn hiện đang trống.</div>
    </c:if>

    <c:if test="${not empty cartItems}">
        <table>
            <tr>
                <th>Tên sản phẩm</th>
                <th>Size</th>
                <th>Số lượng</th>
                <th>Giá</th>
                <th>Thành tiền</th>
                <th>Thao tác</th>
            </tr>
            <c:forEach var="item" items="${cartItems}">
                <tr>
                    <td>${item.tensanpham}</td>
                    <td>${item.size}</td>
                    <td>
                        <form action="UpdateCartServlet" method="post">
                            <input type="hidden" name="productID" value="${item.productID}" />
                            <input type="hidden" name="size" value="${item.size}" />
                            <input type="number" name="quantity" value="${item.quantity}" min="1" />
                            <button type="submit">Cập nhật</button>
                        </form>
                    </td>
                    <td>${item.price}</td>
                    <td>${item.quantity * item.price}</td>
                    <td>
                        <form action="RemoveFromCartServlet" method="post">
                            <input type="hidden" name="productID" value="${item.productID}" />
                            <input type="hidden" name="size" value="${item.size}" />
                            <button type="submit" class="delete-btn" onclick="return confirm('Bạn có chắc muốn xóa sản phẩm này không?');">Xóa</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
        </div>
            

        <script>
            function deleteRow(button) {
                if (confirm("Bạn có chắc muốn xóa sản phẩm này khỏi giỏ hàng?")) {
                    const row = button.closest('tr');
                    row.remove();
                }
            }

            function toggleDropdown() {
                const dropdown = document.getElementById('dropdownMenu');
                dropdown.style.display = dropdown.style.display === 'block' ? 'none' : 'block';
            }

            document.addEventListener('click', function (event) {
                const userMenu = document.querySelector('.user-menu');
                const dropdown = document.getElementById('dropdownMenu');
                if (!userMenu.contains(event.target)) {
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

