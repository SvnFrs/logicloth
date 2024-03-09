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

    public void insertCheckout(int userID, int productID, int quantity) {
        String query = "INSERT INTO checkout (user_id, product_id, quantity) VALUES (?, ?, ?)";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, userID);
            ps.setInt(2, productID);
            ps.setInt(3, quantity);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CheckoutDAOs.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
    }

}
