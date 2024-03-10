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
}
