package dataLayer;

import java.sql.*;

public class UserLogin {

    public boolean validateCredentials(String sUserName, String sUserPassword) {

        boolean isValidUser = false;

        Connection conn;
        String sql;
        Statement stmt = null;

        ResultSet rs;
        try {
            Class.forName("com.mysql.jdbc.Driver");

            System.out.println(">> [LOGIN] Opening DB Connection...");
            conn = DriverManager.getConnection(DBConnector.DB_URL, DBConnector.USER, DBConnector.PASS);

            stmt = conn.createStatement();
            sql = "SELECT * FROM customers WHERE username = '" + sUserName + "' AND password = MD5('" + sUserPassword + "')";

            System.out.println(sql);

            rs = stmt.executeQuery(sql);

            if (rs.next())
                isValidUser = true;

            rs.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null)
                    stmt.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }

        return isValidUser;
    }
}
