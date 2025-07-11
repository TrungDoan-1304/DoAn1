/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author PC
 */
public class GioHang {

    private int MaSP;
    private String TenSP;
    private int SLTrongGio;
    private double GiaBan;
    private double ThanhTien;
    private int userId;

    public int getMaSP() {
        return MaSP;
    }

    public void setMaSP(int MaSP) {
        this.MaSP = MaSP;
    }

    public String getTenSP() {
        return TenSP;
    }

    public void setTenSP(String TenSP) {
        this.TenSP = TenSP;
    }

    public int getSLTrongGio() {
        return SLTrongGio;
    }

    public void setSLTrongGio(int SLTrongGio) {
        this.SLTrongGio = SLTrongGio;
    }

    public double getGiaBan() {
        return GiaBan;
    }

    public void setGiaBan(double GiaBan) {
        this.GiaBan = GiaBan;
    }

    public double getThanhTien() {
        return ThanhTien;
    }

    public void setThanhTien(double ThanhTien) {
        this.ThanhTien = ThanhTien;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
    

    private List<SanPhamTrongGio> danhSachSanPham;

    public GioHang() {
        danhSachSanPham = new ArrayList<>();
    }

// Thêm sản phẩm vào giỏ
    public void themSanPham(SanPhamTrongGio sp) {
        for (SanPhamTrongGio item : danhSachSanPham) {
            if (item.getMaSP() == sp.getMaSP()) {
                item.setSLTrongGio(item.getSLTrongGio() + sp.getSLTrongGio());
                return;
            }
        }
        danhSachSanPham.add(sp);
    }

// Xóa sản phẩm theo mã
    public void xoaSanPham(int MaSP) {
        danhSachSanPham.removeIf(sp -> sp.getMaSP() == MaSP);
    }

// Tính tổng tiền
    public double getTongTien() {
        double tong = 0;
        for (SanPhamTrongGio sp : danhSachSanPham) {
            tong += sp.getSLTrongGio() * sp.getGiaBan();
        }
        return tong;
    }

    public List<SanPhamTrongGio> getDanhSachSanPham() {
        return danhSachSanPham;
    }

    public void setDanhSachSanPham(List<SanPhamTrongGio> danhSachSanPham) {
        this.danhSachSanPham = danhSachSanPham;
    }

}
