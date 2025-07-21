<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Model.Product" %>

<%
    Product product = (Product) request.getAttribute("product");
%>

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
        .navbar {
                background-color: rgba(0, 0, 0, 0.8);
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 15px 30px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
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
            <div class="navbar">
                <h1 style="color: #00ffcc;">🛍 Shop Quần Áo Nam</h1>
            <a href="user.jsp" style="color:white; text-decoration:none; font-weight:bold;">🏠 Trang chủ</a>
            </div>
</head>
<body>

    <div class="container">

        <!-- Ảnh sản phẩm -->
        <div class="product-image">
            <img src="<%= request.getContextPath() + "/" + product.getHinhanh() %>" alt="Sản phẩm">
        </div>

        <!-- Thông tin sản phẩm -->
        <div class="product-info">
            <h2><%= product.getTensanpham() %></h2>
            <p class="price"><%= product.getGia() %> VNĐ</p>

            <form action="AddToCartServlet" method="post">               
                <input type="hidden" name="productID" value="${product.productID}">
                <input type="hidden" name="tensanpham" value="${product.tensanpham}">
                <input type="hidden" name="price" value="${product.gia}">
                <label>Chọn size:</label>
                <select name="size">
                    <option value="S">S</option>
                    <option value="M">M</option>
                    <option value="L">L</option>
                </select>
                <label>Số lượng:</label>
                <input type="number" name="quantity" value="1" min="1">
                <button type="submit">Thêm vào giỏ hàng</button>
            </form>
        </div>
    </div>

</body>
</html>
