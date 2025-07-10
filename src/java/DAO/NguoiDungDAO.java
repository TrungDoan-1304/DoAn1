/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.*;
import java.util.*;
import Model.NguoiDung;
import Util.BDconnect;

/**
 *
 * @author PC
 */
public class NguoiDungDAO {

    public NguoiDung checkLogin(String username, String password) {
        NguoiDung user = null;
        String sql = "SELECT * FROM user WHERE username = ? AND password = ? AND TrangThaiHD = 1";

        try (Connection conn = BDconnect.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                user = new NguoiDung();
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

    public boolean insertUser(NguoiDung user) {
        String sql = "INSERT INTO user (username, password, HoTen, email, SDT, DiaChi, role) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = BDconnect.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getHoTen());
            ps.setString(4, user.getEmail());
            ps.setString(5, user.getSDT());
            ps.setString(6, user.getDiaChi());
            ps.setString(7, user.getRole());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public NguoiDung getUserById(int id) {
        NguoiDung user = null;
        String sql = "SELECT * FROM user WHERE userId = ?";

        try (Connection conn = BDconnect.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                user = new NguoiDung();
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

    public List<NguoiDung> getAllUsers() {
        List<NguoiDung> list = new ArrayList<>();
        String sql = "SELECT * FROM user";

        try (Connection conn = BDconnect.getConnection(); PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                NguoiDung user = new NguoiDung();
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

}
