<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Model.Order, Model.OrderDetail" %>
<%@ page import="java.util.List" %>
<%
    Order order = (Order) request.getAttribute("order");
    List<OrderDetail> orderDetails = (List<OrderDetail>) request.getAttribute("orderDetails");

    if (order == null) {
%>
    <p style="color:red; text-align:center;">Không tìm thấy thông tin đơn hàng.</p>
<%
    return;
    }
%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Chi tiết đơn hàng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f2f4f7;
        }

        .container {
            margin-top: 40px;
            max-width: 1100px;
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }

        h3 {
            color: #2c3e50;
            margin-bottom: 25px;
        }

        .info-section {
            margin-bottom: 30px;
        }

        .info-section h5 {
            margin-bottom: 15px;
        }

        table {
            width: 100%;
        }

        th {
            background-color: #3498db;
            color: white;
        }

        th, td {
            text-align: center;
            padding: 10px;
            border: 1px solid #ddd;
        }

        .btn-back {
            margin-bottom: 20px;
        }

        .form-select {
            width: 200px;
            display: inline-block;
        }
    </style>
</head>
<body>
<div class="container">

    <h3>📦 Chi tiết đơn hàng: <%= order.getOrderID() %></h3>

    <!-- Thông tin người đặt hàng -->
    <div class="info-section">
        <h5>👤 Thông tin người đặt:</h5>
        <p><strong>Họ tên:</strong> <%= order.getHoTen() %></p>
        <p><strong>Số điện thoại:</strong> <%= order.getSDT() %></p>
        <p><strong>Địa chỉ:</strong> <%= order.getDiaChi() %></p>
        <p><strong>Email (username):</strong> <%= order.getUsername() %></p>
    </div>
    <% if (order == null) { %>
    <p style="color:red;">Không tìm thấy thông tin đơn hàng.</p>
    <% return; } %>
    <!-- Thông tin đơn hàng -->
    <div class="info-section">
        <h5>🧾 Thông tin đơn hàng:</h5>
        <p><strong>Ngày đặt:</strong> <%= order.getNgayDatHang() %></p>
        <p><strong>Phương thức thanh toán:</strong> <%= order.getPaymentMethod() %></p>
        <p><strong>Ghi chú:</strong> <%= order.getNote() %></p>
        <p><strong>Tổng tiền:</strong> <%= String.format("%,.0f", order.getTotalAmount()) %> đ</p>
        <form method="post" action="OrderDetailServlet">
            <input type="hidden" name="orderID" value="<%= order.getOrderID() %>">
            <label for="status"><strong>Trạng thái:</strong></label>
            <select name="status" class="form-select">
                <option value="Chưa thanh toán" <%= order.getStatus().equals("Chưa thanh toán") ? "selected" : "" %>>Chưa thanh toán</option>
                <option value="Đang giao hàng" <%= order.getStatus().equals("Đang giao hàng") ? "selected" : "" %>>Đang giao hàng</option>
                <option value="Đã giao thành công" <%= order.getStatus().equals("Đã giao thành công") ? "selected" : "" %>>Đã giao thành công</option>
            </select>
            <button type="submit" class="btn btn-primary btn-sm">Cập nhật trạng thái</button>
        </form>
    </div>

    <!-- Danh sách sản phẩm -->
    <h5>📋 Danh sách sản phẩm trong đơn</h5>
    <table class="table table-bordered table-hover">
        <thead>
            <tr>
                <th>STT</th>
                <th>Sản phẩm</th>
                <th>Size</th>
                <th>Số lượng</th>
                <th>Đơn giá</th>
                <th>Tổng</th>
            </tr>
        </thead>
        <tbody>
            <%
                int stt = 1;
                for (OrderDetail detail : orderDetails) {
            %>
            <tr>
                <td><%= stt++ %></td>
                <td><%= detail.getProductName() %></td>
                <td><%= detail.getSize() %></td>
                <td><%= detail.getQuantity() %></td>
                <td><%= String.format("%,.0f", detail.getPrice()) %> đ</td>
                <td><%= String.format("%,.0f", detail.getTotalAmount()) %> đ</td>
            </tr>
            <% } %>
        </tbody>
    </table>
        <a href="AdminOrderServlet" class="btn btn-secondary">← Quay về quản lý đơn</a>
</div>
</body>
</html>