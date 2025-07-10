/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author LTuan
 */
public class SanPhamTrongGio {

    private int MaSP;
    private String TenSP;
    private int SLTrongGio;
    private double GiaBan;

    public SanPhamTrongGio() {
    }

    public SanPhamTrongGio(int MaSP, String TenSP, int SLTrongGio, double GiaBan) {
        this.MaSP = MaSP;
        this.TenSP = TenSP;
        this.SLTrongGio = SLTrongGio;
        this.GiaBan = GiaBan;
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


   

}
