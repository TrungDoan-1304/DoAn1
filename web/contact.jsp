<%-- 
    Document   : contact
    Created on : 28 thg 6, 2025, 01:16:39
    Author     : Admin
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Liên hệ - Shop Quần Áo Nam</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background: url('media/anh1.jpg') no-repeat center center fixed;
      background-size: cover;
      font-family: 'Segoe UI', sans-serif;
      color: white;
    }

    .contact-box {
      background: rgba(0, 0, 0, 0.7);
      padding: 30px;
      border-radius: 12px;
      box-shadow: 0 10px 25px rgba(0, 0, 0, 0.8);
      backdrop-filter: blur(5px);
    }

    h2 {
      text-align: center;
      color: #00ffcc;
      font-weight: bold;
      margin-bottom: 30px;
    }

    .form-control {
      background-color: rgba(255,255,255,0.07);
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

    .info-box {
      background-color: rgba(255,255,255,0.05);
      padding: 20px;
      border-radius: 10px;
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
    }
  </style>
</head>
<body>
<%@ include file="navbar.jsp" %>
<div class="container py-5">
    <h2>Liên hệ với Shop Quần Áo Nam</h2>
  <div class="row row-cols-1 row-cols-md-2 g-4 mt-4">

    <!-- Form người dùng liên hệ -->
    <div class="col">
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
    <div class="col">
      <div class="contact-box info-box">
        <h4>📍 Thông tin cửa hàng</h4>
        <div class="info-item"><i class="bi bi-geo-alt-fill"></i> 24 Thanh Nhàn, Thanh Xuân, Hà Nội</div>
        <div class="info-item"><i class="bi bi-telephone-fill"></i> 0909 123 456</div>
        <div class="info-item"><i class="bi bi-envelope-fill"></i> shopquannaonam@gmail.com</div>
        <div class="info-item"><i class="bi bi-facebook"></i> <a href="https://facebook.com/shopnamchinhhang" target="_blank" style="color: #00e676;">facebook.com/shopnamchinhhang</a></div>
        <div class="info-item"><i class="bi bi-clock-fill"></i> Giờ mở cửa: 8h00 - 21h00 (T2 - CN)</div>
        <div class="mt-4">
          <iframe src="https://www.google.com/maps/embed?pb=!1m18!..." width="100%" height="250" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
        </div>
      </div>
    </div>

  </div>
</div>

<!-- Bootstrap Icons -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

 <%@ include file="footer.jsp" %>
</body>
</html>

