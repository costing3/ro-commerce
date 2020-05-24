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

        if (userObject.newUser(request.getParameter("firstname"),request.getParameter("lastname"),request.getParameter("username"),request.getParameter("password"))) {
            request.setAttribute("successMessage", "<div class=\"alert alert-success alert-dismissible fade show\" role=\"alert\">\n" +
                    "  <div style=\"text-align: center;\"><strong>Yay!</strong></div>The account has been created!<br>You can now log in." +
                    "  <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">\n" +
                    "    <span aria-hidden=\"true\">&times;</span>\n" +
                    "  </button>\n" +
                    "</div>");
        } else {
            request.setAttribute("errorMessage","<div class=\"alert alert-danger alert-dismissible fade show\" role=\"alert\">\n" +
                    "  <div style=\"text-align: center;\"><strong>Error!</strong></div>There is an account with that username!<br>Try to Login instead -or- <br>Recover your password!" +
                    "  <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">\n" +
                    "    <span aria-hidden=\"true\">&times;</span>\n" +
                    "  </button>\n" +
                    "</div>");
        }
        response.sendRedirect("login");
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/register.jsp").forward(request, response);
    }
}
