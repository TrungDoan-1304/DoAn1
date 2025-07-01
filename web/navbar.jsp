<%-- 
    Document   : navbar
    Created on : 28 thg 6, 2025, 01:22:33
    Author     : Admin
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Bootstrap + Icons -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

<!-- Navbar CSS -->
<style>
  .navbar-custom {
    background-color: rgba(0, 0, 0, 0.8);
    backdrop-filter: blur(10px);
    box-shadow: 0 2px 10px rgba(0,0,0,0.6);
    padding: 10px 30px;
  }

  .navbar-custom .navbar-brand {
    font-weight: bold;
    font-size: 24px;
    color: #00ffcc !important;
    transition: 0.3s;
  }

  .navbar-custom .nav-link {
    color: #ddd !important;
    font-size: 16px;
    margin-right: 15px;
    transition: 0.3s;
    position: relative;
  }

  .navbar-custom .nav-link:hover,
  .navbar-custom .nav-link.active {
    color: #00e676 !important;
  }

  .navbar-custom .nav-link::after {
    content: '';
    position: absolute;
    bottom: 0;
    left: 0;
    width: 0%;
    height: 2px;
    background-color: #00e676;
    transition: 0.4s ease-in-out;
  }

  .navbar-custom .nav-link:hover::after,
  .navbar-custom .nav-link.active::after {
    width: 100%;
  }

  @media (max-width: 768px) {
    .navbar-custom .navbar-nav {
      background-color: rgba(0, 0, 0, 0.9);
      padding: 15px;
      border-radius: 10px;
    }
  }
</style>

<!-- Navbar HTML -->
<nav class="navbar navbar-expand-lg navbar-dark navbar-custom fixed-top">
  <div class="container-fluid">
    <a class="navbar-brand" href="Home.jsp">
      <i class="bi bi-shop-window"></i> Shop Quần Áo Nam
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mainNavbar">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse justify-content-end" id="mainNavbar">
      <ul class="navbar-nav">
        <li class="nav-item"><a class="nav-link" href="Home.jsp">Trang chủ</a></li>
        <li class="nav-item"><a class="nav-link" href="list.jsp">Sản phẩm</a></li>
        <li class="nav-item"><a class="nav-link" href="collection.jsp">Bộ sưu tập</a></li>
        <li class="nav-item"><a class="nav-link" href="contact.jsp">Liên hệ</a></li>
        <li class="nav-item"><a class="nav-link" href="login.jsp"><i class="bi bi-box-arrow-in-right"></i> Đăng nhập</a></li>
      </ul>
    </div>
  </div>
</nav>

<!-- Khoảng đệm dưới navbar -->
<div style="height: 70px;"></div>

