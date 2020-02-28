<%--
  Created by IntelliJ IDEA.
  User: Costin
  Date: 28-Feb-20
  Time: 12:15
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    session.setAttribute("userID",null);
    System.out.println(">> "+ session.getAttribute("userID") +" has logged out.");
    session.setAttribute("cartItems",0);
    response.sendRedirect("homepage");
%>
</body>
</html>
