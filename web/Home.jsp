<%-- 
    Document   : Home
    Created on : 27 thg 6, 2025, 10:15:52
    Author     : Admin
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Trang chủ - Shop Quần Áo Nam</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
        <link rel="stylesheet" href="style/home.css"/>
    </head>
    <body>

        <%@ include file="navbar.jsp" %>

        <div class="container mt-5">

            <!-- Banner lớn -->
            <div class="hero-section">
                <h1>Chào mừng đến với Shop Quần Áo Nam</h1>
                <p>Thời trang nam hiện đại - Phong cách đỉnh cao</p>
                <a href="list.jsp" class="btn btn-lg">Khám phá ngay</a>
            </div>

            <!-- Sản phẩm nổi bật -->
            <h2 class="section-title mt-5">Sản phẩm nổi bật</h2>
            <div class="row row-cols-1 row-cols-md-3 g-4 mt-3">

                <div class="col">
                    <div class="card product-card">
                        <img src="media/bo1.jpg" class="card-img-top" alt="Áo thun nam">
                        <div class="card-body">
                            <h5 class="card-title">Thời trang hè</h5>
                            <p class="card-text">Phong cách đơn giản, thoải mái mỗi ngày</p>
                            <a href="list.jsp" class="btn btn-sm btn-shop">Xem ngay</a>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card product-card">
                        <img src="media/bo2.jpg" class="card-img-top" alt="Áo thun nam">
                        <div class="card-body">
                            <h5 class="card-title">Streetwear</h5>
                            <p class="card-text">Phong cách độc đáo, đa dạng</p>
                            <a href="list.jsp" class="btn btn-sm btn-shop">Xem ngay</a>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card product-card">
                        <img src="media/bo3.jpg" class="card-img-top" alt="Áo thun nam">
                        <div class="card-body">
                            <h5 class="card-title">Thời trang công sở</h5>
                            <p class="card-text">Đơn giản, thoải mái, lịch lãm</p>
                            <a href="list.jsp" class="btn btn-sm btn-shop">Xem ngay</a>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card product-card">
                        <img src="media/ao1.webp" class="card-img-top" alt="Áo thun nam">
                        <div class="card-body">
                            <h5 class="card-title">Áo thun basic</h5>
                            <p class="card-text">Phong cách đơn giản, thoải mái mỗi ngày</p>
                            <a href="list.jsp" class="btn btn-sm btn-shop">Xem ngay</a>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card product-card">
                        <img src="media/somi1.jpg" class="card-img-top" alt="Sơ mi trẻ trung">
                        <div class="card-body">
                            <h5 class="card-title">Áo sơ mi trẻ trung</h5>
                            <p class="card-text">Phù hợp đi làm, đi chơi, cực kỳ lịch sự</p>
                            <a href="list.jsp" class="btn btn-sm btn-shop">Xem ngay</a>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card product-card">
                        <img src="media/quan1.webp" class="card-img-top" alt="Quần short nam">
                        <div class="card-body">
                            <h5 class="card-title">Quần short nam</h5>
                            <p class="card-text">Đủ form dáng, chất lượng cao</p>
                            <a href="list.jsp" class="btn btn-sm btn-shop">Xem ngay</a>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card product-card">
                        <img src="media/aopolo1.jpg" class="card-img-top" alt="Áo PoLo">
                        <div class="card-body">
                            <h5 class="card-title">Áo PoLo </h5>
                            <p class="card-text">Form dáng đẹp, chất lượng cao</p>
                            <a href="list.jsp" class="btn btn-sm btn-shop">Xem ngay</a>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card product-card">
                        <img src="media/quanbo3.jpg" class="card-img-top" alt="Quần jean nam">
                        <div class="card-body">
                            <h5 class="card-title">Quần jean nam</h5>
                            <p class="card-text">Nhiều mẫu mã, đa dạng</p>
                            <a href="list.jsp" class="btn btn-sm btn-shop">Xem ngay</a>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card product-card">
                        <img src="media/quanvai1.webp" class="card-img-top" alt="Quần vải nam">
                        <div class="card-body">
                            <h5 class="card-title">Quần vải nam</h5>
                            <p class="card-text">Đủ form dáng, chất lượng cao</p>
                            <a href="list.jsp" class="btn btn-sm btn-shop">Xem ngay</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    <%@ include file="footer.jsp" %>

</body>
</html>


