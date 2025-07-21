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
import java.util.Random;
/**
 *
 * @author PC
 */
public class CartDAO {
    private String generateCartID() {
    Random rand = new Random();
    int number = 100000 + rand.nextInt(900000); // Số ngẫu nhiên 6 chữ số
    return "GH" + number;
}
    public String getOrCreateCartIdByUsername(String username) throws SQLException {
    String cartId = null;

    try (Connection conn = BDconnect.getConnection()) {
        // Kiểm tra xem user đã có giỏ hàng chưa
        String checkSql = "SELECT CartID FROM carts WHERE username = ?";
        PreparedStatement checkStmt = conn.prepareStatement(checkSql);
        checkStmt.setString(1, username);
        ResultSet rs = checkStmt.executeQuery();

        if (rs.next()) {
            cartId = rs.getString("CartID");
        } else {
            // Tạo mã giỏ hàng mới
            cartId = generateCartID();

            // Chèn vào bảng carts
            String insertSql = "INSERT INTO carts (CartID, username) VALUES (?, ?)";
            PreparedStatement insertStmt = conn.prepareStatement(insertSql);
            insertStmt.setString(1, cartId);
            insertStmt.setString(2, username);
            insertStmt.executeUpdate();
        }
    }

    return cartId;
}
    public void addToCart(int productID, String productName, String size, int quantity, double price, String username) {
        try {
            String cartID = getOrCreateCartIdByUsername(username);  // Lấy cartID đúng
            addToCart(cartID, productID, productName, size, quantity, price, username);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Thêm sản phẩm vào bảng cart_items
    public void addToCart(String cartID, int productID, String productName, String size, int quantity, double price, String username) {
        try (Connection conn = BDconnect.getConnection()) {
            String checkSQL = "SELECT * FROM cart_items WHERE cartID = ? AND productID = ? AND size = ?";
            PreparedStatement checkStmt = conn.prepareStatement(checkSQL);
            checkStmt.setString(1, cartID);
            checkStmt.setInt(2, productID);
            checkStmt.setString(3, size);
            ResultSet rs = checkStmt.executeQuery();

            if (rs.next()) {
                String updateSQL = "UPDATE cart_items SET quantity = quantity + ? WHERE cartID = ? AND productID = ? AND size = ?";
                PreparedStatement updateStmt = conn.prepareStatement(updateSQL);
                updateStmt.setInt(1, quantity);
                updateStmt.setString(2, cartID);
                updateStmt.setInt(3, productID);
                updateStmt.setString(4, size);
                updateStmt.executeUpdate();
            } else {
                String insertSQL = "INSERT INTO cart_items (cartID, productID, productName, size, quantity, price, username) VALUES (?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement insertStmt = conn.prepareStatement(insertSQL);
                insertStmt.setString(1, cartID);
                insertStmt.setInt(2, productID);
                insertStmt.setString(3, productName);
                insertStmt.setString(4, size);
                insertStmt.setInt(5, quantity);
                insertStmt.setDouble(6, price);
                insertStmt.setString(7, username);
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
            String sql = "SELECT ci.* FROM cart_items ci JOIN carts c ON ci.cartID = c.cartID WHERE c.username = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                CartItem item = new CartItem();
                item.setProductID(rs.getInt("productID"));
                item.setSize(rs.getString("size"));
                item.setQuantity(rs.getInt("quantity"));
                item.setPrice(rs.getDouble("price"));
                item.setProductName(rs.getString("productName"));
                item.setCartID(rs.getString("cartID"));

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
            String sql = "UPDATE cart_items SET size = ?, quantity = ? WHERE cartID = (SELECT cartID FROM carts WHERE username = ?) AND productID = ? AND size = ?";
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
            String sql = "DELETE FROM cart_items WHERE cartID = (SELECT cartID FROM carts WHERE username = ?) AND productID = ? AND size = ?";
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
            String sql = "DELETE FROM cart_items WHERE cartID = (SELECT cartID FROM carts WHERE username = ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
