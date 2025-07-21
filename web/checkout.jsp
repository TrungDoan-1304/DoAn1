<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="Model.CartItem" %>
<%@ page import="Model.User" %>
<%
    User user = (User) session.getAttribute("user");
    List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
    double total = 0;
%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Thanh Toán</title>
        <style>
            * {
                box-sizing: border-box;
            }

            body {
                font-family: "Segoe UI", sans-serif;
                background-color: #f0f2f5;
                margin: 0;
                padding: 0;
                display: flex;
                flex-direction: column;
                min-height: 100vh;
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

            .navbar a {
                color: white;
                text-decoration: none;
                font-weight: bold;
            }

            .container {
                max-width: 900px;
                margin: 40px auto;
                padding: 30px;
                background-color: #fff;
                border-radius: 12px;
                box-shadow: 0 6px 15px rgba(0, 0, 0, 0.05);
                flex: 1;
            }

            h2, h3 {
                color: #006466;
                margin-bottom: 20px;
            }

            .section {
                margin-bottom: 30px;
            }

            .form-group {
                margin-bottom: 15px;
            }

            label {
                display: block;
                font-weight: 500;
                margin-bottom: 6px;
            }

            input[type="text"],
            input[type="tel"],
            textarea,
            select {
                width: 100%;
                padding: 10px 14px;
                border: 1px solid #ccc;
                border-radius: 8px;
                font-size: 15px;
                background-color: #fdfdfd;
            }

            textarea {
                resize: vertical;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 10px;
            }

            table th, table td {
                padding: 12px;
                border: 1px solid #e0e0e0;
                text-align: center;
                font-size: 14px;
            }

            table th {
                background-color: #f9fafc;
                font-weight: bold;
            }

            .total {
                text-align: right;
                font-size: 18px;
                font-weight: bold;
                margin-top: 20px;
            }

            .checkout-btn {
                display: block;
                width: 100%;
                padding: 14px;
                background-color: #00b894;
                color: white;
                border: none;
                border-radius: 10px;
                font-size: 18px;
                font-weight: bold;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            .checkout-btn:hover {
                background-color: #d63031;
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
                text-decoration: none;
            }

            footer a:hover {
                text-decoration: underline;
            }
        </style>
    </head>
    <body>

        <div class="navbar">
            <h1>🛍 Shop Quần Áo Nam</h1>
            <a href="user.jsp">🏠 Trang chủ</a>
        </div>

<div class="container">
    <h2>🧾 Xác Nhận Thanh Toán</h2>

    <form method="post" action="ConfirmOrderServlet">
        <!-- Thông tin người nhận -->
        <div class="section">
            <h3>👤 Thông tin người nhận</h3>
            <div class="form-group">
                <label for="HoTen">Họ và tên</label>
                <input type="text" name="HoTen" id="HoTen" value="<%= user != null ? user.getHoTen() : "" %>" required>
            </div>
            <div class="form-group">
                <label for="SDT">Số điện thoại</label>
                <input type="tel" name="SDT" id="SDT" value="<%= user != null ? user.getSDT() : "" %>" required>
            </div>
            <div class="form-group">
                <label for="DiaChi">Địa chỉ giao hàng</label>
                <textarea name="DiaChi" id="DiaChi" required><%= user != null ? user.getDiaChi() : "" %></textarea>
            </div>
        </div>

        <!-- Phương thức thanh toán -->
        <div class="section">
            <h3>💳 Phương thức thanh toán</h3>
            <div class="form-group">
                <label for="paymentMethod">Phương thức thanh toán</label>
                <select name="paymentMethod" required>
                    <option value="COD">Thanh toán khi nhận hàng (COD)</option>
                    <option value="BANK">Chuyển khoản ngân hàng</option>
                    <option value="MOMO">Ví MoMo</option>
                </select>
            </div>
        </div>

        <!-- Ghi chú -->
        <div class="section">
            <h3>📝 Ghi chú</h3>
            <div class="form-group">
                <textarea name="note" id="note" rows="3" placeholder="Ví dụ: Giao hàng giờ hành chính, gọi trước khi đến..."></textarea>
            </div>
        </div>

        <!-- Danh sách sản phẩm -->
        <div class="section">
            <h3>📦 Đơn hàng của bạn</h3>
            <table>
                <thead>
                    <tr>
                        <th>Sản phẩm</th>
                        <th>Số lượng</th>
                        <th>Đơn giá</th>
                        <th>Thành tiền</th>
                    </tr>
                </thead>
                <tbody>
                <% if (cart != null && !cart.isEmpty()) {
                       for (CartItem item : cart) {
                           double itemTotal = item.getPrice() * item.getQuantity();
                           total += itemTotal;
                %>
                    <tr>
                        <td><%= item.getProductName() %></td>
                        <td><%= item.getQuantity() %></td>
                        <td><%= String.format("%,.0f", item.getPrice()) %>đ</td>
                        <td><%= String.format("%,.0f", itemTotal) %>đ</td>
                    </tr>
                <%   }
                   } else { %>
                    <tr>
                        <td colspan="4">Giỏ hàng trống</td>
                    </tr>
                <% } %>
                </tbody>
            </table>
            <p class="total">Tổng cộng: <%= String.format("%,.0f", total) %>đ</p>
        </div>

        <!-- Nút xác nhận -->
        <button class="checkout-btn" type="submit">✅ Xác nhận & Thanh toán</button>
    </form>
</div>            
        <footer>
            <p>&copy; 2025 Shop Quần Áo Nam. All rights reserved.</p>
            <p>📍 218 Lĩnh Nam, Hoàng Mai, Hà Nội | ☎ 0987 123 456</p>
            <p>
                ✉ <a href="mailto:shopquannaonam@gmail.com">Email</a> |
                🌐 <a href="https://facebook.com/tuyens.hoangs.33" target="_blank">Facebook</a>
            </p>
        </footer>

    </body>
</html>
