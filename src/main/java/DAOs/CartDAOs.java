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

public class CartDAOs implements DAO<cart> {
    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    cart cart = new cart();
    List<cart> carts = new ArrayList<>();
    String query = "";

    public CartDAOs() {
        conn = ConnectingDB.getConnection();
    }
    @Override
    public List<cart> getAll() {
        return null;
    }

    public List<cart> getAllByID(int id) {
        ArrayList<cart> result = new ArrayList<>();
        String query = "SELECT * FROM dacfood.public.carts WHERE user_id = ?";
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

    public void addToCart(int userID, int productID, int quantity) {
        String query = "INSERT INTO dacfood.public.carts (user_id, product_id, quantity) VALUES (?, ?, ?)";
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
        String query = "UPDATE dacfood.public.carts SET quantity = quantity + 1  WHERE user_id = ? AND product_id = ?";
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
        String query = "SELECT * FROM dacfood.public.carts WHERE user_id = ? AND product_id = ?";
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

    @Override
    public Optional<cart> get(int id) {
        return Optional.empty();
    }

    @Override
    public void add(cart cart) {

    }

    @Override
    public void update(cart cart) {

    }

    @Override
    public void delete(cart cart) {

    }
}
