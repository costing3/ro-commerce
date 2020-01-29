    package webApp;

    import appLayer.UserValidation;

    import javax.servlet.ServletException;
    import javax.servlet.http.HttpServlet;
    import javax.servlet.http.HttpServletRequest;
    import javax.servlet.http.HttpServletResponse;
    import java.io.IOException;

    public class Login extends HttpServlet {
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

            UserValidation userObject = new UserValidation();

            request.setAttribute("user",  request.getParameter("username")); //new variable "user" = login's input field called "username"
            request.setAttribute("pass",  request.getParameter("password")); //new variable "pass" = login's input field called "password"

            if (userObject.correctCredentials(request.getParameter("username"),request.getParameter("password")))
                request.getRequestDispatcher("/WEB-INF/welcome.jsp").forward(request,response);
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
        protected void doGet(HttpServletRequest request, HttpServletResponse response) {}
    }
