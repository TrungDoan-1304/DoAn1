<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson" %>
<%
    double revenueMonth = (request.getAttribute("revenueMonth") != null) ? (double) request.getAttribute("revenueMonth") : 0;
    double revenueYear = (request.getAttribute("revenueYear") != null) ? (double) request.getAttribute("revenueYear") : 0;
    int pendingRequests = (request.getAttribute("pendingRequests") != null) ? (int) request.getAttribute("pendingRequests") : 0;
   List<Double> weeklyData = (List<Double>) request.getAttribute("weeklyData");
    if (weeklyData == null) weeklyData = Arrays.asList(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
    String weeklyDataJson = new Gson().toJson(weeklyData);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
        .chart-container {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.05);
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
    <div class="container-fluid">
        <a class="navbar-brand text-primary fw-bold" href="#">🛍️ Shop Quần Áo Nam</a>
        <div class="d-flex">
            <span class="me-3 mt-2 fw-semibold">Xin chào, Admin</span>
            <a href="logout.jsp" class="btn btn-outline-danger">Đăng xuất</a>
        </div>
    </div>
</nav>

<!-- Layout -->
<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <div class="col-md-2 sidebar">
            <h4 class="mt-4 ms-3"><i class="fas fa-user-shield"></i> Admin</h4>
            <a href="AdminDashboardServlet"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
            <a href="AdminProductServlet"><i class="fas fa-tshirt"></i> Quản lý sản phẩm</a>
            <a href="AdminUserServlet"><i class="fas fa-users"></i> Quản lý người dùng</a>
            <a href="AdminOrderServlet"><i class="fas fa-receipt"></i> Quản lý đơn hàng</a>
            <a href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Đăng xuất</a>
        </div>

        <!-- Main Content -->
        <div class="col-md-10 p-4">
            <h3 class="mb-4"><i class="fas fa-chart-line"></i> Dashboard</h3>
            <div class="row g-4">
                <div class="col-md-3">
                    <div class="card card-stats">
                        <div class="card-body">
                            <h5>Doanh thu tháng</h5>
                            <h3 class="text-primary"><%= String.format("%,.0f", revenueMonth) %> VNĐ</h3>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card card-stats">
                        <div class="card-body">
                            <h5>Doanh thu năm</h5>
                            <h3 class="text-success"><%= String.format("%,.0f", revenueYear) %> VNĐ</h3>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card card-stats">
                        <div class="card-body">
                            <h5>Yêu cầu chờ xử lý</h5>
                            <h3 class="text-warning"><%= pendingRequests %></h3>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Chart -->
            <div class="card mt-4">
                <div class="card-header">
                    Biểu đồ doanh thu theo tuần
                </div>
                <div class="chart-container">
                    <canvas id="orderChart" height="120"></canvas>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Chart JS -->
<script>
    const weeklyRevenue = <%= weeklyDataJson %>;
    const ctx = document.getElementById('orderChart').getContext('2d');
    const orderChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: ['CN', 'T2', 'T3', 'T4', 'T5', 'T6', 'T7'],
            datasets: [{
                label: 'Doanh thu theo ngày (VNĐ)',
                data: weeklyRevenue,
                fill: true,
                backgroundColor: 'rgba(9, 132, 227, 0.15)',
                borderColor: '#0984e3',
                borderWidth: 3,
                tension: 0.5
            }]
        },
        options: {
            responsive: true
        }
    });
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>