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

public class RecordDAOs {
    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    String query = "";

    public RecordDAOs() {
        conn = ConnectingDB.getConnection();
    }

    public void insertRecord(int restaurantID, int saleID) {
        query = "INSERT INTO restaurantrecords (restaurant_id, sales_id) VALUES (?, ?)";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, restaurantID);
            ps.setInt(2, saleID);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(RecordDAOs.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
