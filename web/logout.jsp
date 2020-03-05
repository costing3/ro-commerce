<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <body>
    <%
        System.out.println(">> A user has logged out.");
        session.invalidate();
        response.sendRedirect("homepage");
    %>
    </body>
</html>
