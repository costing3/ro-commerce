<%@ page import="java.util.Date" %>
<%@include file="includes/header.jsp" %>
<%--================================================================================================================--%>

<br><br><br><br>
  <%
    Date today = new Date();
    out.print("<h2>" + today.toString() + "</h2>");
  %>

    <h3>
      <a href="login.jsp">How about you go to the login page? </a>
    </h3>
<%--================================================================================================================--%>
<%@include file="includes/footer.jsp" %>
