<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.*, java.util.*, Model.CartItem, DAO.CartDAO" %>
<%@ page import="Model.Order,Model.OrderDetail" %>
<%@ page import="DAO.OrderDAO" %>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<Map<String, Object>> orders = new ArrayList<>();
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/banquanao", "root", "");
        PreparedStatement ps = conn.prepareStatement("SELECT * FROM orders WHERE username = ? ORDER BY NgayDatHang DESC");
        ps.setString(1, username);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            Map<String, Object> order = new HashMap<>();
            int orderID = rs.getInt("orderID");
            order.put("orderID", orderID);
            order.put("NgayDatHang", rs.getDate("NgayDatHang"));
            order.put("paymentMethod", rs.getString("paymentMethod"));
            order.put("status", rs.getString("status"));
            order.put("totalAmount", rs.getDouble("totalAmount"));

            // Lấy chi tiết đơn hàng cho mỗi orderID
            PreparedStatement detailPs = conn.prepareStatement("SELECT * FROM order_details WHERE orderID = ?");
            detailPs.setInt(1, orderID);
            ResultSet detailRs = detailPs.executeQuery();

            List<Map<String, Object>> details = new ArrayList<>();
            while (detailRs.next()) {
                Map<String, Object> detail = new HashMap<>();
                detail.put("productID", detailRs.getInt("productID"));
                detail.put("productName", detailRs.getString("productName"));
                detail.put("size", detailRs.getString("size"));
                detail.put("quantity", detailRs.getInt("quantity"));
                detail.put("price", detailRs.getDouble("price"));
                details.add(detail);
            }
            order.put("details", details);
            detailRs.close();
            detailPs.close();

            orders.add(order);
        }
        rs.close();
        ps.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<%
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
            item.put("productName", rs.getString("productName"));
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
        <title>Tài Khoản Của Tôi</title>
        <style>
            * {
                box-sizing: border-box;
            }

            html, body {
                height: 100%;
                margin: 0;
            }

            body {
                font-family: "Segoe UI", sans-serif;
                background-color: #f0f2f5;
                color: #2c3e50;
            }

            .page-wrapper {
                display: flex;
                flex-direction: column;
                min-height: 100vh;
            }

            .page-content {
                flex: 1;
            }

            .navbar {
                background-color: #006466;
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
                margin: 0;
                font-size: 22px;
                color: #ffffff;
            }

            .container {
                display: flex;
                margin: 30px;
            }

            .sidebar {
                width: 220px;
                background-color: white;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
                display: flex;
                flex-direction: column;
            }

            .sidebar a {
                padding: 12px;
                text-decoration: none;
                color: #333;
                font-weight: 500;
                border-radius: 6px;
                transition: background 0.2s ease;
            }

            .sidebar a:hover {
                background-color: #e0f7f9;
                color: #006466;
            }

            .profile-form {
                flex: 1;
                background-color: white;
                margin-left: 30px;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
            }

            .profile-form h2 {
                margin-top: 0;
                margin-bottom: 25px;
                color: #006466;
            }

            .form-group {
                margin-bottom: 20px;
            }

            label {
                display: block;
                margin-bottom: 8px;
                font-weight: 500;
            }

            input[type="text"],
            input[type="email"],
            input[type="date"],
            input[type="file"],
            input[type="number"] {
                width: 100%;
                padding: 10px 12px;
                border: 1px solid #ccc;
                border-radius: 8px;
                font-size: 15px;
            }

            .radio-group {
                display: flex;
                gap: 20px;
            }

            .submit-btn {
                background-color: #00b894;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 8px;
                font-size: 15px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            .submit-btn:hover {
                background-color: #d63031;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 15px;
            }

            table th, table td {
                padding: 12px;
                border: 1px solid #ddd;
                text-align: center;
            }

            table th {
                background-color: #f8f8f8;
            }

            button {
                padding: 6px 12px;
                margin: 2px;
                border-radius: 6px;
                border: none;
                cursor: pointer;
                background-color: #eee;
                transition: background-color 0.2s ease;
            }

            button:hover {
                background-color: #ccc;
            }

            img.avatar {
                border-radius: 50%;
                width: 100px;
                margin-bottom: 10px;
            }

            ul {
                list-style-type: disc;
                padding-left: 20px;
            }
        </style>
    </head>
    <body>
        <div class="page-wrapper">

            <div class="navbar">
                <h1>🛍 Shop Quần Áo Nam</h1>
                <a href="user.jsp" style="color:white; text-decoration:none; font-weight:bold;">🏠 Trang chủ</a>
            </div>

            <div class="page-content">
                <div class="container">
                    <!-- Sidebar -->
                    <div class="sidebar">

                        <% if (username != null) { %>
                        <a onclick="showTab('notifications')">🔔 Thông báo</a>
                        <a onclick="showTab('orders')">📦 Đơn hàng</a>
                        <a onclick="showTab('cart')">🛒 Giỏ hàng</a>
                        <a onclick="showTab('profile')">👤 Tài khoản</a>
                        <a href="logout.jsp">🚪 Đăng xuất</a>
                        <% } %>                       
                    </div>

                    <!-- Hồ sơ -->
                    <div class="profile-form" id="profile">
                        <h2>Hồ Sơ Của Tôi</h2>
                        <form action="ProfileServlet" method="post">
                            <p>Họ tên: <input type="text" name="email" value="${HoTen}"></p>
                            <p>Email: <input type="text" name="email" value="${email}"></p>
                            <p>Số điện thoại: <input type="text" name="SDT" value="${SDT}"></p>
                            <p>Địa chỉ: <input type="text" name="DiaChi" value="${DiaChi}"></p>

                        </form>

                        <button class="submit-btn" onclick="window.location.href = 'edit_profile.jsp'">💾 Chỉnh Sửa Thông Tin</button>
                    </div>

                    <!-- Đơn hàng -->
                    <div class="profile-form" id="orders" style="display: none;">
                        <h2>📦 Danh sách đơn hàng của <%= username %></h2>
                        <% if (orders.isEmpty()) { %>
                        <p>Bạn chưa có đơn hàng nào.</p>
                        <% } else { %>
                        <table>
                            <thead>
                                <tr>
                                    <th>Mã đơn</th>
                                    <th>Ngày đặt</th>
                                    <th>Phương thức</th>
                                    <th>Trạng thái</th>
                                    <th>Tổng tiền</th>
                                    <th>Chi tiết</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (Map<String, Object> order : orders) {
                                    int oid = (int) order.get("orderID");
                                %>
                                <tr>
                                    <td><%= oid %></td>
                                    <td><%= order.get("NgayDatHang") %></td>
                                    <td><%= order.get("paymentMethod") %></td>
                                    <td><%= order.get("status") %></td>
                                    <td><%= String.format("%,.0f", order.get("totalAmount")) %> đ</td>
                                    <td><button onclick="toggleDetails('<%= oid %>')">Chi tiết</button></td>
                                </tr>
                                <tr id="detail-<%= oid %>" style="display: none;">
                                    <td colspan="6">
                                        <table style="width: 100%; border: 1px solid #ddd; margin-top: 10px;">
                                            <thead>
                                                <tr>
                                                    <th>Mã Sản Phẩm</th>
                                                    <th>Tên sản phẩm </th>
                                                    <th>Size</th>
                                                    <th>Số lượng</th>
                                                    <th>Giá</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                    List<Map<String, Object>> details = (List<Map<String, Object>>) order.get("details");
                                                    for (Map<String, Object> d : details) {
                                                %>
                                                <tr>
                                                    <td><%= d.get("productID") %></td>
                                                    <td><%= d.get("productName") %></td>
                                                    <td><%= d.get("size") %></td>
                                                    <td><%= d.get("quantity") %></td>
                                                    <td><%= d.get("price") %></td>
                                                </tr>
                                                <% } %>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                        <% } %>
                    </div>

                    <!-- Giỏ hàng -->
                    <div class="profile-form" id="cart" style="display: none">
                        <h3>🛒 Giỏ hàng hiện tại</h3>

                        <%
                            if (cartItems == null || cartItems.isEmpty()) {
                        %>
                        <p>Giỏ hàng của bạn đang trống.</p>
                        <%
                            } else {
                        %>
                        <table>
                            <thead>
                                <tr>
                                    <th>Sản phẩm</th>
                                    <th>Size</th>
                                    <th>Số lượng</th>
                                    <th>Giá</th>
                                    <th>Thành tiền</th>
                                    <th>Thao tác</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    for (Map<String, Object> item : cartItems) {
                                        int productID = (int) item.get("productID");
                                        String size = (String) item.get("size");
                                        int quantity = (int) item.get("quantity");
                                        double price = (double) item.get("price");
                                        double total = price * quantity;
                                %>
                                <tr>
                                    <td><%= item.get("productName") %></td>
                            <form method="post" action="UpdateCartServlet">
                                <td>
                                    <input type="text" name="newSize" value="<%= size %>" required />
                                    <input type="hidden" name="oldSize" value="<%= size %>" />
                                    <input type="hidden" name="productID" value="<%= productID %>" />
                                </td>
                                <td>
                                    <input type="number" name="quantity" value="<%= quantity %>" min="1" required />
                                </td>
                                <td><%= String.format("%,.0f", price) %> đ</td>
                                <td><%= String.format("%,.0f", total) %> đ</td>
                                <td>
                                    <button type="submit">Cập nhật</button>
                            </form>
                            <form method="post" action="RemoveFromCartServlet" style="display:inline;">
                                <input type="hidden" name="productID" value="<%= productID %>" />
                                <input type="hidden" name="size" value="<%= size %>" />
                                <button type="submit" onclick="return confirm('Xóa sản phẩm này khỏi giỏ hàng?');">Xóa</button>
                            </form>
                            </td>
                            </tr>
                            <% } %>
                            </tbody>
                        </table>
                        <form action="checkout.jsp" method="post" style="margin-top: 20px;">
                            <input type="submit" value="Thanh toán" style="padding: 10px 20px; background-color: #00b894; color: white; border-radius: 6px; font-weight: bold;">
                        </form>
                        <% } %>
                    </div>

                    <!-- Thông báo -->
                    <div class="profile-form" id="notifications" style="display: none">
                        <h2>Thông báo</h2>
                        <ul>
                            <li>Bạn đã đặt hàng thành công lúc 10:00 ngày 10/07/2025.</li>
                            <li>Chào mừng bạn đến với Shop Quần Áo Nam!</li>
                            <li>Khuyến mãi: Giảm 20% cho đơn hàng đầu tiên!</li>
                        </ul>
                    </div>
                </div>
            </div>

            <footer style="background-color: rgba(0,0,0,0.8); backdrop-filter: blur(5px); color:white; padding:20px; text-align:center;">
                <p>&copy; 2025 Shop Quần Áo Nam. All rights reserved.</p>
                <p>📍 218 Lĩnh Nam, Hoàng Mai, Hà Nội | ☎ 0987 123 456</p>
                <p>
                    ✉ <a href="mailto:shopquannaonam@gmail.com" style="color:#00cec9;">Email</a> |
                    🌐 <a href="https://facebook.com/tuyens.hoangs.33" style="color:#00cec9;" target="_blank">Facebook</a>
                </p>
            </footer>

        </div>

        <script>
            function showTab(tabId) {
                const tabs = ['profile', 'orders', 'cart', 'notifications'];
                tabs.forEach(id => {
                    document.getElementById(id).style.display = (id === tabId) ? 'block' : 'none';
                });
            }

            function deleteRow(btn) {
                if (confirm("Bạn có chắc chắn muốn xóa mục này?")) {
                    const row = btn.closest('tr');
                    row.remove();
                }
            }
        </script>
        <script>
            function toggleDetails(orderID) {
                const detailRow = document.getElementById('detail-' + orderID);
                if (detailRow.style.display === 'none') {
                    detailRow.style.display = 'table-row';
                } else {
                    detailRow.style.display = 'none';
                }
            }
        </script>
    </body>
</html>
