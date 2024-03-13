package DAOs;

import Model.account;
import Model.restaurant;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class AdminDAOs {
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public AdminDAOs() {
        conn = ConnectDB.ConnectingDB.getConnection();
    }

    public boolean adminLogin(account acc) throws SQLException {
        rs = null;
        String sql = "SELECT * FROM users WHERE username = ? AND password = ? AND role = 'admin'";
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

    public List<account> getAllAccountsButAdmin() {
        ArrayList<account> result = new ArrayList<>();
        String query = "SELECT * FROM users WHERE role != 'admin'";
        try {
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                account acc = new account();
                acc.setUserID(rs.getInt("user_id"));
                acc.setUserName(rs.getString("username"));
                acc.setPassword(rs.getString("password"));
                acc.setEmail(rs.getString("email"));
                acc.setFullName(rs.getString("full_name"));
                acc.setRole(rs.getString("role"));
                acc.setStatus(rs.getBoolean("status"));
                result.add(acc);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AdminDAOs.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public List<restaurant> getAllRestaurants() {
        ArrayList<restaurant> result = new ArrayList<>();
        String query = "SELECT * FROM restaurants";
        try {
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                restaurant res = new restaurant();
                res.setRestaurantID(rs.getInt("restaurant_id"));
                res.setRestaurantName(rs.getString("name"));
                res.setRestaurantDescription(rs.getString("description"));
                res.setRestaurantAddress(rs.getString("address"));
                res.setRestaurantImage(rs.getString("image_url"));
                result.add(res);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AdminDAOs.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public void updateRestaurant(String restaurantName, String restaurantAddress, String restaurantDescription, String restaurantImage, int restaurantID) {
        String query = "UPDATE restaurants SET name = ?, address = ?, description = ?, image_url = ? WHERE restaurant_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, restaurantName);
            ps.setString(2, restaurantAddress);
            ps.setString(3, restaurantDescription);
            ps.setString(4, restaurantImage);
            ps.setInt(5, restaurantID);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AdminDAOs.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
