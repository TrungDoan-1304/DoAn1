/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import jakarta.resource.cci.ResultSet;

/**
 *
 * @author PC
 */
public class Product {
    private int productID ;
    private String productName;
    private String hinhanh;
    private int gia;

    public Product() {
    }

    public Product(int productID, String productName, String hinhanh, int gia) {
        this.productID = productID;
        this.productName = productName;
        this.hinhanh = hinhanh;
        this.gia = gia;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getHinhanh() {
        return hinhanh;
    }

    public void setHinhanh(String hinhanh) {
        this.hinhanh = hinhanh;
    }

    public int getGia() {
        return gia;
    }

    public void setGia(int gia) {
        this.gia = gia;
    }

    
    
}
