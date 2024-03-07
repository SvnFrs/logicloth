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
    List<restaurant> books = new ArrayList<>();
    String query = "";

    public RestaurantDAOs() {
        conn = ConnectingDB.getConnection();
    }
    @Override
    public List<restaurant> getAll() {
        ArrayList<restaurant> result = new ArrayList<>();
        String query = "SELECT * FROM dacfood.public.restaurants";
        try {
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                restaurant restaurant = new restaurant();
                restaurant.setRestaurantID(rs.getInt("restaurant_id"));
                restaurant.setRestaurantName(rs.getString("name"));
                restaurant.setRestaurantDescription(rs.getString("description"));
                restaurant.setRestaurantAddress(rs.getString("address"));
                result.add(restaurant);
            }
        } catch (SQLException ex) {
            Logger.getLogger(RestaurantDAOs.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
        return result;
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
