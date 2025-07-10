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
                <a href="user_profile.jsp">Tài Khoản</a>
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
        <img src="https://i.imgur.com/8Km9tLL.png" alt="avatar" style="width: 36px; height: 36px; border-radius: 50%;">
        <span style="margin-left: 8px; font-weight: 500;"><%= username %></span>
        <div class="dropdown" id="dropdownMenu">
            <a href="profile.jsp">Tài Khoản Của Tôi</a>
            <a href="orders.jsp">Đơn Mua</a>
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
                <img src="images/white-shirt.jpg" alt="Áo sơ mi trắng">
                <h3>Áo sơ mi trắng</h3>
                <p class="price">320.000₫</p>
                <button>Thêm vào giỏ</button>
            </div>
            <div class="product-card">
                <img src="images/black-tee.jpg" alt="Áo thun đen">
                <h3>Áo thun đen</h3>
                <p class="price">250.000₫</p>
                <button>Thêm vào giỏ</button>
            </div>
            <div class="product-card">
                <img src="images/kaki-pants.jpg" alt="Quần kaki">
                <h3>Quần kaki nam</h3>
                <p class="price">450.000₫</p>
                <button>Thêm vào giỏ</button>
            </div>
        </div>

        <%@ include file="footer.jsp" %>
        
     

<script>
    function toggleDropdown() {
        const menu = document.getElementById("dropdownMenu");
        menu.style.display = menu.style.display === "block" ? "none" : "block";
    }

    // Ẩn dropdown nếu click ra ngoài
    document.addEventListener("click", function(e) {
        const userMenu = document.querySelector(".user-menu");
        const dropdown = document.getElementById("dropdownMenu");
        if (!userMenu.contains(e.target)) {
            dropdown.style.display = "none";
        }
    });
</script>


    </body>
</html>
