package DAOs;

import ConnectDB.ConnectingDB;

import Model.sale;

import java.sql.*;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class SaleDAOs {
    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    String query = "";

    public SaleDAOs() {
        conn = ConnectingDB.getConnection();
    }

    public void insertSale(int saleID, int productID, int quantity, double total, Date date) {
        query = "INSERT INTO restaurantsales (sales_id, product_id, quantity, total_sales, date) VALUES (?, ?, ?, ?, ?)";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, saleID);
            ps.setInt(2, productID);
            ps.setInt(3, quantity);
            ps.setDouble(4, total);
            ps.setDate(5, date);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(SaleDAOs.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public int generateSaleID() {
        int saleID = 0;
        String query = "SELECT MAX(sales_id) FROM restaurantsales";
        try {
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                saleID = rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SaleDAOs.class.getName()).log(Level.SEVERE, null, ex);
        }
        return saleID + 1;
    }

    public List<sale> getAllSaleIDByRestaurantID(int restaurantID) {
        List<sale> sales = new ArrayList<>();
        query = "SELECT sales_id FROM restaurantrecords WHERE restaurant_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, restaurantID);
            rs = ps.executeQuery();
            while (rs.next()) {
                sale sale = new sale();
                sale.setSaleID(rs.getInt("sales_id"));
                sales.add(sale);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SaleDAOs.class.getName()).log(Level.SEVERE, null, ex);
        }
        return sales;
    }
    
    public List<sale> getAllSaleBySaleIDs(List<sale> saleIDs) {
        List<sale> sales = new ArrayList<>();
        for (sale sale : saleIDs) {
            query = "SELECT * FROM restaurantsales WHERE sales_id = ?";
            try {
                ps = conn.prepareStatement(query);
                ps.setInt(1, sale.getSaleID());
                rs = ps.executeQuery();
                while (rs.next()) {
                    sale sale1 = new sale();
                    sale1.setSaleID(rs.getInt("sales_id"));
                    sale1.setProductID(rs.getInt("product_id"));
                    sale1.setQuantity(rs.getInt("quantity"));
                    sale1.setTotalSale(rs.getLong("total_sales"));
                    sale1.setSaleDate(rs.getString("date"));
                    sales.add(sale1);
                }
            } catch (SQLException ex) {
                Logger.getLogger(SaleDAOs.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return sales;
    }
    
    public List<sale> getAllSaleBySaleID(sale saleID) {
        List<sale> sales = new ArrayList<>();
        query = "SELECT * FROM restaurantsales WHERE sales_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, saleID.getSaleID());
            rs = ps.executeQuery();
            while (rs.next()) {
                sale sale = new sale();
                sale.setSaleID(rs.getInt("sales_id"));
                sale.setProductID(rs.getInt("product_id"));
                sale.setQuantity(rs.getInt("quantity"));
                sale.setTotalSale(rs.getLong("total_sales"));
                sale.setSaleDate(rs.getString("date"));
                sales.add(sale);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SaleDAOs.class.getName()).log(Level.SEVERE, null, ex);
        }
        return sales;
    }
}
