<%-- 
    Document   : list
    Created on : 27 thg 6, 2025, 23:22:17
    Author     : Admin
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Bộ Sưu Tập</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                background: url('media/anh1.jpg') no-repeat center center fixed;
                background-size: cover;
                font-family: 'Segoe UI', sans-serif;
                overflow-x: hidden;
            }
            /* Sidebar */
            .sidebar {

                background-color: rgba(0, 0, 0, 0.6);
                border-right: 1px solid rgba(255, 255, 255, 0.1);
                min-height: 100vh;
                padding-top: 30px;
                position: fixed;
                top: 56px;
                left: 0;
                width: 220px;
                z-index: 1000;
            }

            .sidebar h4 {
                color: #ffffff;
                text-align: center;
                margin-bottom: 30px;
                font-weight: bold;
            }

            .sidebar .nav-link {
                color: #ccc;
                font-size: 16px;
                padding: 12px 20px;
                transition: 0.3s;
            }

            .sidebar .nav-link:hover,
            .sidebar .nav-link.active {
                background-color: #28a745;
                color: white;

            }

            /* Content */
            .content {
                margin-left: 240px;
                padding: 40px 30px;
                margin-top: 60px;
            }

            .product-card {
                background-color: #1c1c1c;
                border-radius: 12px;
                overflow: hidden;
                transition: transform 0.3s, box-shadow 0.3s;
            }

            .product-card:hover {
                transform: translateY(-8px);
                box-shadow: 0 10px 25px rgba(0,0,0,0.5);
            }

            .product-card img {
                width: 100%;
                height: 250px;
                object-fit: fill;
                object-position: center;
            }

            .product-card .card-body {
                text-align: center;
            }

            .product-title {
                font-size: 18px;
                font-weight: bold;
            }

            .product-price {
                color: #00e676;
                font-weight: bold;
                font-size: 16px;
            }

            .section-title {
                font-size: 35px;
                font-weight: bold;
                text-align: center;
                margin-bottom: 40px;
                color: #00cccc;
                -webkit-text-stroke: 2px black;
            }
        </style>
    </head>
    <body>

        <%@ include file="navbar.jsp" %>

        <!-- Sidebar -->
        <div class="sidebar">
            <h4> Danh mục</h4>
            <ul class="nav flex-column text-start px-2" id="filterMenu">
                <li class="nav-item"><a href="#" class="nav-link active" data-filter="all"> Tất cả</a></li>
                <li class="nav-item"><a href="#" class="nav-link" data-filter="ao"> Áo</a></li>
                <li class="nav-item"><a href="#" class="nav-link" data-filter="quan"> Quần</a></li>
                <li class="nav-item"><a href="#" class="nav-link" data-filter="pk"> Phụ kiện</a></li>
            </ul>
        </div>

        <!-- Nội dung sản phẩm -->
        <div class="content">
            <h2 class="section-title"> DANH SÁCH SẢN PHẨM </h2>
            <div class="row" id="productList">
                <!-- Áo -->
                <div class="col-md-4 mb-4 product-item ao">
                    <div class="card product-card">
                        <img src="media/ao1.webp" alt="Áo 1">
                        <div class="card-body">
                            <div class="product-title">Áo thun basic</div>
                            <div class="product-price">150.000đ</div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 mb-4 product-item ao">
                    <div class="card product-card">
                        <img src="media/ao2.webp" alt="Áo 1">
                        <div class="card-body">
                            <div class="product-title">Áo khoác basic</div>
                            <div class="product-price">450.000đ</div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 mb-4 product-item ao">
                    <div class="card product-card">
                        <img src="media/ao3.jpg" alt="Áo 1">
                        <div class="card-body">
                            <div class="product-title">Áo LV trắng </div>
                            <div class="product-price">250.000đ</div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 mb-4 product-item ao">
                    <div class="card product-card">
                        <img src="media/ao3lo.webp" alt="Áo 1">
                        <div class="card-body">
                            <div class="product-title">Áo 3 lỗ đen</div>
                            <div class="product-price">80.000đ</div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 mb-4 product-item ao">
                    <div class="card product-card">
                        <img src="media/aocaro.jpg" alt="Áo 1">
                        <div class="card-body">
                            <div class="product-title">Áo sơ mi caro</div>
                            <div class="product-price">170.000đ</div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 mb-4 product-item ao">
                    <div class="card product-card">
                        <img src="media/aohoodie.jpeg" alt="Áo 1">
                        <div class="card-body">
                            <div class="product-title">Áo Hoodie basic</div>
                            <div class="product-price">250.000đ</div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 mb-4 product-item ao">
                    <div class="card product-card">
                        <img src="media/aoke.jpg" alt="Áo 1">
                        <div class="card-body">
                            <div class="product-title">Áo kẻ ngắn tay </div>
                            <div class="product-price">150.000đ</div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 mb-4 product-item ao">
                    <div class="card product-card">
                        <img src="media/aokhoac.jpg" alt="Áo 1">
                        <div class="card-body">
                            <div class="product-title">Áo khoác Jean</div>
                            <div class="product-price">350.000đ</div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 mb-4 product-item ao">
                    <div class="card product-card">
                        <img src="media/aopolo1.jpg" alt="Áo 1">
                        <div class="card-body">
                            <div class="product-title">Áo Polo trắng</div>
                            <div class="product-price">150.000đ</div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 mb-4 product-item ao">
                    <div class="card product-card">
                        <img src="media/aopolo2.jpg" alt="Áo 1">
                        <div class="card-body">
                            <div class="product-title">Áo Polo tối màu </div>
                            <div class="product-price">150.000đ</div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 mb-4 product-item ao">
                    <div class="card product-card">
                        <img src="media/aoswe.jpg" alt="Áo 1">
                        <div class="card-body">
                            <div class="product-title">Áo Sweater basic</div>
                            <div class="product-price">250.000đ</div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 mb-4 product-item ao">
                    <div class="card product-card">
                        <img src="media/aoxam.webp" alt="Áo 1">
                        <div class="card-body">
                            <div class="product-title">Áo thun xám</div>
                            <div class="product-price">100.000đ</div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 mb-4 product-item ao">
                    <div class="card product-card">
                        <img src="media/somi1.jpg" alt="Áo 1">
                        <div class="card-body">
                            <div class="product-title">Áo sơ mi kẻ trắng</div>
                            <div class="product-price">100.000đ</div>
                        </div>
                    </div>
                </div>


                <!-- Quần -->
                <div class="col-md-4 mb-4 product-item quan">
                    <div class="card product-card">
                        <img src="media/quan1.webp" alt="Quần short">
                        <div class="card-body">
                            <div class="product-title">Quần short đen</div>
                            <div class="product-price">120.000đ</div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 mb-4 product-item quan">
                    <div class="card product-card">
                        <img src="media/quan2.webp" alt="Quần short">
                        <div class="card-body">
                            <div class="product-title">Quần short kaki</div>
                            <div class="product-price">150.000đ</div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 mb-4 product-item quan">
                    <div class="card product-card">
                        <img src="media/quan3.webp" alt="Quần short">
                        <div class="card-body">
                            <div class="product-title">Quần short hoa</div>
                            <div class="product-price">160.000đ</div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 mb-4 product-item quan">
                    <div class="card product-card">
                        <img src="media/quanbo1.jpg" alt="Quần short">
                        <div class="card-body">
                            <div class="product-title">Quần Jean đen</div>
                            <div class="product-price">220.000đ</div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 mb-4 product-item quan">
                    <div class="card product-card">
                        <img src="media/quanbo2.jpg" alt="Quần short">
                        <div class="card-body">
                            <div class="product-title">Quần Jean xước xanh</div>
                            <div class="product-price">220.000đ</div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 mb-4 product-item quan">
                    <div class="card product-card">
                        <img src="media/quanbo3.jpg" alt="Quần short">
                        <div class="card-body">
                            <div class="product-title">Quần Jean hiphop</div>
                            <div class="product-price">350.000đ</div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 mb-4 product-item quan">
                    <div class="card product-card">
                        <img src="media/quandui1.jpg" alt="Quần short">
                        <div class="card-body">
                            <div class="product-title">Quần đùi đi biển </div>
                            <div class="product-price">120.000đ</div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 mb-4 product-item quan">
                    <div class="card product-card">
                        <img src="media/quandui2.jpg" alt="Quần short">
                        <div class="card-body">
                            <div class="product-title">Quần short Gym</div>
                            <div class="product-price">120.000đ</div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 mb-4 product-item quan">
                    <div class="card product-card">
                        <img src="media/quandui3.jpg" alt="Quần short">
                        <div class="card-body">
                            <div class="product-title">Quần ngủ hoa hòe</div>
                            <div class="product-price">160.000đ</div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 mb-4 product-item quan">
                    <div class="card product-card">
                        <img src="media/quandui4.jpg" alt="Quần short">
                        <div class="card-body">
                            <div class="product-title">Quần Short vải đen</div>
                            <div class="product-price">120.000đ</div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 mb-4 product-item quan">
                    <div class="card product-card">
                        <img src="media/quanvai1.webp" alt="Quần short">
                        <div class="card-body">
                            <div class="product-title">Quần âu Office</div>
                            <div class="product-price">250.000đ</div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 mb-4 product-item quan">
                    <div class="card product-card">
                        <img src="media/quanvai2.jpg" alt="Quần short">
                        <div class="card-body">
                            <div class="product-title">Quần vải HSSV</div>
                            <div class="product-price">220.000đ</div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 mb-4 product-item quan">
                    <div class="card product-card">
                        <img src="media/quanvai3.jpg" alt="Quần short">
                        <div class="card-body">
                            <div class="product-title">Quần tây </div>
                            <div class="product-price">220.000đ</div>
                        </div>
                    </div>
                </div>

                <!-- Phụ kiện -->
                <div class="col-md-4 mb-4 product-item pk">
                    <div class="card product-card">
                        <img src="media/mu1.jpeg" alt="Mũ lưỡi trai">
                        <div class="card-body">
                            <div class="product-title">Mũ lưỡi trai</div>
                            <div class="product-price">150.000đ</div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 mb-4 product-item pk">
                    <div class="card product-card">
                        <img src="media/phukien1.webp" alt="Mũ lưỡi trai">
                        <div class="card-body">
                            <div class="product-title">Combo phụ kiện bằng Da</div>
                            <div class="product-price">1.150.000đ</div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 mb-4 product-item pk">
                    <div class="card product-card">
                        <img src="media/pk1.jpg" alt="Mũ lưỡi trai">
                        <div class="card-body">
                            <div class="product-title">Thắt lưng da cá sấu</div>
                            <div class="product-price">750.000đ</div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 mb-4 product-item pk">
                    <div class="card product-card">
                        <img src="media/pk2.jpg" alt="Mũ lưỡi trai">
                        <div class="card-body">
                            <div class="product-title">Giày da phong cách</div>
                            <div class="product-price">850.000đ</div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 mb-4 product-item pk">
                    <div class="card product-card">
                        <img src="media/pk3.jpg" alt="Mũ lưỡi trai">
                        <div class="card-body">
                            <div class="product-title">Đồng hồ khảo cổ</div>
                            <div class="product-price">350.000đ</div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 mb-4 product-item pk">
                    <div class="card product-card">
                        <img src="media/pk4.jpg" alt="Mũ lưỡi trai">
                        <div class="card-body">
                            <div class="product-title">Cà vạt xanh kẻ trắng</div>
                            <div class="product-price">150.000đ</div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 mb-4 product-item pk">
                    <div class="card product-card">
                        <img src="media/pk5.jpg" alt="Mũ lưỡi trai">
                        <div class="card-body">
                            <div class="product-title">Mũ lưỡi trai Force</div>
                            <div class="product-price">180.000đ</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

        <!-- JS Lọc danh mục -->
        <script>
            const links = document.querySelectorAll('#filterMenu .nav-link');
            const items = document.querySelectorAll('.product-item');

            links.forEach(link => {
                link.addEventListener('click', function (e) {
                    e.preventDefault();
                    links.forEach(l => l.classList.remove('active'));
                    this.classList.add('active');
                    const filter = this.dataset.filter;

                    items.forEach(item => {
                        if (filter === 'all' || item.classList.contains(filter)) {
                            item.style.display = 'block';
                        } else {
                            item.style.display = 'none';
                        }
                    });
                });
            });
        </script>

        <%@ include file="footer.jsp" %>
    </body>
</html>


