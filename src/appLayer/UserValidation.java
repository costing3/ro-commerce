package appLayer;

import dataLayer.UserLogin;
import dataLayer.UserRegister;

public class UserValidation {

    public boolean correctCredentials(String sUserName, String sUserPassword){

        UserLogin DB_User = new UserLogin();

        return DB_User.validateCredentials(sUserName,sUserPassword);
    }

    public boolean newUser(String sFirstName, String sLastName, String sUserName, String sUserPassword){

        UserRegister DB_User = new UserRegister();

        return DB_User.newUser(sFirstName, sLastName, sUserName, sUserPassword);
    }
}
