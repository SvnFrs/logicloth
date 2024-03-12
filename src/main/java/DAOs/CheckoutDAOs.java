package DAOs;

import ConnectDB.ConnectingDB;
import Model.cart;
import Model.checkout;


import java.sql.*;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class CheckoutDAOs {
    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    checkout checkout = new checkout();
    List<checkout> checkouts = new ArrayList<>();
    String query = "";

    public CheckoutDAOs() {
        conn = ConnectingDB.getConnection();
    }

    public List<checkout> getAllByID(int id) {
        ArrayList<checkout> result = new ArrayList<>();
        String query = "SELECT * FROM checkout WHERE user_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, id); // set id parameter
            rs = ps.executeQuery();
            while (rs.next()) {
                checkout checkout = new checkout();
                checkout.setUserID(rs.getInt("user_id"));
                checkout.setProductID(rs.getInt("product_id"));
                checkout.setQuantity(rs.getInt("quantity"));
                result.add(checkout); // Add the checkout to the result list
            }
        } catch (SQLException ex) {
            Logger.getLogger(CheckoutDAOs.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
        return result;
    }
    
    public void insertCheckout(int userID, int productID, int quantity, long totalPrice) {
        String query = "INSERT INTO checkout (user_id, product_id, quantity, total) VALUES (?, ?, ?, ?)";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, userID);
            ps.setInt(2, productID);
            ps.setInt(3, quantity);
            ps.setLong(4, totalPrice);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CheckoutDAOs.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
    }
    
    public void updateCheckout(int userID, int productID, int quantity) {
        String query = "UPDATE checkout SET quantity = ? WHERE user_id = ? AND product_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, quantity);
            ps.setInt(2, userID);
            ps.setInt(3, productID);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CheckoutDAOs.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
    }
    
    public boolean isProductInCheckout(int userID, int productID) {
        String query = "SELECT * FROM checkout WHERE user_id = ? AND product_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, userID);
            ps.setInt(2, productID);
            rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CheckoutDAOs.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public void deleteCheckoutByUserID(int userID) {
        String query = "DELETE FROM checkout WHERE user_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, userID);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CheckoutDAOs.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
    }

    // count how many products in the checkout
    public int countProductInCheckout(int userID) {
        int count = 0;
        String query = "SELECT COUNT(product_id) FROM checkout WHERE user_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, userID);
            rs = ps.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CheckoutDAOs.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public long getTotalPriceInCheckout(int userID) {
        long totalPrice = 0;
        String query = "SELECT SUM(total) FROM checkout WHERE user_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, userID);
            rs = ps.executeQuery();
            while (rs.next()) {
                totalPrice = rs.getLong(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CheckoutDAOs.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
        return totalPrice;
    }



}
