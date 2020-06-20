package dataLayer;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

public class Order{

    Integer id;
    Integer customer;
    Integer price;
    Date date;
    List<Product> products;

    public Order() {}

    public void setId(Integer id) {
        this.id = id;
    }
    public void setCustomer(Integer customer) {
        this.customer = customer;
    }
    public void setPrice(Integer price) {
        this.price = price;
    }
    public void setDate(Date date){ this.date = date; }
    public void setProducts(List<Product> products) {
        this.products = products;
    }

    public Integer getId() {
        return id;
    }
    public Integer getCustomer() {
        return customer;
    }
    public Integer getPrice() {
        return price;
    }
    public Date getDate() { return date; }
    public List<Product> getProducts() {
        return products;
    }

    public boolean storeOrder(Integer userID, List<Product> shoppingCart, Integer value) {

        boolean orderStored = false;

        Connection conn;
        String sql;
        Statement stmt = null;


        try {
            Class.forName("com.mysql.jdbc.Driver");

            conn = DriverManager.getConnection(DBConnector.DB_URL, DBConnector.USER, DBConnector.PASS);

            stmt = conn.createStatement();
            sql = "INSERT INTO orders (customer_id, product1_id, product2_id, value, order_date) " +
                    "values ('" + userID + "', '" + shoppingCart.get(0).getID() + "', '" + shoppingCart.get(1).getID() + "', '"+ value +"', NOW());";

            System.out.println("\n>> [DEBUG][Executing SQL]: " + sql);
            orderStored = true;
            stmt.executeUpdate(sql);
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
        System.out.println("\n >> The order for User # "+ userID +" has been logged into the database");
        return orderStored;
    }

    public Vector<Integer> getUserOrdersIds(Integer userID){

        Vector<Integer> orders = new Vector<>();

        Connection conn;
        String sql;
        Statement stmt = null;

        ResultSet rs = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");

            conn = DriverManager.getConnection(DBConnector.DB_URL, DBConnector.USER, DBConnector.PASS);

            stmt = conn.createStatement();
            sql = "SELECT order_id FROM orders WHERE customer_id = '"+ userID +"'";

            System.out.println("\n>> [DEBUG][Executing SQL]: " + sql);
            rs = stmt.executeQuery(sql);

            while(rs.next()) {
                System.out.print("\n>>[HELP][DB]: " + rs.getInt(1));
                orders.add(rs.getInt(1));
            }
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
        return orders;
    }

    public List<Product> getOrderProducts(Integer orderID) {
        List<Product> productArrayList = new ArrayList<>();


        Connection conn;
        String sql1;
        String sql2;
        Statement stmt = null;

        ResultSet rs;
        try {
            Class.forName("com.mysql.jdbc.Driver");

            conn = DriverManager.getConnection(DBConnector.DB_URL, DBConnector.USER, DBConnector.PASS);
            stmt=conn.createStatement();
            sql1 = "SELECT product1_id, product2_id, product3_id, product4_id, product5_id, product6_id FROM orders where order_id = " + orderID + ";";
            sql2 = "SELECT value, order_date FROM orders where order_id = " + orderID +";";
            assert false;

            //SQL 1
            rs = stmt.executeQuery(sql1);

            while (rs.next()) {
                Product item = new Product();
                for(int index=1; index<=6; index++) {
                    if(rs.getInt(index)!=0)
                        productArrayList.add(item.getProduct(rs.getInt(index)));
                    else break;
                }
            }

            System.out.println(">>[DEBUG]: SQL: " + sql1);
            rs.close();

            //SQL 2
            rs = stmt.executeQuery(sql2);
            System.out.println(">>[DEBUG]: SQL: " + sql2);

            while(rs.next()){
                this.setPrice(rs.getInt(1));
                this.setDate(rs.getDate(2));
            }
            rs.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return productArrayList;
    }
}
