<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Chi Tiết Sản Phẩm</title>
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
            display: flex;
            gap: 40px;
            padding: 30px;
            background-color: #fff;
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
        }

        .product-image {
            flex: 1;
        }

        .product-image img {
            max-width: 100%;
            border-radius: 12px;
        }

        .product-info {
            flex: 2;
        }

        .product-info h2 {
            font-size: 28px;
            color: #333;
            margin-bottom: 10px;
        }

        .product-info .price {
            font-size: 22px;
            color: #e74c3c;
            margin-bottom: 20px;
        }

        .product-info p {
            font-size: 16px;
            color: #555;
            margin-bottom: 15px;
        }

        .product-info .code {
            color: #777;
            font-size: 14px;
            margin-bottom: 10px;
        }

        label {
            font-weight: 500;
            display: block;
            margin-bottom: 6px;
        }

        input[type="number"] {
            width: 80px;
            padding: 8px;
            font-size: 15px;
            margin-bottom: 20px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }

        .add-cart-btn {
            padding: 12px 20px;
            background-color: #00b894;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .add-cart-btn:hover {
            background-color: #d63031;
        }
    </style>
</head>
<body>

<div class="container">
    <!-- Ảnh sản phẩm -->
    <div class="product-image">
        <img src="https://i.imgur.com/placeholder.png" alt="Sản phẩm">
    </div>

    <!-- Thông tin sản phẩm -->
    <form method="post" action="AddToCartServlet">
    <input type="hidden" name="productID" value="${product.productID}" />
    <p>Tên sản phẩm: ${product.tensanpham}</p>
    <p>Giá: ${product.gia} VNĐ</p>
    <p>Size:
        <select name="size">
            <option value="S">S</option>
            <option value="M">M</option>
            <option value="L">L</option>
            <option value="XL">XL</option>
        </select>
    </p>
    <p>Số lượng: <input type="number" name="quantity" value="1" min="1" /></p>
    <input type="submit" value="Thêm vào giỏ hàng" />
    </form>
</div>

</body>
</html>
