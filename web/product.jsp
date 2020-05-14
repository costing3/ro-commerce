<%@ page import="dataLayer.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Product myProduct = (Product) request.getAttribute("MyProduct");
    session.setAttribute("title", myProduct.getName());
    //TODO: Create a bloody 404 not found page

%> <%-- Load the product info & temporarly set the title --%>
<%@include file="includes/header.jsp" %>
<%--================================================================================================================--%>

Hi, want this product? <br>
<%
    out.print("Photo: <img src=\""+ myProduct.getImageLink()+ "\"width=\"200\" height=\"200\"><hr>");
    out.print("Name: " + myProduct.getName());
    out.print("<br>Price " + myProduct.getPrice());
    out.print("<br>Desc " + myProduct.getDescription());
    out.print("<form action=\"cart\" method=\"post\" >\n" +
            "        <input type=\"hidden\" value=\"" + myProduct.getID() + "\" name=\"idul\">\n" +
" <input type=\"submit\" value=\"ADD TO CART\">\n" +
" </form>\n");
%>


<%--================================================================================================================--%>
<%@include file="includes/footer.jsp" %>
