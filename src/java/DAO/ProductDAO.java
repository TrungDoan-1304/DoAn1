package DAO;

import Model.Product;
import Util.BDconnect;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {

    // Lấy danh sách tất cả sản phẩm
    public List<Product> getAllProducts() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM product";
        System.out.println(">>> Bắt đầu getAllProducts()");
        System.out.println(">>> SQL: " + sql);

        try (Connection conn = BDconnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Product product = new Product();
                product.setProductID(rs.getInt("productID"));
                product.setProductName(rs.getString("productName"));
                product.setHinhanh(rs.getString("hinhanh"));
                product.setGia(rs.getInt("gia"));
                product.setSltrongkho(rs.getInt("sltrongkho"));
                product.setNgaythem(rs.getDate("ngaythem"));
                list.add(product);
            }
            System.out.println(">>> Số lượng sản phẩm lấy được = " + list.size());
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // Lấy 1 sản phẩm theo ID
    public Product getProductById(int productID) {
        String sql = "SELECT * FROM product WHERE productID = ?";
        try (Connection conn = BDconnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, productID);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Product product = new Product();
                product.setProductID(rs.getInt("productID"));
                product.setProductName(rs.getString("productName"));
                product.setHinhanh(rs.getString("hinhanh"));
                product.setGia(rs.getInt("gia"));
                product.setSltrongkho(rs.getInt("sltrongkho"));
                product.setNgaythem(rs.getDate("ngaythem"));
                return product;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    // Thêm sản phẩm mới
    public void addProduct(Product p) {
        String sql = "INSERT INTO product (productName, hinhanh, gia, sltrongkho, ngaythem) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = BDconnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, p.getProductName());
            ps.setString(2, p.getHinhanh());
            ps.setInt(3, p.getGia());
            ps.setInt(4, p.getSltrongkho());
            ps.setDate(5, new java.sql.Date(p.getNgaythem().getTime()));
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Cập nhật sản phẩm (giá và số lượng)
    public void updateProduct(Product p) {
        String sql = "UPDATE product SET gia = ?, sltrongkho = ? WHERE productID = ?";
        try (Connection conn = BDconnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, p.getGia());
            ps.setInt(2, p.getSltrongkho());
            ps.setInt(3, p.getProductID());
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Tự động trừ tồn kho dựa trên đơn hàng
    public void updateInventoryBasedOnOrders() {
        String sql = """
            UPDATE product p
            SET p.sltrongkho = (
                SELECT p2.sltrongkho - IFNULL(SUM(od.quantity), 0)
                FROM product p2
                LEFT JOIN order_details od ON p2.productID = od.productID
                WHERE p2.productID = p.productID
                GROUP BY p2.sltrongkho
            );
        """;

        try (Connection conn = BDconnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public void deleteProduct(int productID) {
    String sql = "DELETE FROM product WHERE productID = ?";
    try (Connection conn = BDconnect.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setInt(1, productID);
        ps.executeUpdate();
    } catch (Exception e) {
        e.printStackTrace();
    }
}
}