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
