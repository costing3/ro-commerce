package dataLayer;

import javax.servlet.http.HttpServlet;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CategoryDisplay extends HttpServlet {
    List<String> categoryList = new ArrayList<>();

    public List<String> getCategories() {

        Connection conn;
        String sql;
        Statement stmt = null;

        ResultSet rs;
        try {
            Class.forName("com.mysql.jdbc.Driver");

//            System.out.println(">> Getting category elements."); // Too many console messages
            conn = DriverManager.getConnection(DBConnector.DB_URL, DBConnector.USER, DBConnector.PASS);

            stmt = conn.createStatement();
            sql = "SELECT name FROM categories";

            rs = stmt.executeQuery(sql);

            System.out.println(">> Getting categories");

            while (rs.next()) {
                categoryList.add(rs.getString(1));
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
