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

public class ProductDAOs implements DAO<product> {
    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    product product = new product();
    List<product> products = new ArrayList<>();
    String query = "";

    public ProductDAOs() {
        conn = ConnectingDB.getConnection();
    }
    @Override
    public List<product> getAll() {
        return null;
    }

    public List<product> getAllByID(int id) {
        ArrayList<product> result = new ArrayList<>();
        String query = "SELECT * FROM products WHERE restaurant_id = ? AND status = 'true'";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, id); // set id parameter
            rs = ps.executeQuery();
            while (rs.next()) {
                product product = new product();
                product.setProductID(rs.getInt("product_id"));
                product.setProductName(rs.getString("name"));
                product.setProductDescription(rs.getString("description"));
                product.setProductPrice(rs.getInt("price"));
                product.setProductImage(rs.getString("image_url"));
                product.setProductQuantity(rs.getInt("quantity"));
                result.add(product); // Add the product to the result list
            }
        } catch (SQLException ex) {
            Logger.getLogger(RestaurantDAOs.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public product getProductByID(int id) {
        product product = new product();
        String query = "SELECT * FROM products WHERE product_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, id); // set id parameter
            rs = ps.executeQuery();
            while (rs.next()) {
                product.setProductID(rs.getInt("product_id"));
                product.setProductName(rs.getString("name"));
                product.setProductDescription(rs.getString("description"));
                product.setProductPrice(rs.getInt("price"));
                product.setProductImage(rs.getString("image_url"));
                product.setProductQuantity(rs.getInt("quantity"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(RestaurantDAOs.class.getName()).log(Level.SEVERE, null, ex);
        }
        return product;
    }


    @Override
    public Optional<product> get(int id) {
        return Optional.empty();
    }

    @Override
    public void add(product product) {

    }

    @Override
    public void update(product product) {

    }

    @Override
    public void delete(product product) {

    }
}
