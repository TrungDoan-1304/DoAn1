<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <title>Trang Người Dùng</title>
        <link rel="stylesheet" href="style/user.css"/>
    </head>
    <body>

        <div class="navbar">
            <div class="logo">Shop Quần Áo Nam</div>

            <div class="nav-links"> 
                <a href="user_list.jsp">Sản phẩm</a>
                <a href="cart.jsp">Giỏ hàng</a>
                <a href="order.jsp">Đơn Hàng</a>
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
    String username = (String) session.getAttribute("username");
    if (username != null) {
%>
    <div class="user-menu" onclick="toggleDropdown()">
        <span style="margin-left: 8px; font-weight: 500; color: white">Xin chào <%= username %></span>
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

        <div class="banner">
            <h1>Chào mừng bạn đến với <span>SHOP QUẦN ÁO NAM</span></h1>
            <p>Khám phá thời trang hiện đại và cá tính</p>
        </div>

        <div class="section-title">Sản phẩm nổi bật</div>
        <div class="product-container">
            <div class="product-card">
    <img src="media/somi1.jpg" alt="Áo sơ mi trắng">
    <h3>Áo sơ mi</h3>
    <p class="price">320.000₫</p>
    <form action="addToCart.jsp" method="post">
        <input type="hidden" name="product_id" value="1">
        <input type="hidden" name="quantity" value="1">
        <button type="submit">Thêm vào giỏ</button>
    </form>
</div>

<div class="product-card">
    <img src="media/ao1.webp" alt="Áo thun đen">
    <h3>Áo thun đen</h3>
    <p class="price">250.000₫</p>
    <form action="addToCart.jsp" method="post">
        <input type="hidden" name="product_id" value="2">
        <input type="hidden" name="quantity" value="1">
        <button type="submit">Thêm vào giỏ</button>
    </form>
</div>

<div class="product-card">
    <img src="media/quanbo1.jpg" alt="Quần Jean">
    <h3>Quần Jean nam</h3>
    <p class="price">450.000₫</p>
    <form action="addToCart.jsp" method="post">
        <input type="hidden" name="product_id" value="3">
        <input type="hidden" name="quantity" value="1">
        <button type="submit">Thêm vào giỏ</button>
    </form>
</div>

        </div>

        <%@ include file="footer.jsp" %>
        
     

<script>
    function toggleDropdown() {
        const dropdown = document.getElementById('dropdownMenu');
        dropdown.style.display = dropdown.style.display === 'block' ? 'none' : 'block';
    }

    document.addEventListener('click', function(event) {
        const userMenu = document.querySelector('.user-menu');
        const dropdown = document.getElementById('dropdownMenu');
        if (!userMenu.contains(event.target)) {
            dropdown.style.display = 'none';
        }
    });

    function showTab(tabId) {
        const tabs = ['profile', 'orders', 'cart', 'notifications'];
        tabs.forEach(id => {
            document.getElementById(id).style.display = (id === tabId) ? 'block' : 'none';
        });
    }
</script>

    </body>
</html>
