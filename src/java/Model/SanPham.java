/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.Date;

/**
 *
 * @author PC
 */
public class SanPham {

    private int MaSP;
    private String TenSP;
    private String MoTa;
    private double GiaBan;
    private int SLTrongKho;
    private String DanhMuc; // Foreign Key đến danh mục sản phẩm
    private Date NgayThemSP;

    public SanPham() {
    }

    public SanPham(int MaSP, String TenSP, String MoTa, double GiaBan,
            int SLTrongKho, String DanhMuc, Date NgayThemSP) {
        this.MaSP = MaSP;
        this.TenSP = TenSP;
        this.MoTa = MoTa;
        this.GiaBan = GiaBan;
        this.SLTrongKho = SLTrongKho;
        this.DanhMuc = DanhMuc;
        this.NgayThemSP = NgayThemSP;
    }

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

    public String getMoTa() {
        return MoTa;
    }

    public void setMoTa(String MoTa) {
        this.MoTa = MoTa;
    }

    public double getGiaBan() {
        return GiaBan;
    }

    public void setGiaBan(double GiaBan) {
        this.GiaBan = GiaBan;
    }

    public int getSLTrongKho() {
        return SLTrongKho;
    }

    public void setSLTrongKho(int SLTrongKho) {
        this.SLTrongKho = SLTrongKho;
    }

    public String getDanhMuc() {
        return DanhMuc;
    }

    public void setDanhMuc(String DanhMuc) {
        this.DanhMuc = DanhMuc;
    }


    public Date getNgayThemSP() {
        return NgayThemSP;
    }

    public void setNgayThemSP(Date NgayThemSP) {
        this.NgayThemSP = NgayThemSP;
    }

}
