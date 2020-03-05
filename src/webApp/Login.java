package webApp;

import appLayer.UserValidation;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class Login extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        UserValidation userObject = new UserValidation();

        if (userObject.correctCredentials(request.getParameter("username"),request.getParameter("password"))) {

            HttpSession session = request.getSession(false);
            session.setAttribute("uID",request.getParameter("username")); //TODO: Get more info about the logged in user
            session.setAttribute("uCartItems", 0); //TODO: Get info from database or set to 0 on login & logout?
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
