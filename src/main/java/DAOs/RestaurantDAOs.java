package DAOs;

import ConnectDB.ConnectingDB;
import Model.restaurant;


import java.sql.*;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class RestaurantDAOs implements DAO<restaurant> {
    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    restaurant restaurant = new restaurant();
    List<restaurant> restaurants = new ArrayList<>();
    String query = "";

    public RestaurantDAOs() {
        conn = ConnectingDB.getConnection();
    }
    @Override
    public List<restaurant> getAll() {
        ArrayList<restaurant> result = new ArrayList<>();
        String query = "SELECT * FROM dacfood.public.restaurants WHERE status = 'true'";
        try {
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                restaurant restaurant = new restaurant();
                restaurant.setRestaurantID(rs.getInt("restaurant_id"));
                restaurant.setRestaurantName(rs.getString("name"));
                restaurant.setRestaurantDescription(rs.getString("description"));
                restaurant.setRestaurantAddress(rs.getString("address"));
                restaurant.setRestaurantImage(rs.getString("image_url"));
                result.add(restaurant);
            }
        } catch (SQLException ex) {
            Logger.getLogger(RestaurantDAOs.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public restaurant getRestaurantByID(int id) {
        restaurant result = null;
        String query = "SELECT * FROM dacfood.public.restaurants WHERE restaurant_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, id); // set id parameter
            rs = ps.executeQuery();
            if (rs.next()) {
                result = new restaurant();
                result.setRestaurantID(rs.getInt("restaurant_id"));
                result.setRestaurantName(rs.getString("name"));
                result.setRestaurantDescription(rs.getString("description"));
                result.setRestaurantAddress(rs.getString("address"));
                result.setRestaurantImage(rs.getString("image_url"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(RestaurantDAOs.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
        return result;
    }


    public String getNameByID(int id) throws SQLException {
        String query = "SELECT name FROM dacfood.public.restaurants WHERE restaurant_id = ?";
        ps = conn.prepareStatement(query);
        ps.setInt(1, id);
        rs = ps.executeQuery();
        if (rs.next()) {
            return rs.getString("name");
        }
        return null;
    }

    @Override
    public Optional<restaurant> get(int id) {
        return Optional.empty();
    }

    @Override
    public void add(restaurant restaurant) {

    }

    @Override
    public void update(restaurant restaurant) {

    }

    @Override
    public void delete(restaurant restaurant) {

    }
}
