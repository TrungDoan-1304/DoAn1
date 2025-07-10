/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.Date;
import java.util.List;

/**
 *
 * @author PC
 */
public class DonHang {

    private int MaDonHang;
    private int userId;
    private Date NgayDatHang;
    private double TongTienDH;
    private String TrangThaiDH;
    private List<ChiTietDonHang> danhSachChiTiet;

// Constructors
    public DonHang() {
    }

    public DonHang(int MaDonHang, int userId, Date NgayDatHang, double TongTienDH, String TrangThaoDH) {
        this.MaDonHang = MaDonHang;
        this.userId = userId;
        this.NgayDatHang = NgayDatHang;
        this.TongTienDH = TongTienDH;
        this.TrangThaiDH = TrangThaoDH;
    }

    public int getMaDonHang() {
        return MaDonHang;
    }

    public void setMaDonHang(int MaDonHang) {
        this.MaDonHang = MaDonHang;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Date getNgayDatHang() {
        return NgayDatHang;
    }

    public void setNgayDatHang(Date NgayDatHang) {
        this.NgayDatHang = NgayDatHang;
    }

    public double getTongTienDH() {
        return TongTienDH;
    }

    public void setTongTienDH(double TongTienDH) {
        this.TongTienDH = TongTienDH;
    }

    public String getTrangThaiDH() {
        return TrangThaiDH;
    }

    public void setTrangThaiDH(String TrangThaiDH) {
        this.TrangThaiDH = TrangThaiDH;
    }

    public List<ChiTietDonHang> getDanhSachChiTiet() {
        return danhSachChiTiet;
    }

    public void setDanhSachChiTiet(List<ChiTietDonHang> danhSachChiTiet) {
        this.danhSachChiTiet = danhSachChiTiet;
    }

    

}
