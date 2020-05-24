package dataLayer;

import javax.servlet.http.HttpServlet;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class Product {

    Integer ID;
    String name;
    Double price;
    Integer quantity;
    Float rating;
    String description;
    String imageLink;
    static final String defaultImage="images/placeholder.png";

    public Product() {}

    public void setID(Integer ID){
        this.ID = ID;
    }
    public void setName(String name){
        this.name = name;
    }
    public void setPrice(double price){
        this.price = price;
    }
    public void setQuantity(Integer quantity){
        this.quantity = quantity;
    }
    public void setRating(Float rating){
        this.rating = rating;
    }
    public void setDescription(String description){
        this.description = description;
    }
    public void setImageLink(String imageLink) {
        this.imageLink = imageLink;
    }

    public Integer getID(){
        return ID;
    }
    public String getName(){
        return name;
    }
    public Double getPrice() {
        return price;
    }
    public Integer getQuantity() {
            return quantity;
    }
    public Float getRating() {
            return rating;
    }
    public String getDescription() {
            return description;
    }
    public String getImageLink() {
        if(imageLink != null)
            return imageLink;
        else return defaultImage;
    }

    public List<Product> getProducts(String searchString, Integer categoryID) {
        List<Product> productArrayList = new ArrayList<>();

        Connection conn;
        String sql = null;
        Statement stmt = null;

        ResultSet rs = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");

            conn = DriverManager.getConnection(DBConnector.DB_URL, DBConnector.USER, DBConnector.PASS);

            stmt = conn.createStatement();
            if (categoryID == null) {
                sql = "SELECT product_id,name,price,quantity,image_link FROM products where name LIKE '%" + searchString + "%';";

                rs = stmt.executeQuery(sql);
                System.out.println(">> Searching for products by '" + searchString);

                while (rs.next()) {
                    Product item = new Product();
                    item.setID(rs.getInt(1));
                    item.setName(rs.getString(2));
                    item.setPrice(rs.getDouble(3));
                    item.setQuantity(rs.getInt(4));
                    item.setImageLink(rs.getString(5));
                    productArrayList.add(item);
                }
            } else if (searchString == null) {
                sql = "SELECT product_id,name,price,quantity,image_link FROM products where category_id = " + categoryID + ";";
                rs = stmt.executeQuery(sql);
                System.out.println(">> Searching for products by categoryID = '" + categoryID);
                while (rs.next()) {
                    Product item = new Product();
                    item.setID(rs.getInt(1));
                    item.setName(rs.getString(2));
                    item.setPrice(rs.getDouble(3));
                    item.setQuantity(rs.getInt(4));
                    item.setImageLink(rs.getString(5));
                    productArrayList.add(item);
                }
            }
            System.out.println(">>[DEBUG]: SQL: "+sql);
            assert rs != null;
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

    public Product getProduct(Integer productID) {
        Product myProduct = new Product();

        Connection conn;
        String sql;
        Statement stmt;

        ResultSet rs;
        try {
            Class.forName("com.mysql.jdbc.Driver");

            conn = DriverManager.getConnection(DBConnector.DB_URL, DBConnector.USER, DBConnector.PASS);

            stmt = conn.createStatement();
            sql = "SELECT product_id,name,price,quantity,rating,description,image_link FROM products where product_id = " + productID + "";
            rs = stmt.executeQuery(sql);
            System.out.println(">> Getting details for product no." + productID);

            while (rs.next()) {
                myProduct.setID(rs.getInt(1));
                myProduct.setName(rs.getString(2));
                myProduct.setPrice(rs.getDouble(3));
                myProduct.setQuantity(rs.getInt(4));
                myProduct.setRating(rs.getFloat(5));
                myProduct.setDescription(rs.getString(6));
                myProduct.setImageLink(rs.getString(7));
            }
            rs.close();

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return myProduct;
    }
}
