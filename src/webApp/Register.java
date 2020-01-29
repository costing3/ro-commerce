package webApp;

import appLayer.UserValidation;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class Register extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        UserValidation userObject = new UserValidation();

        if (userObject.newUser(request.getParameter("firstname"),request.getParameter("lastname"),request.getParameter("username"),request.getParameter("password"))) {
            request.getRequestDispatcher("/WEB-INF/welcome.jsp").forward(request,response);
        } else {

            request.setAttribute("errorMessage", "<div class=\"alert alert-danger alert-dismissible fade show\" role=\"alert\">\n" +
                    "  <div style=\"text-align: center;\"><strong>Error!</strong></div>There is an account with that username!\nTry to login instead." +
                    "  <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">\n" +
                    "    <span aria-hidden=\"true\">&times;</span>\n" +
                    "  </button>\n" +
                    "</div>");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }

    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {}
}
