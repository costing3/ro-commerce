package appLayer;

import dataLayer.*;

public class UserValidation {

    public boolean correctCredentials(String sUserName, String sUserPassword){

        UserLogin DB_User = new UserLogin();

        return DB_User.validateCredentials(sUserName,sUserPassword);
    }

    public boolean newUser(String sFirstName, String sLastName, String sUserName, String sUserPassword, Integer age, String country, String city, Integer zipcode, String address){

        UserRegister DB_User = new UserRegister();

        return DB_User.newUser(sFirstName, sLastName, sUserName, sUserPassword, age, country, city, zipcode, address);
    }
}
