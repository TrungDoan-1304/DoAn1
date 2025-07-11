/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.*;
import java.util.*;
import Model.DonHang;
import Util.BDconnect;

/**
 *
 * @author LTuan
 */
public class DonHangDAO {
    // Lấy danh sách tất cả đơn hàng

    public List<DonHang> getAllDonHang() {
        List<DonHang> list = new ArrayList<>();
        String sql = "SELECT * FROM donhang";
        try (Connection conn = BDconnect.getConnection(); PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                DonHang dh = new DonHang();
                dh.setMaDonHang(rs.getInt("MaDonHang"));
                dh.setUserId(rs.getInt("userId"));
                dh.setNgayDatHang(rs.getDate("NgayDatHang"));
                dh.setTongTienDH(rs.getDouble("TongTienDH"));
                dh.setTrangThaiDH(rs.getString("TrangThaiDH"));
                list.add(dh);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

// Thêm đơn hàng
    public boolean insertDonHang(DonHang dh) {
        String sql = "INSERT INTO donhang(MaDonHang, userId, NgayDatHang, TongTienDH, TrangThaiDH) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = BDconnect.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, dh.getMaDonHang());
            ps.setInt(2, dh.getUserId());
            ps.setDate(3, new java.sql.Date(dh.getNgayDatHang().getTime()));
            ps.setDouble(4, dh.getTongTienDH());
            ps.setString(5, dh.getTrangThaiDH());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

// Sửa đơn hàng
    public boolean updateDonHang(DonHang dh) {
        String sql = "UPDATE donhang SET userId=?, NgayDatHang=?, TongTienDH=?, TrangThaiDH=? WHERE MaDonHang=?";
        try (Connection conn = BDconnect.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, dh.getUserId());
            ps.setDate(2, new java.sql.Date(dh.getNgayDatHang().getTime()));
            ps.setDouble(3, dh.getTongTienDH());
            ps.setString(4, dh.getTrangThaiDH());
            ps.setInt(5, dh.getMaDonHang());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

// Xóa đơn hàng theo mã
    public boolean deleteDonHang(int maDonHang) {
        String sql = "DELETE FROM donhang WHERE MaDonHang=?";
        try (Connection conn = BDconnect.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, maDonHang);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

// Tìm đơn hàng theo mã
    public DonHang getDonHangById(int maDonHang) {
        String sql = "SELECT * FROM donhang WHERE MaDonHang=?";
        try (Connection conn = BDconnect.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, maDonHang);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                DonHang dh = new DonHang();
                dh.setMaDonHang(rs.getInt("MaDonHang"));
                dh.setUserId(rs.getInt("userId"));
                dh.setNgayDatHang(rs.getDate("NgayDatHang"));
                dh.setTongTienDH(rs.getDouble("TongTienDH"));
                dh.setTrangThaiDH(rs.getString("TrangThaiDH"));
                return dh;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

}
