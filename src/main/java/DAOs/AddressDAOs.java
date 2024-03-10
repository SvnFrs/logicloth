package DAOs;

import ConnectDB.ConnectingDB;
import Model.cart;
import Model.order;
import Model.address;


import java.sql.*;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class AddressDAOs {
    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    String query = "";

    public AddressDAOs() {
        conn = ConnectingDB.getConnection();
    }

    public void insertAddress(int orderID, int userID, String receiverName, String phoneNumber, String address) {
        query = "INSERT INTO addresses(order_id, user_id, receiver_name, phone_number, address) VALUES(?, ?, ?, ?, ?)";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, orderID);
            ps.setInt(2, userID);
            ps.setString(3, receiverName);
            ps.setString(4, phoneNumber);
            ps.setString(5, address);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AddressDAOs.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
    }
    
    public address getAddressByOrderID(int orderID) {
        address address = new address();
        query = "SELECT * FROM addresses WHERE order_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, orderID);
            rs = ps.executeQuery();
            while (rs.next()) {
                address.setAddressID(rs.getInt("address_id"));
                address.setOrderID(rs.getInt("order_id"));
                address.setUserID(rs.getInt("user_id"));
                address.setReceiverName(rs.getString("receiver_name"));
                address.setPhoneNumber(rs.getString("phone_number"));
                address.setAddress(rs.getString("address"));
                address.setStatus(rs.getBoolean("status"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AddressDAOs.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
        return address;
    }
    
    public int generateAddressID() {
        int addressID = 0;
        String query = "SELECT MAX(address_id) FROM addresses";
        try {
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                addressID = rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AddressDAOs.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
        return addressID + 1;
    }
}
