<%@ page import="dataLayer.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Product myProduct = (Product) request.getAttribute("MyProduct");
    session.setAttribute("title", myProduct.getName());

%> <%-- Load the product info & set the title --%>
<%@include file="includes/header.jsp" %>
<%--================================================================================================================--%>



<%--================================================================================================================--%>
<%@include file="includes/footer.jsp" %>
