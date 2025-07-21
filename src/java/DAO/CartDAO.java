/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.CartItem;
import java.util.List;
import java.sql.*;
import Util.BDconnect;
import java.util.ArrayList;
/**
 *
 * @author PC
 */
public class CartDAO {
     public int getOrCreateCartId(String username) {
        int cartId = -1;

        try (Connection conn = BDconnect.getConnection()) {
            String selectQuery = "SELECT MaGioHang FROM carts WHERE username = ?";
            PreparedStatement ps = conn.prepareStatement(selectQuery);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                cartId = rs.getInt("MaGioHang");
            } else {
                // Chưa có thì tạo mới
                String insertQuery = "INSERT INTO carts (username) VALUES (?)";
                PreparedStatement insertPs = conn.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
                insertPs.setString(1, username);
                insertPs.executeUpdate();

                ResultSet generatedKeys = insertPs.getGeneratedKeys();
                if (generatedKeys.next()) {
                    cartId = generatedKeys.getInt(1);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return cartId;
    }

    // Thêm sản phẩm vào giỏ hàng
    public void addToCart(String MaGioHang, int productID, String size, int quantity, double price, String tensanpham) {
        try (Connection conn = BDconnect.getConnection()) {
            // Kiểm tra sản phẩm đã tồn tại chưa
            String checkSQL = "SELECT * FROM cart_items WHERE MaGioHang = ? AND productID = ? AND size = ?";
            PreparedStatement checkStmt = conn.prepareStatement(checkSQL);
            checkStmt.setString(1, MaGioHang);
            checkStmt.setInt(2, productID);
            checkStmt.setString(3, size);
            ResultSet rs = checkStmt.executeQuery();

            if (rs.next()) {
                // Nếu đã có thì cập nhật số lượng
                String updateSQL = "UPDATE cart_items SET quantity = quantity + ? WHERE MaGioHang = ? AND productID = ? AND size = ?";
                PreparedStatement updateStmt = conn.prepareStatement(updateSQL);
                updateStmt.setInt(1, quantity);
                updateStmt.setString(1, MaGioHang);
                updateStmt.setInt(3, productID);
                updateStmt.setString(4, size);
                updateStmt.executeUpdate();
            } else {
                // Nếu chưa có thì thêm mới
                String insertSQL = "INSERT INTO cart_items (MaGioHang, productID, size, quantity, price, tensanpham) VALUES (?, ?, ?, ?, ?, ?)";
                PreparedStatement insertStmt = conn.prepareStatement(insertSQL);
                insertStmt.setString(1, MaGioHang);
                insertStmt.setInt(2, productID);
                insertStmt.setString(3, size);
                insertStmt.setInt(4, quantity);
                insertStmt.setDouble(5, price);
                insertStmt.setString(6, tensanpham);
                insertStmt.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Lấy danh sách sản phẩm trong giỏ hàng của người dùng
    public List<CartItem> getCartItems(String username) {
        List<CartItem> items = new ArrayList<>();

        try (Connection conn = BDconnect.getConnection()) {
            String sql = "SELECT ci.* FROM cart_items ci JOIN carts c ON ci.MaGioHang = c.MaGioHang WHERE c.username = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                CartItem item = new CartItem();
                item.setProductID(rs.getInt("productID"));
                item.setSize(rs.getString("size"));
                item.setQuantity(rs.getInt("quantity"));
                item.setPrice(rs.getDouble("price"));
                item.setTensanpham(rs.getString("tensanpham"));
                item.setMaGioHang(rs.getString("MaGioHang"));

                items.add(item);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return items;
    }

    // Cập nhật số lượng hoặc size sản phẩm trong giỏ
    public void updateCartItem(String username, int productID, String oldSize, String newSize, int quantity) {
        try (Connection conn = BDconnect.getConnection()) {
            String sql = "UPDATE cart_items SET size = ?, quantity = ? WHERE MaGioHang = (SELECT MaGioHang FROM carts WHERE username = ?) AND productID = ? AND size = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, newSize);
            ps.setInt(2, quantity);
            ps.setString(3, username);
            ps.setInt(4, productID);
            ps.setString(5, oldSize);

            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Xóa sản phẩm khỏi giỏ hàng
    public void removeCartItem(String username, int productID, String size) {
        try (Connection conn = BDconnect.getConnection()) {
            String sql = "DELETE FROM cart_items WHERE MaGioHang = (SELECT MaGioHang FROM carts WHERE username = ?) AND productID = ? AND size = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setInt(2, productID);
            ps.setString(3, size);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Xóa toàn bộ giỏ hàng sau khi đặt hàng
    public void clearCart(String username) {
        try (Connection conn = BDconnect.getConnection()) {
            String sql = "DELETE FROM cart_items WHERE MaGioHang = (SELECT MaGioHang FROM carts WHERE username = ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
