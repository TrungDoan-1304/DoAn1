<%-- 
    Document   : collection
    Created on : 28 thg 6, 2025, 00:26:05
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
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', sans-serif;
        }
        
        .overlay {
            background-color: rgba(0, 0, 0, 0.5); /* lớp phủ tối mờ */
            height: 100vh;
            padding: 40px 20px;
        }

        .collection-title {
            font-size: 2.5rem;
            font-weight: bold;
            margin-bottom: 40px;
        }
        .collection-card {
            background-color: #1f1f1f;
            border: none;
            border-radius: 16px;
            overflow: hidden;
            transition: transform 0.3s ease;
        }
        .collection-card:hover {
            transform: scale(1.03);
        }
        .collection-card img {
            height: 280px;
            object-fit: cover;
        }
        .collection-card .card-body {
            padding: 20px;
        }
        .collection-card h5 {
            font-weight: bold;
        }
    </style>
</head>
<body>
    <%@ include file="navbar.jsp" %>
    <div class="overlay text-center">
        <h1 class="collection-title">BỘ SƯU TẬP MỚI NHẤT</h1>

        <div class="container">
            <div class="row g-4 justify-content-center">

                <!-- Bộ sưu tập 1 -->
                <div class="col-md-4">
                    <div class="card collection-card shadow">
                        <img src="media/bo1.jpg" class="card-img-top" alt="Summer Style">
                        <div class="card-body">
                            <h5>Summer Style</h5>
                            <p>Phong cách mát mẻ cho mùa hè với áo phông, quần shorts và chất liệu cotton thoáng mát.</p>
                        </div>
                    </div>
                </div>

                <!-- Bộ sưu tập 2 -->
                <div class="col-md-4">
                    <div class="card collection-card shadow">
                        <img src="media/bo2.jpg" class="card-img-top" alt="Streetwear Nam">
                        <div class="card-body">
                            <h5>Streetwear Nam</h5>
                            <p>Cá tính và nổi bật với hoodie, quần jogger, graphic tee đúng chất đường phố.</p>
                        </div>
                    </div>
                </div>

                <!-- Bộ sưu tập 3 -->
                <div class="col-md-4">
                    <div class="card collection-card shadow">
                        <img src="media/bo3.jpg" class="card-img-top" alt="Office Look">
                        <div class="card-body">
                            <h5>Office Look</h5>
                            <p>Lịch lãm, tinh tế với sơ mi, quần tây và blazer cho môi trường công sở hiện đại.</p>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
     <%@ include file="footer.jsp" %>
</body>
</html>

