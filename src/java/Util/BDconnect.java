/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Util;
import java.sql.*;
/**
 *
 * @author PC
 */
public class BDconnect {
     private Connection getConnection() throws SQLException {
        String url = "jdbc:mysql://localhost:3306/banquanao"; // sửa tên database của bạn
        String username = "root"; // sửa user nếu khác
        String password = "";     // sửa password nếu có
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new SQLException(e);
        }
        return DriverManager.getConnection(url, username, password);
    }
}
