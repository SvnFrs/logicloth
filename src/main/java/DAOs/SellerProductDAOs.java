package DAOs;

import ConnectDB.ConnectingDB;

import Model.product;

import java.sql.*;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;
public class SellerProductDAOs {
    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    String query = "";

    public SellerProductDAOs() {
        conn = ConnectingDB.getConnection();
    }

    public List<product> getAllByRestaurantID(int restaurantID) {
        ArrayList<product> result = new ArrayList<>();
        query = "SELECT * FROM products WHERE restaurant_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, restaurantID);
            rs = ps.executeQuery();
            while (rs.next()) {
                product product = new product();
                product.setProductID(rs.getInt("product_id"));
                product.setRestaurantID(rs.getInt("restaurant_id"));
                product.setProductName(rs.getString("name"));
                product.setProductDescription(rs.getString("description"));
                product.setProductPrice(rs.getLong("price"));
                product.setProductImage(rs.getString("image_url"));
                product.setProductQuantity(rs.getInt("quantity"));
                product.setStatus(rs.getBoolean("status"));
                result.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SellerProductDAOs.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public void addProduct(int productID, int restaurantID, String productName, String productDescription, long productPrice, String productImage, int productQuantity) {
        query = "INSERT INTO products(product_id ,restaurant_id, name, description, price, image_url, quantity) VALUES(?,?,?,?,?,?,?)";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, productID);
            ps.setInt(2, restaurantID);
            ps.setString(3, productName);
            ps.setString(4, productDescription);
            ps.setLong(5, productPrice);
            ps.setString(6, productImage);
            ps.setInt(7, productQuantity);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(SellerProductDAOs.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
    }
    
    public int getNewProductIDOfRestaurant(int restaurantID) {
        query = "SELECT MAX(product_id) FROM products WHERE restaurant_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, restaurantID);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SellerProductDAOs.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public void updateProduct(String productName, long productPrice, int productQuantity, boolean status, String productDescription, String productImage, int productID) {
        query = "UPDATE products SET name = ?, price = ?, quantity = ?, status = ?, description = ?, image_url = ?  WHERE product_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, productName);
            ps.setLong(2, productPrice);
            ps.setInt(3, productQuantity);
            ps.setBoolean(4, status);
            ps.setString(5, productDescription);
            ps.setString(6, productImage);
            ps.setInt(7, productID);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(SellerProductDAOs.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
    }
    
    public void deleteProduct(int productID) {
        query = "UPDATE products SET status = 'false' WHERE product_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, productID);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(SellerProductDAOs.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
    }
}
