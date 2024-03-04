/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ConnectDB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author admin
 */
public class ConnectingDB {
    private static Connection conn;

    public static Connection getConnection() {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;"
                    + "databaseName=D&CFood;"
                    + "user=sa;password=1223;"
                    + "encrypt=true;"
                    + "trustServerCertificate=true;");

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ConnectingDB.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("NO Connection");
        } catch (SQLException ex) {
            Logger.getLogger(ConnectingDB.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("err");
        }

        return conn;
    }

    public static void main(String[] args) {
        getConnection();
    }
}
