<%-- 
    Document   : delete_product
    Created on : Jul 22, 2025, 11:40:42 PM
    Author     : PC
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Model.Product,DAO.ProductDAO" %>
<%
    int productID = Integer.parseInt(request.getParameter("productID"));
    ProductDAO dao = new ProductDAO();
    Product p = dao.getProductById(productID);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Xoá sản phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h3 class="text-danger">⚠️ Bạn có chắc chắn muốn xoá sản phẩm sau?</h3>
    <ul>
        <li><strong>Mã:</strong> <%= p.getProductID() %></li>
        <li><strong>Tên:</strong> <%= p.getProductName() %></li>
        <li><strong>Giá:</strong> <%= p.getGia() %> VNĐ</li>
    </ul>

    <a href="DeleteProductServlet?productID=<%= p.getProductID() %>" class="btn btn-danger">Xoá</a>
    <a href="AdminProductServlet" class="btn btn-secondary">Huỷ</a>
</div>
</body>
</html>
