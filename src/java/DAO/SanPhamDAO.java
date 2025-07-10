/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import Model.SanPham;
import Util.BDconnect;
/**
 *
 * @author PC
 */
public class SanPhamDAO {
    public List<SanPham> getAllSanPham() {
    List<SanPham> list = new ArrayList<>();
    String sql = "SELECT * FROM sanpham";

    try (Connection conn = BDconnect.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql);
         ResultSet rs = ps.executeQuery()) {

        while (rs.next()) {
            SanPham sp = new SanPham();
            sp.setMaSP(rs.getInt("MaSP"));
            sp.setTenSP(rs.getString("TenSP"));
            sp.setMoTa(rs.getString("MoTa"));
            sp.setGiaBan(rs.getDouble("GiaBan"));
            sp.setSLTrongKho(rs.getInt("SLTrongKho"));         
            sp.setDanhMuc(rs.getString("DanhMuc"));
            sp.setNgayThemSP(rs.getDate("NgayThemSP"));
            list.add(sp);
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return list;
}

public SanPham getSanPhamById(int id) {
    String sql = "SELECT * FROM sanpham WHERE MaSP = ?";
    try (Connection conn = BDconnect.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {

        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            return new SanPham(
                rs.getInt("MaSP"),
                rs.getString("TenSP"),
                rs.getString("MoTa"),
                rs.getDouble("GiaBan"),
                rs.getInt("SLTrongKho"),               
                rs.getString("DanhMuc"),
                rs.getDate("NgayThemSP")
            );
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return null;
}

public boolean insertSanPham(SanPham sp) {
    String sql = "INSERT INTO sanpham (TenSP, MoTa, GiaBan, SLTrongKho, DanhMuc, NgayThemSP) VALUES (?, ?, ?, ?, ?, ?, ?)";
    try (Connection conn = BDconnect.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {

        ps.setString(1, sp.getTenSP());
        ps.setString(2, sp.getMoTa());
        ps.setDouble(3, sp.getGiaBan());
        ps.setInt(4, sp.getSLTrongKho());      
        ps.setString(5, sp.getDanhMuc());
        ps.setDate(6, new java.sql.Date(sp.getNgayThemSP().getTime()));
        return ps.executeUpdate() > 0;

    } catch (Exception e) {
        e.printStackTrace();
    }
    return false;
}

public boolean updateSanPham(SanPham sp) {
    String sql = "UPDATE sanpham SET TenSP=?, MoTa=?, GiaBan=?, SLTrongKho=?, DanhMuc=?, NgayThemSP=? WHERE MaSP=?";
    try (Connection conn = BDconnect.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {

        ps.setString(1, sp.getTenSP());
        ps.setString(2, sp.getMoTa());
        ps.setDouble(3, sp.getGiaBan());
        ps.setInt(4, sp.getSLTrongKho());        
        ps.setString(5, sp.getDanhMuc());
        ps.setDate(6, new java.sql.Date(sp.getNgayThemSP().getTime()));
        ps.setInt(7, sp.getMaSP());

        return ps.executeUpdate() > 0;

    } catch (Exception e) {
        e.printStackTrace();
    }
    return false;
}

public boolean deleteSanPham(int id) {
    String sql = "DELETE FROM sanpham WHERE MaSP=?";
    try (Connection conn = BDconnect.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {

        ps.setInt(1, id);
        return ps.executeUpdate() > 0;

    } catch (Exception e) {
        e.printStackTrace();
    }
    return false;
}

}
