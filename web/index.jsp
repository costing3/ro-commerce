<%@ page import="java.util.Date" %>
<%@include file="includes/header.jsp" %>
<%--================================================================================================================--%>
  Welcome, customer!

  <%
    Date today = new Date();
    out.print("<h2>" + today.toString() + "</h2>");
  %>

  <p>
    <h3>
      <a href="login.jsp">How about you go to the login page? </a>
    </h3>
  </p>

<%--================================================================================================================--%>
<%@include file="includes/footer.jsp" %>
