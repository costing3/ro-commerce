package dataLayer;

import java.sql.*;

public class User {

    Integer customerID;
    String username;
    String email;
    String firstName;
    String lastName;
    Integer age;
    String country;
    String city;
    Integer zipCode;
    String address;

    public User() {}

    public void setCustomerID(Integer customerID) {
        this.customerID = customerID;
    }
    public void setUsername(String username) {
        this.username = username;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }
    public void setAge(Integer age) {
        this.age = age;
    }
    public void setCountry(String country) {
        this.country = country;
    }
    public void setCity(String city) {
        this.city = city;
    }
    public void setZipCode(Integer zipCode) {
        this.zipCode = zipCode;
    }
    public void setAddress(String address) {
        this.address = address;
    }

    public Integer getCustomerID() {
        return customerID;
    }
    public String getUsername() {
        return username;
    }
    public String getEmail() {
        return email;
    }
    public String getFirstName() {
        return firstName;
    }
    public String getLastName() {
        return lastName;
    }
    public Integer getAge() {
        return age;
    }
    public String getCountry() {
        return country;
    }
    public String getCity() {
        return city;
    }
    public Integer getZipCode() {
        return zipCode;
    }
    public String getAddress() {
        return address;
    }

    public User getUserDetailsByID(Integer customerID) {
        User myCustomer = new User();

        Connection conn;
        String sql;
        Statement stmt;

        ResultSet rs;
        try {
            Class.forName("com.mysql.jdbc.Driver");

            conn = DriverManager.getConnection(DBConnector.DB_URL, DBConnector.USER, DBConnector.PASS);

            stmt = conn.createStatement();
            sql = "SELECT username, email, firstname, lastname, age, country, city, zipcode, address  FROM customers where customer_id = " + customerID + "";
            rs = stmt.executeQuery(sql);
            System.out.println(">> Getting user details for `" + username + "`");

            while (rs.next()) {
                myCustomer.setUsername(rs.getString(1));
                myCustomer.setEmail(rs.getString(2));
                myCustomer.setFirstName(rs.getString(3));
                myCustomer.setLastName(rs.getString(4));
                myCustomer.setAge(rs.getInt(5));
                myCustomer.setCountry(rs.getString(6));
                myCustomer.setCity(rs.getString(7));
                myCustomer.setZipCode(rs.getInt(8));
                myCustomer.setAddress(rs.getString(9));
            }
            rs.close();

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return myCustomer;
    }

    public User getUserDetailsByName(String username){
        User myCustomer = new User();

        Connection conn;
        String sql;
        Statement stmt;

        ResultSet rs;
        try {
            Class.forName("com.mysql.jdbc.Driver");

            conn = DriverManager.getConnection(DBConnector.DB_URL, DBConnector.USER, DBConnector.PASS);

            stmt = conn.createStatement();
            sql = "SELECT customer_id, username, firstname, lastname, age, country, city, zipcode, address  FROM customers where username = '" + username + "'";
            rs = stmt.executeQuery(sql);
            System.out.println("\n>> Getting user details for `" + username + "`");

            while (rs.next()) {
                myCustomer.setCustomerID(rs.getInt(1));
                myCustomer.setEmail(rs.getString(2));
                myCustomer.setFirstName(rs.getString(3));
                myCustomer.setLastName(rs.getString(4));
                myCustomer.setAge(rs.getInt(5));
                myCustomer.setCountry(rs.getString(6));
                myCustomer.setCity(rs.getString(7));
                myCustomer.setZipCode(rs.getInt(8));
                myCustomer.setAddress(rs.getString(9));
            }
            rs.close();

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return myCustomer;
    }
}
