package webApp;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class Login extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

//        PrintWriter out = response.getWriter();
//        out.println("Oh, welcome back, <i>" + request.getParameter("username") + "</i>. Your password, <u>" + request.getParameter("password") + "</u> is nice!");

        request.setAttribute("user",  request.getParameter("username")); //new variable "user" = login's input field called "username"
        request.setAttribute("pass",  request.getParameter("password")); //new variable "pass" = login's input field called "password"

        request.getRequestDispatcher("/welcome.jsp");
    }
}
