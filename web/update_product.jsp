<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Model.Product" %>
<%
    Product p = (Product) request.getAttribute("product");
    if (p == null) {
        response.sendRedirect("AdminProductServlet");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cập nhật sản phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="mb-4">Cập nhật sản phẩm</h2>
    <form action="UpdateProductServlet" method="post">
        <input type="hidden" name="productID" value="<%= p.getProductID() %>">
        
        <div class="mb-3">
            <label class="form-label">Tên sản phẩm</label>
            <input type="text" class="form-control" value="<%= p.getProductName() %>" readonly>
        </div>

        <div class="mb-3">
            <label class="form-label">Giá</label>
            <input type="number" class="form-control" name="gia" value="<%= p.getGia() %>" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Số lượng trong kho</label>
            <input type="number" class="form-control" name="sltrongkho" value="<%= p.getSltrongkho() %>" required>
        </div>

        <button type="submit" class="btn btn-primary">Cập nhật</button>
        <a href="AdminProductServlet" class="btn btn-secondary">Quay lại</a>
    </form>
</div>
</body>
</html>