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
      object-fit: cover;
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
      font-size: 28px;
      font-weight: bold;
      text-align: center;
      margin-bottom: 30px;
      color: white;
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
    <h2 class="section-title"> Danh sách các sản phẩm</h2>
    <div class="row" id="productList">
      <!-- Áo -->
      <div class="col-md-4 mb-4 product-item ao">
        <div class="card product-card">
          <img src="img/ao1.jpg" alt="Áo 1">
          <div class="card-body">
            <div class="product-title">Áo thun basic</div>
            <div class="product-price">250.000đ</div>
          </div>
        </div>
      </div>

      <!-- Quần -->
      <div class="col-md-4 mb-4 product-item quan">
        <div class="card product-card">
          <img src="img/quan1.jpg" alt="Quần short">
          <div class="card-body">
            <div class="product-title">Quần short đen</div>
            <div class="product-price">320.000đ</div>
          </div>
        </div>
      </div>

      <!-- Phụ kiện -->
      <div class="col-md-4 mb-4 product-item pk">
        <div class="card product-card">
          <img src="img/phukien1.jpg" alt="Mũ lưỡi trai">
          <div class="card-body">
            <div class="product-title">Mũ lưỡi trai</div>
            <div class="product-price">150.000đ</div>
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


