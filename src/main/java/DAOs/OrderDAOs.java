package DAOs;

import ConnectDB.ConnectingDB;
import Model.cart;
import Model.order;
import Model.orderDetail;


import java.sql.*;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class OrderDAOs {
    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    orderDetail orderDetail = new orderDetail();
    List<order> orders = new ArrayList<>();
    String query = "";

    public OrderDAOs() {
        conn = ConnectingDB.getConnection();
    }
    
    public void insertOrder(int orderID, int userID, int restaurantID) {
        query = "INSERT INTO orders(order_id, user_id, restaurant_id) VALUES(?, ?, ?)";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, orderID);
            ps.setInt(2, userID);
            ps.setInt(3, restaurantID);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAOs.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
    }

    public int generateOrderID() {
        int orderID = 0;
        String query = "SELECT MAX(order_id) FROM orders";
        try {
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                orderID = rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAOs.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
        return orderID + 1;
    }

    public int generateOrderDetailID() {
        int orderDetailID = 0;
        String query = "SELECT MAX(order_detail_id) FROM orderdetails";
        try {
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                orderDetailID = rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAOs.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
        return orderDetailID + 1;
    }

    public void insertOrderDetail(int orderDetailID, int orderID, String fullName, String phoneNumber, int productID, int quantity, long totalPrice, String address) {
        query = "INSERT INTO orderdetails(order_detail_id, order_id, receiver_name, phone_number, product_id, quantity, total_price, address) VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, orderDetailID);
            ps.setInt(2, orderID);
            ps.setString(3, fullName);
            ps.setString(4, phoneNumber);
            ps.setInt(5, productID);
            ps.setInt(6, quantity);
            ps.setLong(7, totalPrice);
            ps.setString(8, address);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAOs.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
    }

    public List<order> getAllByID(int userID) {
        ArrayList<order> result = new ArrayList<>();
        query = "SELECT * FROM orders WHERE user_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, userID);
            rs = ps.executeQuery();
            while (rs.next()) {
                order order = new order();
                order.setOrderID(rs.getInt("order_id"));
                order.setUserID(rs.getInt("user_id"));
                order.setRestaurantID(rs.getInt("restaurant_id"));
                order.setOrderStatus(rs.getString("order_status"));
                result.add(order);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAOs.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
        return result;
    }
    
    public List<orderDetail> getOrderDetailByOrderID(int orderID) {
        List<orderDetail> orderDetails = new ArrayList<>();
        query = "SELECT * FROM orderdetails WHERE order_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, orderID);
            rs = ps.executeQuery();
            while (rs.next()) {
                orderDetail.setOrderDetailID(rs.getInt("order_detail_id"));
                orderDetail.setOrderID(rs.getInt("order_id"));
                orderDetail.setReceiverName(rs.getString("receiver_name"));
                orderDetail.setPhoneNumber(rs.getString("phone_number"));
                orderDetail.setProductID(rs.getInt("product_id"));
                orderDetail.setQuantity(rs.getInt("quantity"));
                orderDetail.setTotalPrice(rs.getLong("total_price"));
                orderDetail.setOrderAddress(rs.getString("address"));
                orderDetails.add(orderDetail);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAOs.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
        return orderDetails;
    }

    public long getTotalPriceByOrderID(int orderID) {
        long totalPrice = 0;
        query = "SELECT SUM(total_price) FROM orderdetails WHERE order_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, orderID);
            rs = ps.executeQuery();
            while (rs.next()) {
                totalPrice = rs.getLong(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAOs.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
        return totalPrice;
    }
}
