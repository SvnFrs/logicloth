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
//            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
//            conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;"
//                    + "databaseName=D&CFood;"
//                    + "user=sa;password=123;"
//                    + "encrypt=true;"
//                    + "trustServerCertificate=true;");
//            String dbURL = "jdbc:postgresql://localhost:5432/dacfood";
            String dbURL = "jdbc:postgresql://postgres:5432/DaCFood";
//            String user = "IuseArch";
            String user = "postgres";
//            String pass = "btw";
            String pass = "postgres";
            Class.forName("org.postgresql.Driver"); // do not remove this line
            conn = DriverManager.getConnection(dbURL, user, pass);
            if (conn != null) {
                System.out.println("Connected");
            }
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