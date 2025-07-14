<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đơn Mua</title>
    <style>
        body {
             background: url('media/anh1.jpg') no-repeat center center fixed;
            background-size: cover;
            font-family: "Segoe UI", sans-serif;
            margin: 0;
            padding: 0;
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

</body>
</html>
