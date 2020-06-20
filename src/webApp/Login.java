package webApp;

import appLayer.UserValidation;
import dataLayer.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class Login extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        UserValidation userValidation = new UserValidation();
        User myUser = new User();

        if (userValidation.correctCredentials(request.getParameter("username"),request.getParameter("password"))) {
            myUser = myUser.getUserDetailsByName(request.getParameter("username"));

            HttpSession session = request.getSession(true);

            if (request.getParameter("rememberMe")==null)
                session.setMaxInactiveInterval(600); // The session will expire in 10 minutes, starting from user's last request
            session.setAttribute("userID",myUser.getCustomerID());
            session.setAttribute("userName",myUser.getEmail());
            session.setAttribute("firstName",myUser.getFirstName());
            session.setAttribute("lastName",myUser.getLastName());
            session.setAttribute("address",myUser.getAddress());
            session.setAttribute("city",myUser.getCity());
            session.setAttribute("zipcode",myUser.getZipCode());
            session.setAttribute("uCartItems", 0);

            response.sendRedirect("homepage");
        }
        else {
            request.setAttribute("errorMessage", "<div class=\"alert alert-danger alert-dismissible fade show\" role=\"alert\">\n" +
                    "  <strong>Error!<br></strong>Wrong username or password!\n" +
                    "  <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">\n" +
                    "    <span aria-hidden=\"true\">&times;</span>\n" +
                    "  </button>\n" +
                    "</div>");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/login.jsp").forward(request, response);
    }
}
