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
import java.util.Collection;
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
    
    public List<restaurant> getAllSellerIDAndRestaurantID() {
        ArrayList<restaurant> result = new ArrayList<>();
        String query = "SELECT seller_id, restaurant_id FROM restaurantmanagement";
        try {
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                restaurant res = new restaurant();
                res.setSellerID(rs.getInt("seller_id"));
                res.setRestaurantID(rs.getInt("restaurant_id"));
                result.add(res);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AdminDAOs.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }
    
    public String getRestaurantNameByID(int restaurantID) {
        String query = "SELECT name FROM restaurants WHERE restaurant_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, restaurantID);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getString("name");
            }
        } catch (SQLException ex) {
            Logger.getLogger(AdminDAOs.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public String getSellerNameByID(int sellerID) {
        String query = "SELECT full_name FROM users WHERE user_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, sellerID);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getString("full_name");
            }
        } catch (SQLException ex) {
            Logger.getLogger(AdminDAOs.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public int getSellerIDByRestaurantID(int restaurantID) {
        String query = "SELECT seller_id FROM restaurantmanagement WHERE restaurant_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, restaurantID);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("seller_id");
            }
        } catch (SQLException ex) {
            Logger.getLogger(AdminDAOs.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public List<account> allSellersWithNoRestaurant() {
        ArrayList<account> result = new ArrayList<>();
        String query = "SELECT * FROM users WHERE role = 'seller' AND user_id NOT IN (SELECT seller_id FROM restaurantmanagement)";
        try {
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                account acc = new account();
                acc.setUserID(rs.getInt("user_id"));
                result.add(acc);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AdminDAOs.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }
    
    public void addRestaurant(int sellerID, int restaurantID, String restaurantName, String restaurantAddress, String restaurantDescription, String restaurantImage) {
        String query = "INSERT INTO restaurants (name, address, description, image_url) VALUES (?, ?, ?, ?)";
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, restaurantName);
            ps.setString(2, restaurantAddress);
            ps.setString(3, restaurantDescription);
            ps.setString(4, restaurantImage);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AdminDAOs.class.getName()).log(Level.SEVERE, null, ex);
        }
        addRestaurantManagement(sellerID, restaurantID);
    }

    public void addRestaurantManagement(int sellerID, int restaurantID) {
        String query = "INSERT INTO restaurantmanagement (seller_id, restaurant_id) VALUES (?, ?)";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, sellerID);
            ps.setInt(2, restaurantID);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AdminDAOs.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static boolean isEmptyOrNull(Collection< ? > collection) {
        return (collection == null || collection.isEmpty());
    }
}
