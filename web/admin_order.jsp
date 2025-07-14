<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý đơn hàng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />
    <style>
        body {
            background-color: #f8f9fc;
            font-family: 'Segoe UI', sans-serif;
        }

        .container-box {
            max-width: 1200px;
            margin: 40px auto;
            background: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.05);
        }

        h3 {
            margin-bottom: 25px;
            font-weight: 600;
            color: #343a40;
        }

        .table th {
            background-color: #4e73df;
            color: white;
        }

        .btn-action {
            margin-right: 5px;
            margin-bottom: 5px;
        }

        .btn-primary:hover {
            background-color: #375ab7;
        }

        .btn-warning {
            color: #fff;
        }
    </style>
</head>
<body>

<div class="container container-box">
    <h3><i class="fas fa-receipt text-primary"></i> Quản lý đơn hàng</h3>

    <table class="table table-hover align-middle">
        <thead>
            <tr>
                <th>Mã Đơn</th>
                <th>Người dùng</th>
                <th>Ngày đặt</th>
                <th>Tổng tiền</th>
                <th>Trạng thái</th>
                <th>Thao tác</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>DH001</td>
                <td>cubin2k4</td>
                <td>11/07/2025</td>
                <td>850,000đ</td>
                <td><span class="badge bg-success">Đã giao</span></td>
                <td>
                    <button class="btn btn-sm btn-info btn-action" onclick="alert('Chi tiết đơn hàng DH001')">
                        <i class="fas fa-eye"></i> Xem
                    </button>
                    <button class="btn btn-sm btn-warning btn-action" onclick="alert('Gửi thông báo đến người dùng')">
                        <i class="fas fa-paper-plane"></i> Gửi thông báo
                    </button>
                    <button class="btn btn-sm btn-secondary btn-action" onclick="alert('Cập nhật trạng thái đơn hàng')">
                        <i class="fas fa-edit"></i> Cập nhật
                    </button>
                    <button class="btn btn-sm btn-danger btn-action" onclick="confirmDelete('DH001')">
                        <i class="fas fa-trash-alt"></i> Xóa
                    </button>
                </td>
            </tr>
            <tr>
                <td>DH002</td>
                <td>nam123</td>
                <td>10/07/2025</td>
                <td>420,000đ</td>
                <td><span class="badge bg-warning text-dark">Đang xử lý</span></td>
                <td>
                    <button class="btn btn-sm btn-info btn-action"><i class="fas fa-eye"></i> Xem</button>
                    <button class="btn btn-sm btn-warning btn-action"><i class="fas fa-paper-plane"></i> Gửi thông báo</button>
                    <button class="btn btn-sm btn-secondary btn-action"><i class="fas fa-edit"></i> Cập nhật</button>
                    <button class="btn btn-sm btn-danger btn-action" onclick="confirmDelete('DH002')"><i class="fas fa-trash-alt"></i> Xóa</button>
                </td>
            </tr>
            <!-- Thêm các đơn hàng khác tại đây -->
        </tbody>
    </table>
</div>

<!-- Xác nhận xóa -->
<script>
    function confirmDelete(orderId) {
        if (confirm("Bạn có chắc chắn muốn xóa đơn hàng " + orderId + " không?")) {
            alert("Đã xóa đơn hàng: " + orderId);
            // Thực hiện xóa ở đây
        }
    }
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
