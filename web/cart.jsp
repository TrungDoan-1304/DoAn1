<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%
    HttpSession session = request.getSession(false);
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>

        <meta charset="UTF-8">
        <title>Giỏ hàng</title>
        <link rel="stylesheet" href="css/style.css">
        <style>

            body {
                background: url('media/anh1.jpg') no-repeat center center fixed;
                background-size: cover;
                font-family: 'Segoe UI', sans-serif;
                overflow-x: hidden;
            }
            .cart-container {
                max-width: 1000px;
                margin: 50px auto;
                background: #fff;
                padding: 30px;
                border-radius: 12px;
                box-shadow: 0 4px 25px rgba(0, 0, 0, 0.1);
            }

            .cart-title {
                text-align: center;
                font-size: 28px;
                margin-bottom: 30px;
                color: #2f3640;
            }

            .cart-item {
                display: flex;
                align-items: center;
                justify-content: space-between;
                border-bottom: 1px solid #eee;
                padding: 15px 0;
            }

            .cart-item img {
                width: 100px;
                height: auto;
                border-radius: 8px;
            }

            .cart-info {
                flex: 1;
                margin-left: 20px;
            }

            .cart-info h3 {
                margin: 0;
                color: #2f3640;
            }

            .cart-info p {
                margin: 5px 0;
                color: #636e72;
            }

            .cart-actions {
                text-align: right;
            }

            .total {
                text-align: right;
                font-size: 20px;
                font-weight: bold;
                margin-top: 20px;
            }

            .checkout-btn {
                background-color: #00cec9;
                border: none;
                color: white;
                padding: 12px 25px;
                border-radius: 8px;
                cursor: pointer;
                font-size: 16px;
                transition: background-color 0.3s ease;
            }

            .checkout-btn:hover {
                background-color: #00b894;
            }
        </style>
    </head>
    <body>

        <div class="cart-container">
            <h2 class="cart-title">🛒 Giỏ hàng của bạn</h2>

            <!-- Ví dụ 1 sản phẩm, có thể lặp qua list từ servlet -->
            <div class="cart-item">
                <img src="images/product1.jpg" alt="Áo thun">
                <div class="cart-info">
                    <h3>Áo thun nam cao cấp</h3>
                    <p>Size: M</p>
                    <p>Giá: 250,000đ</p>
                </div>
                <div class="cart-actions">
                    <label>Số lượng: </label>
                    <input type="number" value="1" min="1" style="width: 60px; padding: 5px;">
                    <br><br>
                    <form action="RemoveFromCartServlet" method="post">
                        <input type="hidden" name="productId" value="1">
                        <button type="submit" class="checkout-btn" style="background-color: #d63031;">Xoá</button>
                    </form>
                </div>
            </div>

            <!-- Tổng tiền -->
            <div class="total">Tổng cộng: 250,000đ</div>

            <!-- Nút thanh toán -->
            <div style="text-align: right; margin-top: 20px;">
                <form action="CheckoutServlet" method="post">
                    <button type="submit" class="checkout-btn">Tiến hành thanh toán</button>
                </form>
            </div>
        </div>

    </body>
</html>
