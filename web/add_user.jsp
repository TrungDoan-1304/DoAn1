<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Thêm người dùng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />
    <style>
        body {
            background-color: #eef2f7;
            font-family: 'Segoe UI', sans-serif;
        }

        .form-container {
            max-width: 600px;
            margin: 50px auto;
            background-color: #ffffff;
            border-radius: 16px;
            padding: 40px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.08);
        }

        h3 {
            text-align: center;
            color: #343a40;
            margin-bottom: 30px;
            font-weight: 600;
        }

        .form-label {
            font-weight: 500;
        }

        .btn-primary {
            background: linear-gradient(135deg, #4e73df, #224abe);
            border: none;
            font-weight: 500;
            padding: 10px 25px;
            border-radius: 8px;
            transition: 0.3s;
        }

        .btn-primary:hover {
            background: linear-gradient(135deg, #224abe, #4e73df);
        }

        .btn-back {
            color: #555;
            margin-bottom: 20px;
            display: inline-block;
            text-decoration: none;
        }

        .btn-back i {
            margin-right: 6px;
        }

        select, input {
            border-radius: 8px !important;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="form-container">
        <a href="admin_user.jsp" class="btn-back"><i class="fas fa-arrow-left"></i> Quay lại danh sách</a>

        <h3><i class="fas fa-user-plus text-primary"></i> Thêm người dùng mới</h3>

        <form action="AddUserServlet" method="post">
            <div class="mb-3">
                <label for="username" class="form-label">Tên đăng nhập</label>
                <input type="text" class="form-control" id="username" name="username" placeholder="nhập tên đăng nhập" required />
            </div>

            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control" id="email" name="email" placeholder="example@gmail.com" required />
            </div>

            <div class="mb-3">
                <label for="password" class="form-label">Mật khẩu</label>
                <input type="password" class="form-control" id="password" name="password" placeholder="Nhập mật khẩu..." required />
            </div>

            <div class="mb-3">
                <label for="role" class="form-label">Vai trò</label>
                <select class="form-select" id="role" name="role" required>
                    <option value="user">Khách hàng</option>
                    <option value="admin">Quản trị viên</option>
                </select>
            </div>

            <div class="mb-4">
                <label for="status" class="form-label">Trạng thái</label>
                <select class="form-select" id="status" name="status" required>
                    <option value="active">Hoạt động</option>
                    <option value="blocked">Bị khóa</option>
                </select>
            </div>

            <div class="text-center">
                <button type="submit" class="btn btn-primary">
                    <i class="fas fa-check-circle"></i> Thêm người dùng
                </button>
            </div>
        </form>
    </div>
</div>

<!-- JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
