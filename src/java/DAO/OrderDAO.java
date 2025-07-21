/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.*;
import java.util.List;
import Model.CartItem;
import Model.Order;
import Util.BDconnect;


public class OrderDAO {
    public boolean saveOrder(Order order, List<CartItem> cartItems) {
        String insertOrderSQL = "INSERT INTO orders (username, HoTen, SDT, DiaChi, paymentMethod, note, NgayDatHang, totalAmount, status) " +
                                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = BDconnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(insertOrderSQL, Statement.RETURN_GENERATED_KEYS)) {

            ps.setString(1, order.getUsername());
            ps.setString(2, order.getHoTen());
            ps.setString(3, order.getSDT());
            ps.setString(4, order.getDiaChi());
            ps.setString(5, order.getPaymentMethod());
            ps.setString(6, order.getNote());
            ps.setDate(7, new java.sql.Date(order.getNgayDatHang().getTime()));
            ps.setDouble(8, order.getTotalAmount());
            ps.setString(9, order.getStatus());

            int rows = ps.executeUpdate();
            if (rows > 0) {
                ResultSet generatedKeys = ps.getGeneratedKeys();
                if (generatedKeys.next()) {
                    int orderId = generatedKeys.getInt(1);

                    // Lưu chi tiết đơn hàng
                    return saveOrderDetails(conn, orderId, cartItems);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // Lưu chi tiết đơn hàng vào bảng order_details
    private boolean saveOrderDetails(Connection conn, int orderId, List<CartItem> cartItems) {
        String sql = "INSERT INTO order_details (orderID, productID, size, quantity, price, productName) VALUES (?, ?, ?, ?, ?, ?)";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            for (CartItem item : cartItems) {
                ps.setInt(1, orderId);
                ps.setInt(2, item.getProductID());
                ps.setString(3, item.getSize());
                ps.setInt(4, item.getQuantity());
                ps.setDouble(5, item.getPrice());
                ps.setString(6, item.getProductName());
                ps.addBatch();
            }
            ps.executeBatch();
            return true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    // Lấy danh sách đơn hàng theo username
    public List<Order> getOrdersByUsername(String username) {
        List<Order> orders = new java.util.ArrayList<>();

        String sql = "SELECT * FROM orders WHERE username = ? ORDER BY NgayDatHang DESC";
        try (Connection conn = BDconnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Order order = new Order();
                order.setOrderID(rs.getInt("orderID"));
                order.setUsername(rs.getString("username"));
                order.setHoTen(rs.getString("HoTen"));
                order.setSDT(rs.getString("SDT"));
                order.setDiaChi(rs.getString("DiaChi"));
                order.setPaymentMethod(rs.getString("paymentMethod"));
                order.setNote(rs.getString("note"));
                order.setNgayDatHang(rs.getDate("NgayDatHang"));
                order.setTotalAmount(rs.getDouble("totalAmount"));
                order.setStatus(rs.getString("status"));

                orders.add(order);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return orders;
}
    public boolean updateOrderStatus(int orderID, String newStatus) {
    String sql = "UPDATE orders SET status = ? WHERE orderID = ?";
    try (Connection conn = BDconnect.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setString(1, newStatus);
        ps.setInt(2, orderID);
        return ps.executeUpdate() > 0;
    } catch (Exception e) {
        e.printStackTrace();
        return false;
    }
}
}
