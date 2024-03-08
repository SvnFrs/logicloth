/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import Model.account;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author admin
 */
public class AccountDAOs {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public AccountDAOs() {
        conn = ConnectDB.ConnectingDB.getConnection();
    }

    public boolean Login(account acc) throws SQLException {
        rs = null;
        String sql = "SELECT * FROM Users WHERE username = ? AND password = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, acc.getUserName());

            // Mã hóa mật khẩu bằng MD5 trước khi so sánh
            String hashedPassword = getMD5Hash(acc.getPassword());
            ps.setString(2, hashedPassword);

            rs = ps.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs.next();
    }

    public String getRole(account acc) throws SQLException {
        String role = null;
        String sql = "SELECT role FROM Users WHERE username = ? AND password = ?";

        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, acc.getUserName());
            String hashedPassword = getMD5Hash(acc.getPassword());
            ps.setString(2, hashedPassword);
            try ( ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    // Lấy role từ kết quả của truy vấn
                    role = rs.getString("role");
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(account.class.getName()).log(Level.SEVERE, null, ex);
        }

        return role;
    }

    public String getRoleByID(int userID) throws SQLException {
        String role = null;
        String sql = "SELECT role FROM Users WHERE user_id = ?";

        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, userID);
            try ( ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    // Lấy role từ kết quả của truy vấn
                    role = rs.getString("role");
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(account.class.getName()).log(Level.SEVERE, null, ex);
        }

        return role;
    }
    
    public String getNameByID(int userID) throws SQLException {
        String name = null;
        String sql = "SELECT full_name FROM Users WHERE user_id = ?";

        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, userID);
            try ( ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    // Lấy role từ kết quả của truy vấn
                    name = rs.getString("full_name");
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(account.class.getName()).log(Level.SEVERE, null, ex);
        }

        return name;
    }
    
    public int getUserID(account acc) throws SQLException {
        int userID = 0;
        String sql = "SELECT user_id FROM public.users WHERE username = ? AND password = ?";

        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, acc.getUserName());
            String hashedPassword = getMD5Hash(acc.getPassword());
            ps.setString(2, hashedPassword);
            try ( ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    // Lấy role từ kết quả của truy vấn
                    userID = rs.getInt("user_id");
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(account.class.getName()).log(Level.SEVERE, null, ex);
        }

        return userID;
    }

    public int updatePassword(String email, String newPass) throws SQLException {
        int rowsAffected = 0;
        String sql = "UPDATE Users SET password = ? WHERE email = ?";
        try {
            ps = conn.prepareStatement(sql);
            String hashedPassword = getMD5Hash(newPass);
            ps.setString(1, hashedPassword);
            ps.setString(2, email);
            rowsAffected = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rowsAffected;
    }

    public boolean emailExits(String email) throws SQLException {
        rs = null;
        String sql = "SELECT * FROM Users WHERE email = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            rs = ps.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(account.class.getName()).log(Level.SEVERE, null, ex);
        }

        return rs.next();
    }

    public int AddNew(account acc) {
        String sql = "INSERT INTO public.users (user_id, username, password, email, full_name, role)" + "VALUES (DEFAULT, ?, ?, ?, ?, ?)";
        int ketqua = 0;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);

            String hashedNewPassword = getMD5Hash(acc.getPassword());
            ps.setString(1, acc.getUserName());
            ps.setString(2, hashedNewPassword);
            ps.setString(3, acc.getEmail());
            ps.setString(4, acc.getFullName());
            ps.setString(5, acc.getRole());

            ketqua = ps.executeUpdate();
            conn.close();
        } catch (SQLException e) {
            e.getMessage();
        }
        return ketqua;
    }

    public String getMD5Hash(String input) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] messageDigest = md.digest(input.getBytes());
            StringBuilder hexString = new StringBuilder();

            for (byte b : messageDigest) {
                hexString.append(String.format("%02x", b));
            }

            return hexString.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }

//    public account getUserLogin(String us) {
//        String sql = "SELECT * FROM Users WHERE email = ?";
//        account u = null;
//        try {
//            ps = conn.prepareStatement(sql);
//            ps.setString(1, us);
//            rs = ps.executeQuery();
//            if (rs.next()) {
//                u = new account(rs.getString("email"), rs.getString("password"));
//            }
//        } catch (SQLException ex) {
//            Logger.getLogger(AccountDAOs.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return u;
//    }
}
