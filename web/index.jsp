<%@ page import="java.util.Date" %>
<%@include file="includes/header.jsp" %>
<%--================================================================================================================--%>

    <div class="card text-center">
      <div class="card-header">
        Featured
      </div>
      <div class="card-body">
        <h5 class="card-title">Special title treatment</h5>
        <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
        <a href="#" class="btn btn-primary">Go somewhere</a>
      </div>
      <div class="card-footer text-muted">
        2 days ago
      </div>
    </div>
    <h3>
      <a href="login.jsp">How about you go to the login page? </a>
    </h3>

    <%
      Date today = new Date();
      out.print("<h2>" + today.toString() + "</h2>");
    %>
<%--================================================================================================================--%>
<%@include file="includes/footer.jsp" %>
