package DAOs;

import Model.account;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class UserDAOs {
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public UserDAOs() {
        conn = ConnectDB.ConnectingDB.getConnection();
    }

    public boolean userLogin(account acc) throws SQLException {
        rs = null;
        String sql = "SELECT * FROM users WHERE username = ? AND password = ? AND role = 'user' AND status = true";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, acc.getUserName());

            // Mã hóa mật khẩu bằng MD5 trước khi so sánh
            String hashedPassword = getMD5Hash(acc.getPassword());
            ps.setString(2, hashedPassword);

            rs = ps.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs.next();
    }

    public String getMD5Hash(String input) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] messageDigest = md.digest(input.getBytes());
            StringBuilder hexString = new StringBuilder();

            for (byte b : messageDigest) {
                hexString.append(String.format("%02x", b));
            }

            return hexString.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }
}
