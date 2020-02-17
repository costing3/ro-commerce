<%--
  Created by IntelliJ IDEA.
  User: Costin
  Date: 20-Jan-20
  Time: 00:48
--%>
<html>
<head>
    <title>Welcome, ${username}</title>
</head>
<body>
    <h1> Welcome back, <i>${user}</i>. Beautiful password, <u>${pass}</u>. :D</h1>
    <br> Now you will be redirected ... 1 2 3
    <%
        response.sendRedirect("");
    %>
</body>
</html>
