package dataLayer;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Product {

    String name;
    Double price;
    String description;

//    Product(String name, Double price, String description){
//        this.name = name;
//        this.price = price;
//        this.description = description;
//    }



    public Product() {}

    public void setName(String name){
        this.name = name;
    }

    public void setPrice(double price){
        this.price = price;
    }

    public void setDescription(String description){
        this.description = description;
    }

    public String getName(){
        return name;
    }
    public Double getPrice() {
        return price;
    }
    public String getDescription() {
        return description;
    }

    public List<Product> getProducts(String searchString) {

        List<Product> productArrayList = new ArrayList<>();

        Connection conn;
        String sql;
        Statement stmt = null;

        ResultSet rs;
        try {
            Class.forName("com.mysql.jdbc.Driver");

            conn = DriverManager.getConnection(DBConnector.DB_URL, DBConnector.USER, DBConnector.PASS);

            stmt = conn.createStatement();
            sql = "SELECT name,price,description FROM products where name LIKE '%"+ searchString +"%';";

            rs = stmt.executeQuery(sql);
            System.out.println(">> Returning products for requested querry: " + sql);
            while (rs.next()) {
                Product item = new Product();
                System.out.println(">> Got: ");
                item.setName(rs.getString(1));
                System.out.println(rs.getString(1));
                item.setPrice(rs.getDouble(2));
                System.out.println(rs.getString(2));
                item.setDescription(rs.getString(3));
                System.out.println(rs.getString(3));
                System.out.println("_____________");
                productArrayList.add(item);
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
        return productArrayList;
    }
}
