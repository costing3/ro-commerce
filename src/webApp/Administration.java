package webApp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class Administration extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        HttpSession session = request.getSession(false);

        if (session.getAttribute("userName") != null) {
            request.getRequestDispatcher("/user-pages/adminPanel.jsp").forward(request, response);
        }
        response.sendRedirect("login");
    }
}
