/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.*;
import java.util.List;
import Model.Order;
import Util.BDconnect;
import java.util.ArrayList;


public class OrderDAO {
    public int saveOrder(Order order) {
        String sql = "INSERT INTO orders (username, HoTen, SDT, DiaChi, paymentMethod, note, NgayDatHang, totalAmount, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = BDconnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

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
                ResultSet rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }

     public List<Order> getOrdersByUsername(String username) {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT * FROM orders WHERE username = ? ORDER BY NgayDatHang DESC";

        try (Connection conn = BDconnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Order order = new Order();
                int orderId = rs.getInt("orderID");

                order.setOrderID(orderId);
                order.setUsername(rs.getString("username"));
                order.setHoTen(rs.getString("HoTen"));
                order.setSDT(rs.getString("SDT"));
                order.setDiaChi(rs.getString("DiaChi"));
                order.setPaymentMethod(rs.getString("paymentMethod"));
                order.setNote(rs.getString("note"));
                order.setNgayDatHang(rs.getDate("NgayDatHang"));
                order.setTotalAmount(rs.getDouble("totalAmount"));
                order.setStatus(rs.getString("status"));

                // Lấy chi tiết đơn hàng
                OrderDetailDAO detailDAO = new OrderDetailDAO();
                order.setOrderDetails(detailDAO.getOrderDetailsByOrderId(orderId));

                orders.add(order);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return orders;
    }
public static String getEmailByOrderId(int orderID) {
    String email = null;
    String sql = "SELECT u.email FROM orders o JOIN user u ON o.username = u.username WHERE o.orderID = ?";
    try (Connection conn = BDconnect.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setInt(1, orderID);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            email = rs.getString("email");
            System.out.println("✅ Email lấy được: " + email);
        } else {
            System.out.println("⚠️ Không tìm thấy email cho orderID: " + orderID);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return email;
}

    public static List<Order> getAllOrders() {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT * FROM orders ORDER BY orderID DESC";

        try (Connection conn = BDconnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Order order = new Order();
                 int orderId = rs.getInt("orderID");
                order.setOrderID(rs.getInt("orderID"));
                order.setUsername(rs.getString("username"));
                order.setNgayDatHang(rs.getTimestamp("ngayDatHang"));
                order.setPaymentMethod(rs.getString("paymentMethod"));
                order.setStatus(rs.getString("status"));
                order.setTotalAmount(rs.getDouble("totalAmount"));
                orders.add(order);
                OrderDetailDAO detailDAO = new OrderDetailDAO();
                order.setOrderDetails(detailDAO.getOrderDetailsByOrderId(orderId));

   
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return orders;
    }

    public static void updateStatus(int orderID, String newStatus) {
        try (Connection conn = BDconnect.getConnection()) {
             conn.setAutoCommit(true);  
            String sql = "UPDATE orders SET status = ? WHERE orderID = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, newStatus);
            ps.setInt(2, orderID);
            int rowsAffected = ps.executeUpdate();
             System.out.println("Updated " + rowsAffected + " rows.");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static Order getOrderById(int orderId) {
    Order order = null;
    String sql = "SELECT * FROM orders WHERE orderID = ?";
    try (Connection conn = BDconnect.getConnection();
            
         PreparedStatement ps = conn.prepareStatement(sql)) {

        ps.setInt(1, orderId);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            order = new Order();
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
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return order;
}
}

