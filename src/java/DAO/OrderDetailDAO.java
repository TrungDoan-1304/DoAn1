/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

/**
 *
 * @author PC
 */
import Model.CartItem;
import Model.OrderDetail;
import Util.BDconnect;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderDetailDAO {

public boolean saveOrderDetails(int orderID, String username, List<CartItem> cartItems) {
    String sql = "INSERT INTO order_details (orderID, username, productID, productName, size, quantity, price, totalAmount) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

    try (Connection conn = BDconnect.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {

        for (CartItem item : cartItems) {
            ps.setInt(1, orderID);
            ps.setString(2, username); // 👈 Truyền username từ ngoài vào
            ps.setInt(3, item.getProductID());
            ps.setString(4, item.getProductName());
            ps.setString(5, item.getSize());
            ps.setInt(6, item.getQuantity());
            ps.setDouble(7, item.getPrice());
            ps.setDouble(8, item.getTotalAmount());
            ps.addBatch();
        }

        ps.executeBatch();
        return true;

    } catch (Exception e) {
        e.printStackTrace();
        return false;
    }
}

    public static List<OrderDetail> getOrderDetailsByOrderId(int orderID) {
        List<OrderDetail> list = new ArrayList<>();
        String sql = "SELECT * FROM order_details WHERE orderID = ?";

        try (Connection conn = BDconnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, orderID);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                OrderDetail detail = new OrderDetail();
                detail.setOrderID(rs.getInt("orderID"));
                detail.setUsername(rs.getString("username"));
                detail.setProductID(rs.getInt("productID"));
                detail.setProductName(rs.getString("productName"));
                detail.setSize(rs.getString("size"));
                detail.setQuantity(rs.getInt("quantity"));
                detail.setPrice(rs.getDouble("price"));
                detail.setTotalAmount(rs.getDouble("totalAmount"));

                list.add(detail);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // Có thể mở rộng thêm các chức năng: cập nhật, xóa, lọc theo username, sản phẩm, v.v.
}
