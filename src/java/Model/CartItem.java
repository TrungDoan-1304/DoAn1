/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

public class CartItem {
    private String cartID;
    private String username;
    private int productID;
    private String productName;
    private String size;
    private int quantity;
    private double price;
   

    public CartItem() {
    }

    public CartItem(String cartID, String username, int productID, String productName, String size, int quantity, double price) {
        this.cartID = cartID;
        this.username = username;
        this.productID = productID;
        this.productName = productName;
        this.size = size;
        this.quantity = quantity;
        this.price = price;
    }

    public String getCartID() {
        return cartID;
    }

    public void setCartID(String cartID) {
        this.cartID = cartID;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
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
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
   
    }
     public double getTotal()
     { return price * quantity; }
    
}