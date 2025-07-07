<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fc;
            font-family: 'Segoe UI', sans-serif;
        }
        .sidebar {
            background: linear-gradient(180deg, #4e73df 10%, #224abe 100%);
            min-height: 100vh;
            color: white;
        }
        .sidebar a {
            color: white;
            text-decoration: none;
            padding: 12px;
            display: block;
            transition: 0.2s;
        }
        .sidebar a:hover {
            background-color: rgba(255,255,255,0.1);
            border-left: 4px solid #fff;
        }
        .card-stats {
            border-left: 4px solid #4e73df;
            box-shadow: 0 0 15px rgba(0,0,0,0.05);
        }
    </style>
</head>
<body>
    
    <nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
  <div class="container-fluid">
    <a class="navbar-brand text-primary fw-bold" href="#">🛍️ Shop Quần Áo Nam</a>
    <div class="d-flex">
      <span class="me-3 mt-2 fw-semibold">Xin chào, Admin</span>
      <a href="login.jsp" class="btn btn-outline-danger">Đăng xuất</a>
    </div>
  </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <div class="col-md-2 sidebar">
            <h4 class="mt-4 ms-3"><i class="fas fa-user-shield"></i> Admin</h4>
            <a href="admin-dashboard.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
            <a href="admin-product.jsp"><i class="fas fa-tshirt"></i> Quản lý sản phẩm</a>
            <a href="admin-user.jsp"><i class="fas fa-users"></i> Quản lý người dùng</a>
            <a href="admin-order.jsp"><i class="fas fa-receipt"></i> Quản lý đơn hàng</a>
            <a href="login.jsp"><i class="fas fa-sign-out-alt"></i> Đăng xuất</a>
        </div>

        <!-- Main Content -->
        <div class="col-md-10 p-4">
            <h3 class="mb-4"><i class="fas fa-chart-line"></i> Dashboard</h3>
            <div class="row g-4">
                <div class="col-md-3">
                    <div class="card card-stats">
                        <div class="card-body">
                            <h5>Doanh thu tháng</h5>
                            <h3 class="text-primary">$40,000</h3>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card card-stats">
                        <div class="card-body">
                            <h5>Doanh thu năm</h5>
                            <h3 class="text-success">$215,000</h3>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card card-stats">
                        <div class="card-body">
                            <h5>Nhiệm vụ</h5>
                            <div class="progress">
                                <div class="progress-bar bg-info" style="width: 50%">50%</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card card-stats">
                        <div class="card-body">
                            <h5>Yêu cầu chờ xử lý</h5>
                            <h3 class="text-warning">18</h3>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Chart Placeholder -->
            <div class="card mt-4">
                <div class="card-header">
                    Biểu đồ doanh thu
                </div>
                <div class="card-body">
                    <img src="https://quickchart.io/chart?c={type:'line',data:{labels:['Jan','Feb','Mar','Apr'],datasets:[{label:'Doanh thu',data:[10000,20000,15000,30000]}]}}" class="img-fluid" alt="chart">
                </div>
            </div>
        </div>
    </div>
</div>

<!-- JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
