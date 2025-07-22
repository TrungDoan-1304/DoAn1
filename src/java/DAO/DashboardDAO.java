/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

/**
 *
 * @author PC
 */
import Util.BDconnect;
import java.sql.*;
import java.util.*;

public class DashboardDAO {
    private Connection conn;

    public DashboardDAO() {
        try {
            conn = BDconnect.getConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public double getMonthlyRevenue() {
    double total = 0.0;
    try {
        String sql = "SELECT SUM(totalAmount) FROM orders " +
                     "WHERE MONTH(NgayDatHang) = MONTH(CURDATE()) " +
                     "AND YEAR(NgayDatHang) = YEAR(CURDATE())";
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            total = rs.getDouble(1);
            if (rs.wasNull()) {
                total = 0.0;
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return total;
    }

    public double getYearlyRevenue() {
        double total = 0;
        try {
            String sql = "SELECT SUM(totalAmount) FROM orders " +
                         "WHERE YEAR(NgayDatHang) = YEAR(CURDATE())";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) total =  rs.getDouble(1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return total;
    }

    public int getPendingOrders() {
        int count = 0;
        try {
            String sql = "SELECT COUNT(*) FROM orders WHERE status = 'Chưa thanh toán'";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) count = rs.getInt(1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

public List<Double> getWeeklyRevenueData() {
    List<Double> data = new ArrayList<>(Collections.nCopies(7, 0.0));
    try {
        String sql = "SELECT DAYOFWEEK(NgayDatHang) as day, SUM(totalAmount) as revenue " +
                     "FROM orders " +
                     "WHERE YEARWEEK(NgayDatHang, 1) = YEARWEEK(CURDATE(), 1) " +
                     "GROUP BY day";
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            int dayIndex = rs.getInt("day") - 1; // DAYOFWEEK: 1=Sunday -> index 0
            double revenue = rs.getDouble("revenue");
            if (rs.wasNull()) revenue = 0.0;

            if (dayIndex >= 0 && dayIndex < 7) {
                data.set(dayIndex, revenue);
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return data;
    }
}
