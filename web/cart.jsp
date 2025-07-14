<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Giỏ Hàng</title>
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

    </style>
</head>
<body>

<div class="container">
    <h2>🛒 Giỏ Hàng Của Bạn</h2>

    <table>
        <thead>
            <tr>
                <th>Ảnh</th>
                <th>Tên sản phẩm</th>
                <th>Đơn giá</th>
                <th>Số lượng</th>
                <th>Thành tiền</th>
                <th>Hành động</th>
            </tr>
        </thead>
        <tbody>
            <!-- Sản phẩm 1 -->
            <tr>
                <td><img src="media/somi1.jpg" alt="Áo sơ mi trắng"></td>
                <td>Áo sơ mi trắng</td>
                <td>150,000đ</td>
                <td><input type="number" value="2" min="1"></td>
                <td>300,000đ</td>
                <td>
                    <button class="btn btn-update" onclick="alert('Đã cập nhật số lượng')">Sửa</button>
                    <button class="btn btn-delete" onclick="deleteRow(this)">Xóa</button>
                </td>
            </tr>

            <!-- Sản phẩm 2 -->
            <tr>
                <td><img src="media/quanbo1.jpg" alt="Quần jeans đen"></td>
                <td>Quần jeans đen</td>
                <td>350,000đ</td>
                <td><input type="number" value="1" min="1"></td>
                <td>350,000đ</td>
                <td>
                    <button class="btn btn-update" onclick="alert('Đã cập nhật số lượng')">Sửa</button>
                    <button class="btn btn-delete" onclick="deleteRow(this)">Xóa</button>
                </td>
            </tr>
        </tbody>
    </table>

   <div class="cart-footer">
    <p class="total">Tổng cộng: 650,000đ</p>
    <button class="checkout-btn" onclick="window.location.href='checkout.jsp'">🧾 Thanh Toán</button>
</div>

</div>

<script>
    function deleteRow(button) {
        if (confirm("Bạn có chắc muốn xóa sản phẩm này khỏi giỏ hàng?")) {
            const row = button.closest('tr');
            row.remove();
        }
    }
</script>

</body>
</html>
