package dataLayer;

import java.sql.*;

public class UserRegister {

    public boolean newUser(String sFirstName, String sLastName, String sUserName, String sUserPassword,  Integer age, String country, String city, Integer zipcode, String address) {

        boolean isNewUser = true;

        Connection conn;
        String sql;
        Statement stmt = null;

        ResultSet rs;
        try {
            Class.forName("com.mysql.jdbc.Driver");

            conn = DriverManager.getConnection(DBConnector.DB_URL, DBConnector.USER, DBConnector.PASS);

            stmt = conn.createStatement();
            sql = "SELECT * FROM customers WHERE username = '" + sUserName + "'";

            System.out.println(">> [DEBUG][Executing SQL]: " + sql);

            rs = stmt.executeQuery(sql);


            if (!rs.next()) {
                System.out.println(">> "+ sFirstName +" has registered. ");
                sql = "INSERT INTO customers (firstname, lastname, username, password, age, country, city, zipcode, address) " +
                        "values ('" + sFirstName + "', '" + sLastName + "', '" + sUserName + "', MD5('" + sUserPassword + "'), '"+ age +"', '"+ country +"', '"+ city +"', '"+ zipcode +"', '"+ address +"' );";
                
                System.out.println(">> [DEBUG][Executing SQL]: " + sql);

                stmt.executeUpdate(sql);

            } else
                isNewUser = false;
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
        return isNewUser;
    }
}
