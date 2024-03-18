package DAOs;

import ConnectDB.ConnectingDB;
import Model.cart;


import java.sql.*;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class CartDAOs {
    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    cart cart = new cart();
    List<cart> carts = new ArrayList<>();
    String query = "";

    public CartDAOs() {
        conn = ConnectingDB.getConnection();
    }

    public List<cart> getAllByID(int id) {
        ArrayList<cart> result = new ArrayList<>();
        String query = "SELECT * FROM carts WHERE user_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, id); // set id parameter
            rs = ps.executeQuery();
            while (rs.next()) {
                cart cart = new cart();
                cart.setUserID(rs.getInt("user_id"));
                cart.setProductID(rs.getInt("product_id"));
                cart.setQuantity(rs.getInt("quantity"));
                result.add(cart); // Add the cart to the result list
            }
        } catch (SQLException ex) {
            Logger.getLogger(CartDAOs.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
        return result;
    }
    
    public void updateCart(int userID, int productID, int quantity) {
        String query = "UPDATE carts SET quantity = ? WHERE user_id = ? AND product_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, quantity);
            ps.setInt(2, userID);
            ps.setInt(3, productID);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CartDAOs.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
    }

    public void addToCart(int userID, int productID, int quantity) {
        String query = "INSERT INTO carts (user_id, product_id, quantity) VALUES (?, ?, ?)";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, userID);
            ps.setInt(2, productID);
            ps.setInt(3, quantity);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CartDAOs.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
    }

    public void addQuantity(int userID, int productID) {
        String query = "UPDATE carts SET quantity = quantity + 1  WHERE user_id = ? AND product_id = ?";
        try {
            ps = conn.prepareStatement(query);
//            ps.setInt(1, quantity);
            ps.setInt(1, userID);
            ps.setInt(2, productID);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CartDAOs.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
    }

    public boolean isProductInCart(int userID, int productID) {
        String query = "SELECT * FROM carts WHERE user_id = ? AND product_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, userID);
            ps.setInt(2, productID);
            rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CartDAOs.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public void deleteProduct(int userID, int productID) {
        String query = "DELETE FROM carts WHERE user_id = ? AND product_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, userID);
            ps.setInt(2, productID);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CartDAOs.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
    }
    
    public void removeCartItemWhichReceived(int userID, int productID) {
        String query = "DELETE FROM carts WHERE user_id = ? AND product_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, userID);
            ps.setInt(2, productID);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CartDAOs.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
    }
}
