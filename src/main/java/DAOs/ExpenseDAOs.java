package DAOs;

import ConnectDB.ConnectingDB;
import Model.cart;
import Model.order;
import Model.orderDetail;
import Model.orderStatus;


import java.sql.*;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ExpenseDAOs {
    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    String query = "";

    public ExpenseDAOs() {
        conn = ConnectingDB.getConnection();
    }

    public void addAllRestaurantID() {
        query = "SELECT restaurant_id FROM restaurantmanagement";
        try {
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                int restaurantID = rs.getInt("restaurant_id");
                insertRestaurantID(restaurantID);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ExpenseDAOs.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void main(String[] args) {
        ExpenseDAOs expenseDAOs = new ExpenseDAOs();
        expenseDAOs.addAllRestaurantID();
    }

    public void insertRestaurantID(int restaurantID) {
        long  amount = 0;
        query = "INSERT INTO expenses (restaurant_id, expenses) VALUES (?, ?)";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, restaurantID);
            ps.setLong(2, amount);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ExpenseDAOs.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void updateRestaurantExpense(int restaurantID, long amount) {
        query = "UPDATE expenses SET expenses = expenses + ? WHERE restaurant_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setLong(1, amount);
            ps.setInt(2, restaurantID);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ExpenseDAOs.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
