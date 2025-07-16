/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

public class CartItem {
    private int productID;
    private String productName;
    private String size;
    private int quantity;
    private double price;
    private double total;

    public CartItem() {
    }

    public CartItem(int productID, String productName, String size, int quantity, double price, double total) {
        this.productID = productID;
        this.productName = productName;
        this.size = size;
        this.quantity = quantity;
        this.price = price;
        this.total = total;
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

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
        this.total = this.price * this.quantity; // tự cập nhật total khi thay đổi quantity
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
        this.total = this.price * this.quantity; // tự cập nhật total khi thay đổi price
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }
}