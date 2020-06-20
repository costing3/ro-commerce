package webApp;

import appLayer.UserValidation;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class Register extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        HttpSession session = request.getSession(false);
        UserValidation userObject = new UserValidation();
        if(request.getParameter("firstname").length()>=3 && request.getParameter("lastname").length()>=3 && request.getParameter("username").length()>10 && request.getParameter("password").equals(request.getParameter("validatePassword"))) {
            if (userObject.newUser(request.getParameter("firstname"), request.getParameter("lastname"), request.getParameter("username"), request.getParameter("password"), Integer.parseInt(request.getParameter("age")), request.getParameter("country"), request.getParameter("city"), Integer.parseInt(request.getParameter("zipcode")), request.getParameter("address"))) {
                session.setAttribute("successMessage", "<div class=\"alert alert-success alert-dismissible fade show\" role=\"alert\">\n" +
                        "  <strong>Yay!</strong><br> The account has been created!<br>You can now log in." +
                        "  <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">\n" +
                        "    <span aria-hidden=\"true\">&times;</span>\n" +
                        "  </button>\n" +
                        "</div>");
            } else {
                session.setAttribute("errorMessage", "<div class=\"alert alert-danger alert-dismissible fade show\" role=\"alert\">\n" +
                        "  <strong>Error!</strong> That email address is already registered." +
                        "  <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">\n" +
                        "    <span aria-hidden=\"true\">&times;</span>\n" +
                        "  </button>\n" +
                        "</div>");
            }
            response.sendRedirect("login");
        } else {
            session.setAttribute("warningMessage", "<div class=\"alert alert-danger alert-dismissible fade show\" role=\"alert\">\n" +
                    "  <strong>Error!</strong> You have entered invalid data.<br>" +
                    "  Please check that you have completed all the fields <br>" +
                    "  with relevant information, and the passwords are the same." +
                    "  <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">\n" +
                    "    <span aria-hidden=\"true\">&times;</span>\n" +
                    "  </button>\n" +
                    "</div>");
            response.sendRedirect("register");
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/register.jsp").forward(request, response);
    }
}
