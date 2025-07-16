/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import Model.Product;
import Util.BDconnect;
/**
 *
 * @author PC
 */
public class ProductDAO {
   
    public List<Product> getAllProducts() {
    List<Product> list = new ArrayList<>();
    String sql = "SELECT * FROM product";

    try (Connection conn = BDconnect.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql);
         ResultSet rs = ps.executeQuery()) {

        while (rs.next()) {
            Product product = new Product();
            product.setProductID(rs.getInt("productID"));
            product.setTensanpham(rs.getString("tensanpham"));
            product.setHinhanh(rs.getString("hinh anh"));
            product.setGia(rs.getInt("gia"));
           
            list.add(product);
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return list;
}
    
    public Product getProductById(int productID) {
    String sql = "SELECT * FROM product WHERE productID = ?";
    try (Connection conn = BDconnect.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setInt(1, productID);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            return new Product(
                rs.getInt("productID"),
                rs.getString("tensanpham"),
                rs.getString("hinhanh"),
                rs.getInt("gia")
            );
        }
}catch (Exception e) {
        e.printStackTrace();
    }
    return null;
}
}