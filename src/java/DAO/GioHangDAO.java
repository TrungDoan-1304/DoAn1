/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;
import java.sql.*;
import java.util.*;
import Model.GioHang;
import Util.BDconnect;
/**
 *
 * @author LTuan
 */
public class GioHangDAO {
    public List<GioHang> getGioHangByUser(int userId) {
    List<GioHang> list = new ArrayList<>();
    String sql = "SELECT * FROM giohang WHERE userId = ?";

    try (Connection conn = BDconnect.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {

        ps.setInt(1, userId);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            GioHang gh = new GioHang();
            gh.setMaSP(rs.getInt("MaSP"));
            gh.setTenSP(rs.getString("TenSP"));
            gh.setSLTrongGio(rs.getInt("SLTrongGio"));
            gh.setGiaBan(rs.getDouble("GiaBan"));
            gh.setThanhTien(rs.getDouble("ThanhTien"));
            gh.setUserId(rs.getInt("userId"));
            list.add(gh);
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return list;
}

public boolean themVaoGioHang(GioHang gh) {
    String sql = "INSERT INTO giohang (MaSP, TenSP, SLTrongGio, GiaBan, ThanhTien, userId) VALUES (?, ?, ?, ?, ?, ?)";
    try (Connection conn = BDconnect.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {

        ps.setInt(1, gh.getMaSP());
        ps.setString(2, gh.getTenSP());
        ps.setInt(3, gh.getSLTrongGio());
        ps.setDouble(4, gh.getGiaBan());
        ps.setDouble(5, gh.getThanhTien());
        ps.setInt(6, gh.getUserId());

        return ps.executeUpdate() > 0;
    } catch (Exception e) {
        e.printStackTrace();
    }
    return false;
}

public boolean capNhatSoLuong(int userId, int maSP, int soLuongMoi) {
    String sql = "UPDATE giohang SET SLTrongGio = ?, ThanhTien = GiaBan * ? WHERE userId = ? AND MaSP = ?";
    try (Connection conn = BDconnect.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {

        ps.setInt(1, soLuongMoi);
        ps.setInt(2, soLuongMoi);
        ps.setInt(3, userId);
        ps.setInt(4, maSP);

        return ps.executeUpdate() > 0;
    } catch (Exception e) {
        e.printStackTrace();
    }
    return false;
}

public boolean xoaKhoiGioHang(int userId, int maSP) {
    String sql = "DELETE FROM giohang WHERE userId = ? AND MaSP = ?";
    try (Connection conn = BDconnect.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {

        ps.setInt(1, userId);
        ps.setInt(2, maSP);

        return ps.executeUpdate() > 0;
    } catch (Exception e) {
        e.printStackTrace();
    }
    return false;
}

public boolean xoaTatCaGioHang(int userId) {
    String sql = "DELETE FROM giohang WHERE userId = ?";
    try (Connection conn = BDconnect.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {

        ps.setInt(1, userId);

        return ps.executeUpdate() > 0;
    } catch (Exception e) {
        e.printStackTrace();
    }
    return false;
}

}
