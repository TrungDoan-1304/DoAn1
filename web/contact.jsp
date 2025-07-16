<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Liên hệ - Shop Quần Áo Nam</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            background: url('media/anh1.jpg') no-repeat center center fixed;
            background-size: cover;
            font-family: 'Segoe UI', sans-serif;
            color: white;
        }

        .contact-box,
        .info-box {
            background: rgba(0, 0, 0, 0.6);
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.8);
            backdrop-filter: blur(5px);
            color: white;
            height: 100%;
        }

        .info-box {
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        h2 {
    font-size: 60px;
    font-weight: bold;
    color: #ffffff;
    text-align: center;
    text-shadow: 4px 4px 8px rgba(0, 0, 0, 0.8);
    padding: 15px 20px;
    display: inline-block;
    margin: 0 auto;
}



        .form-label, .info-box h4 {
            text-shadow: 1px 1px 3px black;
        }

        .form-control {
            background-color: rgba(255, 255, 255, 0.07);
            color: white;
            border: 1px solid #555;
        }

        .form-control::placeholder {
            color: #bbb;
        }

        .btn-submit {
            background-color: #00cc66;
            border: none;
            font-weight: bold;
        }

        .btn-submit:hover {
            background-color: #00b359;
        }

        .info-item {
            margin-bottom: 15px;
        }

        .info-item i {
            margin-right: 8px;
            color: #00e676;
        }

        @media (max-width: 768px) {
            .row-cols-md-2 > div {
                margin-bottom: 30px;
            }

            h2 {
                font-size: 28px;
            }
        }
    </style>
</head>
<body>
<%@ include file="navbar.jsp" %>
<div class="container py-5 text-center">
    <h2>LIÊN HỆ VỚI SHOP QUẦN ÁO NAM</h2>

    <div class="row row-cols-1 row-cols-md-2 g-4 mt-4 text-start align-items-stretch">

        <!-- Form người dùng liên hệ -->
        <div class="col h-100">
            <div class="contact-box">
                <form action="LienHeServlet" method="post">
                    <div class="mb-3">
                        <label for="name" class="form-label">Họ và tên</label>
                        <input type="text" class="form-control" id="name" name="name" placeholder="Nhập họ tên..." required>
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label">Email liên hệ</label>
                        <input type="email" class="form-control" id="email" name="email" placeholder="abc@example.com" required>
                    </div>
                    <div class="mb-3">
                        <label for="subject" class="form-label">Chủ đề</label>
                        <input type="text" class="form-control" id="subject" name="subject" placeholder="Nhập chủ đề..." required>
                    </div>
                    <div class="mb-3">
                        <label for="message" class="form-label">Nội dung</label>
                        <textarea class="form-control" id="message" name="message" rows="5" placeholder="Nội dung tin nhắn..." required></textarea>
                    </div>
                    <div class="d-grid">
                        <button type="submit" class="btn btn-submit btn-lg">Gửi liên hệ</button>
                    </div>
                </form>
            </div>
        </div>

        <!-- Thông tin cửa hàng -->
        <div class="col h-100">
            <div class="info-box">
                <h4><i class="bi bi-geo-alt-fill"></i> Thông tin cửa hàng</h4>
                <div class="info-item"><i class="bi bi-geo-alt-fill"></i> 218 Lĩnh Nam, Hoàng Mai, Hà Nội</div>
                <div class="info-item"><i class="bi bi-telephone-fill"></i> 0987 123 456</div>
                <div class="info-item"><i class="bi bi-envelope-fill"></i> shopquannaonam@gmail.com</div>
                <div class="info-item"><i class="bi bi-facebook"></i>
                    <a href="https://facebook.com/shopnamchinhhang" target="_blank" style="color: #00e676;">facebook.com/shopnamchinhhang</a>
                </div>
                <div class="info-item"><i class="bi bi-clock-fill"></i> Giờ mở cửa: 8h00 - 21h00 (T2 - CN)</div>
            </div>
        </div>

    </div>
</div>

<%@ include file="footer.jsp" %>
</body>
</html>
