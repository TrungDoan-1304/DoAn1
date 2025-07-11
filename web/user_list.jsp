<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Danh sách sản phẩm</title>
        <style>
            body {
                background: url('media/anh1.jpg') no-repeat center center fixed;
                background-size: cover;
                margin: 0;
                font-family: "Segoe UI", sans-serif;
                background-color: #f5f6fa;
                color: #2f3640;
            }

            .navbar {
                background-color: rgba(0, 0, 0, 0.8);
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 15px 30px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            }
            
            .search-box {
    position: relative;
}

.search-box input {
    padding: 6px 10px;
    border-radius: 20px;
    border: 1px solid #ccc;
    width: 180px;
}

.search-box button {
    position: absolute;
    right: 5px;
    top: 50%;
    transform: translateY(-50%);
    background: none;
    border: none;
    color: #00cec9;
    font-size: 16px;
    cursor: pointer;
}

            .logo {
                font-size: 24px;
    font-weight: 700;
    color: #00cec9;
    text-transform: uppercase;
            }

            .nav-links a {
                text-decoration: none;
                color: white;
                margin: 0 15px;
                font-weight: 500;
            }

            .nav-links a:hover {
                color: #00cec9;
            }

            .filter-bar {
                display: flex;
                justify-content: center;
                gap: 20px;
                margin: 20px 0;
            }

            .filter-bar button {
                padding: 10px 20px;
                border: none;
                border-radius: 6px;
                background-color: #dcdde1;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            .filter-bar button:hover {
                background-color: #00cec9;
                color: white;
            }

            .product-list {
                display: flex;
                flex-wrap: wrap;
                justify-content: center;
                gap: 30px;
                padding: 30px;
            }

            .product-card {
                background: #fff;
                border-radius: 12px;
                box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
                width: 260px;
                padding: 20px;
                text-align: center;
            }

            .product-card img {
                width: 100%;
                height: auto;
                border-radius: 10px;
                margin-bottom: 15px;
            }

            .product-card h3 {
                font-size: 20px;
                color: #2f3640;
            }

            .product-card .price {
                color: #00b894;
                font-weight: 700;
                font-size: 18px;
            }

            .product-card button {
                margin-top: 10px;
                background-color: #00cec9;
                border: none;
                color: white;
                padding: 10px 20px;
                border-radius: 6px;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            .product-card button:hover {
                background-color: #00b894;
            }
        </style>
    </head>
    <body>
        <div class="navbar">
            <div class="logo">Shop Quần Áo Nam</div>
            <div class="nav-links">
                <a href="user.jsp">Trang chủ</a>
                <a href="cart.jsp">Giỏ hàng</a>
                <a href="user_profile.jsp">Tài khoản</a>
            </div>
            
        <div class="search-cart">
                <div class="search-box">
                    <input type="text" placeholder="Tìm sản phẩm...">
                    <button>&#128269;</button>
                </div>
            </div>
        </div>
        <div class="filter-bar">
            <button onclick="filterProducts('all')">Tất cả</button>
            <button onclick="filterProducts('ao')">Áo</button>
            <button onclick="filterProducts('quan')">Quần</button>
            <button onclick="filterProducts('phukien')">Phụ kiện</button>
        </div>

        <div class="product-list">
            <div class="product-card" data-category="ao">
                <img src="images/ao1.jpg" alt="Áo sơ mi trắng">
                <h3>Áo sơ mi trắng</h3>
                <p class="price">320.000đ</p>
                <button>Thêm vào giỏ</button>
            </div>

            <div class="product-card" data-category="quan">
                <img src="images/quan1.jpg" alt="Quần kaki nam">
                <h3>Quần kaki nam</h3>
                <p class="price">450.000đ</p>
                <button>Thêm vào giỏ</button>
            </div>

            <div class="product-card" data-category="phukien">
                <img src="images/non1.jpg" alt="Nón lưỡi trai">
                <h3>Nón lưỡi trai</h3>
                <p class="price">120.000đ</p>
                <button>Thêm vào giỏ</button>
            </div>
        </div>

        <script>
            function filterProducts(category) {
                const cards = document.querySelectorAll('.product-card');
                cards.forEach(card => {
                    if (category === 'all' || card.dataset.category === category) {
                        card.style.display = 'block';
                    } else {
                        card.style.display = 'none';
                    }
                });
            }
        </script>
        
          <%@ include file="footer.jsp" %>
    </body>
</html>
