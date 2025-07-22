/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.*;
import java.util.*;
import Model.User;
import Util.BDconnect;


/**
 *
 * @author PC
 */
public class UserDAO {

    public User checkLogin(String username, String password) {
        User user = null;
        String sql = "SELECT * FROM user WHERE username = ? AND password = ? AND TrangThaiHD = 1";

        try (Connection conn = BDconnect.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                user = new User();
                user.setUserId(rs.getInt("userId"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setHoTen(rs.getString("HoTen"));
                user.setEmail(rs.getString("email"));
                user.setSDT(rs.getString("SDT"));
                user.setDiaChi(rs.getString("DiaChi"));
                user.setRole(rs.getString("role"));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    public static List<User> getAllUsersByRole(String role) {
        List<User> users = new ArrayList<>();
        String sql = "SELECT * FROM user WHERE role = ?";

        try (Connection conn = BDconnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, role);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                User user = new User();
                user.setUserId(rs.getInt("userId"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setHoTen(rs.getString("HoTen"));
                user.setEmail(rs.getString("email"));
                user.setSDT(rs.getString("SDT"));
                user.setDiaChi(rs.getString("DiaChi"));
                user.setRole(rs.getString("role"));

                users.add(user);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return users;
    }

    public static void deleteUser(int userId) {
        String sql = "DELETE FROM user WHERE userId = ?";
        try (Connection conn = BDconnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

public static void insertUser(User user) {
    String sql = "INSERT INTO user (username, password, HoTen, email, SDT, DiaChi, role) VALUES (?, ?, ?, ?, ?, ?, ?)";
    try (Connection conn = BDconnect.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {

        ps.setString(1, user.getUsername());
        ps.setString(2, user.getPassword());
        ps.setString(3, user.getHoTen());
        ps.setString(4, user.getEmail());
        ps.setString(5, user.getSDT());
        ps.setString(6, user.getDiaChi());
        ps.setString(7, user.getRole());

        ps.executeUpdate();

    } catch (Exception e) {
        e.printStackTrace();
    }
}

    public User getUserByusername(String username) {
        User user = null;
        String sql = "SELECT * FROM user WHERE username = ?";

        try (Connection conn = BDconnect.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                user = new User();
                user.setUserId(rs.getInt("userId"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setHoTen(rs.getString("HoTen"));
                user.setEmail(rs.getString("email"));
                user.setSDT(rs.getString("SDT"));
                user.setDiaChi(rs.getString("DiaChi"));
                user.setRole(rs.getString("role"));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    public List<User> getAllUsers() {
        List<User> list = new ArrayList<>();
        String sql = "SELECT * FROM user";

        try (Connection conn = BDconnect.getConnection(); PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                User user = new User();
                user.setUserId(rs.getInt("userId"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setHoTen(rs.getString("HoTen"));
                user.setEmail(rs.getString("email"));
                user.setSDT(rs.getString("SDT"));
                user.setDiaChi(rs.getString("DiaChi"));
                user.setRole(rs.getString("role"));

                list.add(user);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public boolean updateUserInfo(User user) {
        String sql = "UPDATE user SET HoTen = ?, email = ?, SDT = ?, DiaChi = ? WHERE userId = ?";
        try (Connection conn = BDconnect.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, user.getHoTen());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getSDT());
            ps.setString(4, user.getDiaChi());
            ps.setInt(5, user.getUserId());

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;

    }
public static String getPasswordByEmail(String email) {
    String password = null;
    String sql = "SELECT password FROM user WHERE email = ?";

    try (Connection conn = BDconnect.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {

        ps.setString(1, email);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            password = rs.getString("password");
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return password;
}

}
