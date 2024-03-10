package DAOs;

import ConnectDB.ConnectingDB;
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

public class SellerOrderDAOs {
    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    orderDetail orderDetail = new orderDetail();
    List<order> orders = new ArrayList<>();
    String query = "";

    public SellerOrderDAOs() {
        conn = ConnectingDB.getConnection();
    }

    public List<order> getAllByRestaurantID(int restaurantID) {
        ArrayList<order> result = new ArrayList<>();
        query = "SELECT * FROM orders WHERE restaurant_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, restaurantID);
            rs = ps.executeQuery();
            while (rs.next()) {
                order order = new order();
                order.setOrderID(rs.getInt("order_id"));
                order.setUserID(rs.getInt("user_id"));
//                order.setRestaurantID(rs.getInt("restaurant_id"));
                order.setOrderDate(String.valueOf(rs.getDate("order_date")));
                order.setOrderStatus(rs.getString("order_status"));
                result.add(order);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SellerOrderDAOs.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public List<orderDetail> getOrderDetailsByRestaurantID(int restaurantID) {
        ArrayList<orderDetail> result = new ArrayList<>();
        query = "SELECT * FROM orderdetails WHERE restaurant_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, restaurantID);
            rs = ps.executeQuery();
            while (rs.next()) {
                orderDetail orderDetail = new orderDetail();
                orderDetail.setOrderDetailID(rs.getInt("order_detail_id"));
                orderDetail.setOrderID(rs.getInt("order_id"));
                orderDetail.setProductID(rs.getInt("product_id"));
                orderDetail.setQuantity(rs.getInt("quantity"));
                orderDetail.setTotalPrice(rs.getLong("total_price"));
                orderDetail.setAddressID(rs.getInt("address_id"));
                result.add(orderDetail);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SellerOrderDAOs.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
        return result;
    }
    
    public orderDetail getOrderDetailByOrderID(int orderID) {
        orderDetail orderDetail = new orderDetail();
        query = "SELECT * FROM orderdetails WHERE order_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, orderID);
            rs = ps.executeQuery();
            while (rs.next()) {
                orderDetail.setOrderDetailID(rs.getInt("order_detail_id"));
                orderDetail.setOrderID(rs.getInt("order_id"));
                orderDetail.setProductID(rs.getInt("product_id"));
                orderDetail.setQuantity(rs.getInt("quantity"));
                orderDetail.setTotalPrice(rs.getLong("total_price"));
                orderDetail.setAddressID(rs.getInt("address_id"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(SellerOrderDAOs.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
        return orderDetail;
    }

    public int getRestaurantID(int userID) {
        int restaurantID = 0;
        query = "SELECT restaurant_id FROM restaurantmanagement  WHERE seller_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, userID);
            rs = ps.executeQuery();
            while (rs.next()) {
                restaurantID = rs.getInt("restaurant_id");
            }
        } catch (SQLException ex) {
            Logger.getLogger(SellerOrderDAOs.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
        return restaurantID;
    }
    
    public int countOrderInOrderDetailsByOrderID(int orderID) {
        int count = 0;
        query = "SELECT COUNT(order_id) FROM orderdetails WHERE order_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, orderID);
            rs = ps.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SellerOrderDAOs.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public int getOrderIDByRestaurantID(int restaurantID) {
        int orderID = 0;
        query = "SELECT order_id FROM orders WHERE restaurant_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, restaurantID);
            rs = ps.executeQuery();
            while (rs.next()) {
                orderID = rs.getInt("order_id");
            }
        } catch (SQLException ex) {
            Logger.getLogger(SellerOrderDAOs.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
        return orderID;
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
    

    public String getOrderStatusByOrderStatusID(int statusID) {
        String orderStatus = "";
        query = "SELECT status_name FROM orderstatus WHERE status_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, statusID);
            rs = ps.executeQuery();
            while (rs.next()) {
                orderStatus = rs.getString(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAOs.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
        return orderStatus;
    }

}