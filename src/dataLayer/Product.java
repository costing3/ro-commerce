package dataLayer;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class Product {

    Integer ID;
    String name;
    Integer price;
    Integer quantity;
    Float rating;
    Integer orders;
    String description;
    String modelNo;
    String color;
    String other;
    String imageLink;
    static final String defaultImage="images/placeholder.png";

    public Product() {}

    public void setID(Integer ID){
        this.ID = ID;
    }
    public void setName(String name){
        this.name = name;
    }
    public void setPrice(Integer price){
        this.price = price;
    }
    public void setQuantity(Integer quantity){
        this.quantity = quantity;
    }
    public void setRating(Float rating){
        this.rating = rating;
    }
    public void setOrders(Integer orders){
        this.orders = orders;
    }
    public void setDescription(String description){
        this.description = description;
    }
    public void setModelNo(String modelNo){
        this.modelNo = modelNo;
    }
    public void setColor(String color){
        this.color = color;
    }
    public void setOther(String other){
        this.other = other;
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
    public Integer getPrice() {
        return price;
    }
    public Integer getQuantity() {
            return quantity;
    }
    public Float getRating() {
            return rating;
    }
    public Integer getOrders() {
            return orders;
    }
    public String getDescription() {
            return description;
    }
    public String getModelNo() {
            return modelNo;
    }
    public String getColor() {
            return color;
    }
    public String getOther() {
            return other;
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
            } else if (searchString == null) {
                sql = "SELECT product_id,name,price,quantity,image_link FROM products where category_id = " + categoryID + ";";
                rs = stmt.executeQuery(sql);
                System.out.println(">> Searching for products by categoryID = '" + categoryID);

            }
            while (rs.next()) {
                Product item = new Product();
                item.setID(rs.getInt(1));
                item.setName(rs.getString(2));
                item.setPrice(rs.getInt(3));
                item.setQuantity(rs.getInt(4));
                item.setImageLink(rs.getString(5));
                productArrayList.add(item);
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

    public List<Product> getNewestProducts(){
        List<Product> productArrayList = new ArrayList<>();

        Connection conn;
        String sql = null;
        Statement stmt = null;

        ResultSet rs = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");

            conn = DriverManager.getConnection(DBConnector.DB_URL, DBConnector.USER, DBConnector.PASS);

            stmt = conn.createStatement();
                sql = "SELECT product_id,name,price,quantity,image_link FROM products where quantity>0 ORDER BY product_id DESC LIMIT 8 ";

                rs = stmt.executeQuery(sql);
                System.out.println(">> Getting newest products");

                while (rs.next()) {
                    Product item = new Product();
                    item.setID(rs.getInt(1));
                    item.setName(rs.getString(2));
                    item.setPrice(rs.getInt(3));
                    item.setQuantity(rs.getInt(4));
                    item.setImageLink(rs.getString(5));
                    productArrayList.add(item);
                }
            System.out.println(">>[DEBUG]: SQL: "+sql);
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
            sql = "SELECT product_id,name,price,quantity,rating,orders,description,model_no,color,other,image_link FROM products where product_id = " + productID + "";
            rs = stmt.executeQuery(sql);
            System.out.println(">> Getting details for product no." + productID);

            while (rs.next()) {
                myProduct.setID(rs.getInt(1));
                myProduct.setName(rs.getString(2));
                myProduct.setPrice(rs.getInt(3));
                myProduct.setQuantity(rs.getInt(4));
                myProduct.setRating(rs.getFloat(5));
                myProduct.setOrders(rs.getInt(6));
                myProduct.setDescription(rs.getString(7));
                myProduct.setModelNo(rs.getString(8));
                myProduct.setColor(rs.getString(9));
                myProduct.setOther(rs.getString(10));
                myProduct.setImageLink(rs.getString(11));
            }
            rs.close();

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return myProduct;
    }

    public List<Product> getOrderedProducts(Integer userID) {
        List<Product> productArrayList = new ArrayList<>();

        Connection conn;
        String sql = null;
        Statement stmt = null;

        ResultSet rs = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");

            conn = DriverManager.getConnection(DBConnector.DB_URL, DBConnector.USER, DBConnector.PASS);

            stmt = conn.createStatement();
            sql = "SELECT order_id, product1_id, product2_id, product3_id, product4_id, product5_id, product6_id FROM orders where customer_id = " + userID + ";";

            rs = stmt.executeQuery(sql);
            System.out.println(">> Searching for user #" + userID + "'s ordered products");

            while (rs.next()) {
                Product item = new Product();
                item = item.getProduct((rs.getInt(2)));
                productArrayList.add(item);
                item = item.getProduct((rs.getInt(3)));
                productArrayList.add(item);
                item = item.getProduct((rs.getInt(4)));
                productArrayList.add(item);
                item = item.getProduct((rs.getInt(5)));
                productArrayList.add(item);
                item = item.getProduct((rs.getInt(6)));
                productArrayList.add(item);
            }

            System.out.println(">>[DEBUG]: SQL: " + sql);
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
