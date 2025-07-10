/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;
import java.sql.*;
import java.util.*;
import Model.*;
import Util.BDconnect;
/**
 *
 * @author PC
 */
public class DatHangDAO {
    // Thêm đơn hàng và chi tiết đơn hàng
public int taoDonHang(DonHang dh, List<ChiTietDonHang> chiTietList) {
    String sqlDonHang = "INSERT INTO donhang (userId, NgayDatHang, TongTienDH, TrangThaiDH) VALUES (?, ?, ?, ?)";
    String sqlChiTietDonHang = "INSERT INTO chitietdonhang (MaDonHang, MaSP, SLDaMua, GiaBan) VALUES (?, ?, ?, ?)";
    int MaDonHang = -1;

    try (Connection conn = BDconnect.getConnection()) {
        conn.setAutoCommit(false); // Bắt đầu transaction

        // Thêm vào bảng donhang
        try (PreparedStatement ps = conn.prepareStatement(sqlDonHang, Statement.RETURN_GENERATED_KEYS)) {
            ps.setInt(1, dh.getUserId());
            ps.setDate(2, new java.sql.Date(dh.getNgayDatHang().getTime()));
            ps.setDouble(3, dh.getTongTienDH());
            ps.setString(4, dh.getTrangThaiDH());
            ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                MaDonHang = rs.getInt(1);
            }
        }

        // Thêm vào bảng chitietdonhang
        try (PreparedStatement ps2 = conn.prepareStatement(sqlChiTietDonHang)) {
            for (ChiTietDonHang ct : chiTietList) {
                ps2.setInt(1, MaDonHang);
                ps2.setInt(2, ct.getMaSP());
                ps2.setInt(3, ct.getSLDaMua());
                ps2.setDouble(4, ct.getGiaBan());
                ps2.addBatch();
            }
            ps2.executeBatch();
        }

        conn.commit(); // Hoàn thành transaction
    } catch (Exception e) {
        e.printStackTrace();
    }

    return MaDonHang;
}

// Lấy danh sách đơn hàng của một user
public List<DonHang> getDonHangByUser(int userId) {
    List<DonHang> list = new ArrayList<>();
    String sql = "SELECT * FROM donhang WHERE userId = ? ORDER BY MaDonHang DESC";

    try (Connection conn = BDconnect.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setInt(1, userId);
        ResultSet rs = ps.executeQuery();

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

// Lấy chi tiết đơn hàng
public List<ChiTietDonHang> getChiTietDonHang(int maDonHang) {
    List<ChiTietDonHang> list = new ArrayList<>();
    String sql = "SELECT * FROM chitietdonhang WHERE MaDonHang = ?";

    try (Connection conn = BDconnect.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setInt(1, maDonHang);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            ChiTietDonHang ct = new ChiTietDonHang();
            ct.setMaDonHang(rs.getInt("MaDonHang"));
            ct.setMaSP(rs.getInt("MaSP"));
            ct.setSLDaMua(rs.getInt("SLDaMua"));
            ct.setGiaBan(rs.getDouble("GiaBan"));
            list.add(ct);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }

    return list;
}

// Cập nhật trạng thái đơn hàng
public boolean capNhatTrangThai(int maDonHang, String trangThaiMoi) {
    String sql = "UPDATE donhang SET TrangThaiDH=? WHERE MaDonHang=?";
    try (Connection conn = BDconnect.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setString(1, trangThaiMoi);
        ps.setInt(2, maDonHang);
        return ps.executeUpdate() > 0;
    } catch (Exception e) {
        e.printStackTrace();
    }
    return false;
}

}
