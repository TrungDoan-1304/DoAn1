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

    private List<SanPhamTrongGio> danhSachSanPham;

    public GioHang() {
        danhSachSanPham = new ArrayList<>();
    }

// Thêm sản phẩm vào giỏ
    public void themSanPham(SanPhamTrongGio sp) {
        for (SanPhamTrongGio item : danhSachSanPham) {
            if (item.getMaSanPham() == sp.getMaSanPham()) {
                item.setSoLuong(item.getSoLuong() + sp.getSoLuong());
                return;
            }
        }
        danhSachSanPham.add(sp);
    }

// Xóa sản phẩm theo mã
    public void xoaSanPham(int maSanPham) {
        danhSachSanPham.removeIf(sp -> sp.getMaSanPham() == maSanPham);
    }

// Tính tổng tiền
    public double getTongTien() {
        double tong = 0;
        for (SanPhamTrongGio sp : danhSachSanPham) {
            tong += sp.getSoLuong() * sp.getDonGia();
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
