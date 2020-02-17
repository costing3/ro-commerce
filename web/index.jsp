<%--
  Created by IntelliJ IDEA.
  User: Costin
  Date: 17-Feb-20
  Time: 23:48
--%>
<%
    String redirectURL = "homepage";
    response.sendRedirect(redirectURL);
%>
<html>
<head>
    <title>Redirect File</title>
</head>
<body>
<p><i>You've been redirected. </i></p>
<%-- This pages ensures that the user is always getting redirected to "/homepage" --%>
</body>
</html>
