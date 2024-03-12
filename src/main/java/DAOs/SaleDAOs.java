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

public class SaleDAOs {
    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    String query = "";

    public SaleDAOs() {
        conn = ConnectingDB.getConnection();
    }

    public void insertSale(int saleID, int productID, int quantity, double total, Date date) {
        query = "INSERT INTO restaurantsales (sales_id, product_id, quantity, total_sales, date) VALUES (?, ?, ?, ?, ?)";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, saleID);
            ps.setInt(2, productID);
            ps.setInt(3, quantity);
            ps.setDouble(4, total);
            ps.setDate(5, date);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(SaleDAOs.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public int generateSaleID() {
        int saleID = 0;
        String query = "SELECT MAX(sales_id) FROM restaurantsales";
        try {
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                saleID = rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SaleDAOs.class.getName()).log(Level.SEVERE, null, ex);
        }
        return saleID + 1;
    }
}
