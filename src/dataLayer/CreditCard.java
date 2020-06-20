package dataLayer;

import java.sql.*;

public class CreditCard {

    public boolean isValidCC(String ccNumber, String ccExpMo, String ccExpYr, String cvv) {

        boolean validCC = false;

        Connection conn;
        String sql;
        Statement stmt = null;

        ResultSet rs;
        try {
            Class.forName("com.mysql.jdbc.Driver");

            conn = DriverManager.getConnection(DBConnector.DB_URL, DBConnector.USER, DBConnector.PASS);

            stmt = conn.createStatement();
            sql = "SELECT Type FROM creditcards WHERE Number="+ ccNumber +" AND Month="+ ccExpMo +" AND Year="+ ccExpYr +" AND CVV="+ cvv +";";

            System.out.println("\n>> [DEBUG][Executing SQL]: " + sql);

            rs = stmt.executeQuery(sql);

            if (rs.next()) {
                if(rs.getString(1).equals("Valid")) {
                    validCC = true;
                    System.out.println("\n>> The credit card is confirmed " + sql);
                }
                else System.out.println("\n>> The credit card is denied " + sql);
            }
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
        return validCC;
    }
}
