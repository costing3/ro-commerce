//package dataLayer;
//
//import java.sql.*;
//import java.util.ArrayList;
//import java.util.List;
//
//
//public class UserCart {
//
//    Integer cartID;
//    Integer customerID;
//    List<UserCart> products;
//    Integer product0Count;
//    Integer product1;
//    Integer product1Count;
//    Integer product2;
//    Integer product2Count;
//    Integer product3;
//    Integer product3Count;
//    Integer product4;
//    Integer product4Count;
//    Integer product5;
//    Integer product5Count;
//    Integer product6;
//    Integer product6Count;
//    Integer product7;
//    Integer product7Count;
//    Integer product8;
//    Integer product8Count;
//    Integer product9;
//    Integer product9Count;
//
//    public UserCart() {}
//
//    public void setCartID(Integer cartID){
//        this.cartID = cartID;
//    }
//    public void setCustomerID(Integer customerID){
//        this.customerID = customerID;
//    }
//    public void setProducts(List<UserCart> products){
//        this.products = products;
//    }
//
//    public Integer getCartID(){
//        return cartID;
//    }
//    public Integer getCustomerID(){
//        return customerID;
//    }
//    public List<UserCart> products() {
//        return products;
//    }
//
//    public List<UserCart> getCartProducts(Integer customerID) {
//        List<UserCart> productArrayList = new ArrayList<>();
//
//        Connection conn;
//        String sql;
//        Statement stmt = null;
//
//        ResultSet rs;
//        try {
//            Class.forName("com.mysql.jdbc.Driver");
//
//            conn = DriverManager.getConnection(DBConnector.DB_URL, DBConnector.USER, DBConnector.PASS);
//
//            stmt = conn.createStatement();
//            sql = "SELECT cart_id,customer_id,product0_id,product0_count,product1_id,product1_count,product2_id,product2_count,product3_id,product3_count,product4_id,product4_count,product5_id,product5_count,product6_id,product6_count,product7_id,product7_count,product8_id,product8_count,product9_id,product9_count FROM shoppingcarts where customer_id = "+ customerID +"";
//            rs = stmt.executeQuery(sql);
//            System.out.println(">> Getting cart details for user #" + customerID + "'");
//
//            while (rs.next()) {
//
//                item.setID(rs.getInt(1));
//                item.setName(rs.getString(2));
//                item.setPrice(rs.getDouble(3));
//                item.setQuantity(rs.getInt(4));
//                item.setImageLink(rs.getString(5));
//                productArrayList.add(item);
//            }
//            rs.close();
//
//        } catch (ClassNotFoundException | SQLException e) {
//            e.printStackTrace();
//        } finally {
//            try {
//                if (stmt != null)
//                    stmt.close();
//            } catch (SQLException se) {
//                se.printStackTrace();
//            }
//        }
//        return productArrayList;
//    }
//}
