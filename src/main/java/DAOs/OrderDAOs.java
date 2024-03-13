package DAOs;

import ConnectDB.ConnectingDB;
import Model.restaurant;
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

public class OrderDAOs {
    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

//    orderDetail orderDetail = new orderDetail();
    List<order> orders = new ArrayList<>();
    String query = "";

    public OrderDAOs() {
        conn = ConnectingDB.getConnection();
    }
    
    public void insertOrder(int orderID, int userID) {
        query = "INSERT INTO orders(order_id, user_id) VALUES(?, ?)";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, orderID);
            ps.setInt(2, userID);
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

    public void insertOrderDetail(int orderID, int productID, int restaurantID, int quantity, long totalPrice, int addressID) {
        query = "INSERT INTO orderdetails(order_id, product_id, restaurant_id, quantity, total_price, address_id) VALUES(?, ?, ?, ?, ?, ?)";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, orderID);
            ps.setInt(2, productID);
            ps.setInt(3, restaurantID);
            ps.setInt(4, quantity);
            ps.setLong(5, totalPrice);
            ps.setInt(6, addressID);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAOs.class.getName()).log(Level.SEVERE, null, ex);
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
//                order.setRestaurantID(rs.getInt("restaurant_id"));
                order.setOrderDate(String.valueOf(rs.getDate("order_date")));
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
        ArrayList<orderDetail> orderDetails = new ArrayList<>();
        query = "SELECT * FROM orderdetails WHERE order_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, orderID);
            rs = ps.executeQuery();
            while (rs.next()) {
                orderDetail orderDetail = new orderDetail();
                orderDetail.setRestaurantID(rs.getInt("restaurant_id"));
                orderDetail.setProductID(rs.getInt("product_id"));
                orderDetail.setQuantity(rs.getInt("quantity"));
                orderDetail.setTotalPrice(rs.getLong("total_price"));
                orderDetails.add(orderDetail);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAOs.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
        return orderDetails;
    }

    public List<orderDetail> getOrderDetailByOrderIDAndRestaurantID(int orderID, int restaurantID) {
        ArrayList<orderDetail> orderDetails = new ArrayList<>();
        query = "SELECT * FROM orderdetails WHERE order_id = ? AND restaurant_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, orderID);
            ps.setInt(2, restaurantID);
            rs = ps.executeQuery();
            while (rs.next()) {
                orderDetail orderDetail = new orderDetail();
                orderDetail.setRestaurantID(rs.getInt("restaurant_id"));
                orderDetail.setProductID(rs.getInt("product_id"));
                orderDetail.setQuantity(rs.getInt("quantity"));
                orderDetail.setTotalPrice(rs.getLong("total_price"));
                orderDetails.add(orderDetail);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAOs.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
        return orderDetails;
    }

    public List<orderDetail> getOrderDetailsByOrderID(int orderID) {
        ArrayList<orderDetail> result = new ArrayList<>();
        query = "SELECT * FROM orderdetails WHERE order_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, orderID);
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

    public long getTotalPriceByOrderIDAndRestaurantID(int orderID, int restaurantID) {
        long totalPrice = 0;
        query = "SELECT SUM(total_price) FROM orderdetails WHERE order_id = ? AND restaurant_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, orderID);
            ps.setInt(2, restaurantID);
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


    public void updateOrderStatus(int orderID, int statusID) {
        query = "UPDATE orderdetails SET order_status = ? WHERE order_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, statusID);
            ps.setInt(2, orderID);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAOs.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
    }
    
    public String getOrderDateByOrderID(int orderID) {
        String orderDate = "";
        query = "SELECT order_date FROM orders WHERE order_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, orderID);
            rs = ps.executeQuery();
            while (rs.next()) {
                orderDate = String.valueOf(rs.getDate(1));
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAOs.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
        return orderDate;
    }
    
    public List<restaurant> getRestaurantIDByOrderID(int orderID) {
        ArrayList<restaurant> result = new ArrayList<>();
        query = "SELECT DISTINCT restaurant_id FROM orderdetails WHERE order_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, orderID);
            rs = ps.executeQuery();
            while (rs.next()) {
                restaurant restaurant = new restaurant();
                restaurant.setRestaurantID(rs.getInt("restaurant_id"));
                result.add(restaurant);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAOs.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
        return result;
    }
    
    public int getOrderStatusByOrderIDAndRestaurantID(int orderID, int restaurantID) {
        int statusID = 0;
        query = "SELECT order_status FROM orderdetails WHERE order_id = ? AND restaurant_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, orderID);
            ps.setInt(2, restaurantID);
            rs = ps.executeQuery();
            while (rs.next()) {
                statusID = rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAOs.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
        return statusID;
    }
    
    public List<order> getAllOrderStatusByOrderID(int orderID) {
        ArrayList<order> result = new ArrayList<>();
        query = "SELECT DISTINCT order_status FROM orderdetails WHERE order_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, orderID);
            rs = ps.executeQuery();
            while (rs.next()) {
                order order = new order();
                order.setOrderStatus(rs.getString("order_status"));
                result.add(order);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAOs.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
        return result;
    }
    
    public void updateOrderStatus() {
        query = "UPDATE orders SET order_status = ? WHERE order_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, 2);
            ps.setInt(2, 1);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAOs.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
    }
    
    public int countOrderDetailsWithOrderID(int orderID) {
        int count = 0;
        query = "SELECT COUNT(order_detail_id) FROM orderdetails WHERE order_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, orderID);
            rs = ps.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAOs.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
        return count;
    }
}
