package dataLayer;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CategoryDisplay {

    public List<String> listCategories() {
        List<String> categoryList = new ArrayList<>();

        Connection conn;
        String sql;
        Statement stmt = null;

        ResultSet rs;
        try {
            Class.forName("com.mysql.jdbc.Driver");

            System.out.println(">> Getting category elements.");
            conn = DriverManager.getConnection(DBConnector.DB_URL, DBConnector.USER, DBConnector.PASS);

            stmt = conn.createStatement();
            sql = "SELECT * FROM categories";

            rs = stmt.executeQuery(sql);

            while (rs.next()) {
                categoryList.add(rs.getString("name"));
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

        return categoryList;
    }
}
