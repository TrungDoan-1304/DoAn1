<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

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

            .chart-container {
                background: white;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0 4px 12px rgba(0,0,0,0.05);
            }
        </style>
    </head>
    <body>

        <nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
            <div class="container-fluid">
                <a class="navbar-brand text-primary fw-bold" href="#">🛍️ Shop Quần Áo Nam</a>
                <div class="d-flex">
                    <span class="me-3 mt-2 fw-semibold">Xin chào, Admin</span>
                    <a href="logout.jsp" class="btn btn-outline-danger">Đăng xuất</a>
                </div>
            </div>
        </nav>

        <div class="container-fluid">
            <div class="row">
                <!-- Sidebar -->
                <div class="col-md-2 sidebar">
                    <h4 class="mt-4 ms-3"><i class="fas fa-user-shield"></i> Admin</h4>
                    <a href="admin.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
                    <a href="admin_product.jsp"><i class="fas fa-tshirt"></i> Quản lý sản phẩm</a>
                    <a href="admin_user.jsp"><i class="fas fa-users"></i> Quản lý người dùng</a>
                    <a href="admin_order.jsp"><i class="fas fa-receipt"></i> Quản lý đơn hàng</a>
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
                            <div class="chart-container">
                                <canvas id="orderChart" height="120"></canvas>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>

        <script>
            const ctx = document.getElementById('orderChart').getContext('2d');
            const orderChart = new Chart(ctx, {
                type: 'line',
                data: {
                    labels: ['T2', 'T3', 'T4', 'T5', 'T6', 'T7', 'CN'],
                    datasets: [{
                            label: 'Đơn hàng trong tuần',
                            data: [12, 19, 3, 5, 2, 7, 14],
                            fill: true,
                            backgroundColor: 'rgba(9, 132, 227, 0.15)',
                            borderColor: '#0984e3',
                            borderWidth: 3,
                            tension: 0.5,
                            pointBackgroundColor: '#0984e3',
                            pointRadius: 5,
                            pointHoverRadius: 7
                        }]
                },
                options: {
                    responsive: true,
                    plugins: {
                        legend: {
                            display: true,
                            position: 'top',
                            labels: {
                                font: {
                                    size: 14
                                }
                            }
                        },
                        tooltip: {
                            backgroundColor: '#2f3640',
                            titleColor: '#ffffff',
                            bodyColor: '#dcdde1',
                            borderColor: '#00cec9',
                            borderWidth: 1
                        }
                    },
                    scales: {
                        y: {
                            beginAtZero: true,
                            ticks: {
                                color: '#2f3640',
                                font: {
                                    size: 13
                                }
                            }
                        },
                        x: {
                            ticks: {
                                color: '#2f3640',
                                font: {
                                    size: 13
                                }
                            }
                        }
                    }
                }
            });

        </script>

        <!-- JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
