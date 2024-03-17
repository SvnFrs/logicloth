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

public class SearchDAOs {
    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    product product = new product();
    List<product> products = new ArrayList<>();
    String query = "";

    public SearchDAOs() {
        conn = ConnectingDB.getConnection();
    }
    public List<product> searchProduct(String search) {
        ArrayList<product> result = new ArrayList<>();

        String query = "SELECT * FROM products WHERE unaccent(lower(name)) LIKE unaccent(lower(?)) AND status = 'true'";
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + search + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                product product = new product();
                product.setProductID(rs.getInt("product_id"));
                product.setProductName(rs.getString("name"));
                product.setProductDescription(rs.getString("description"));
                product.setProductPrice(rs.getLong("price"));
                product.setProductImage(rs.getString("image_url"));
                product.setProductQuantity(rs.getInt("quantity"));
                result.add(product); // Add the product to the result list
            }
        } catch (SQLException ex) {
            Logger.getLogger(RestaurantDAOs.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

}
