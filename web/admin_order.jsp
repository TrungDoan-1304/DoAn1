<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Model.Order" %>
<%@ page import="java.util.List" %>
<%
    List<Order> orders = (List<Order>) request.getAttribute("orders");
%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý đơn hàng</title>
    <link rel="stylesheet" href="style/user.css">
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f4f6f8;
            margin: 0;
        }

        .container {
            max-width: 1100px;
            margin: 40px auto;
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 6px 20px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #2d3436;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th {
            background-color: #0984e3;
            color: white;
        }

        th, td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid #ccc;
        }

        a.btn {
            display: inline-block;
            padding: 8px 14px;
            background-color: #00b894;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: 0.3s;
        }

        a.btn:hover {
            background-color: #d63031;
        }
    </style>
</head>
<body>
    <div class="container">
        <a href="AdminDashboardServlet" class="btn btn-secondary">← Quay về trang quản lý</a>
        <h2>📦 Quản lý đơn hàng</h2>

        <%
            if (orders != null && !orders.isEmpty()) {
        %>
        <table>
            <thead>
                <tr>
                    <th>Mã Đơn</th>
                    <th>Người dùng</th>
                    <th>Ngày đặt</th>
                    <th>Phương thức</th>
                    <th>Trạng thái</th>
                    <th>Tổng tiền</th>
                    <th>Chi tiết</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (Order order : orders) {
                %>
                <tr>
                    <td><%= order.getOrderID() %></td>
                    <td><%= order.getUsername() %></td>
                    <td><%= order.getNgayDatHang() %></td>
                    <td><%= order.getPaymentMethod() %></td>
                    <td><%= order.getStatus() %></td>
                    <td><%= String.format("%,.0f", order.getTotalAmount()) %> đ</td>
                    <td>
                      <a href="AdminOrderServlet?orderID=<%= order.getOrderID() %>" class="btn-view">Chi tiết</a>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <% } else { %>
        <p style="text-align:center;">⚠ Không có đơn hàng nào.</p>
        <% } %>
    </div>
</body>
</html>