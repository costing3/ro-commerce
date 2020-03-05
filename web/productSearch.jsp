<%@ page import="dataLayer.Product" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="includes/header.jsp" %>
<%--================================================================================================================--%>

<table class="table table-striped">
    <thead>
        <tr>
            <th scope="col">Name</th>
            <th scope="col">Price</th>
            <th scope="col">Description</th>
        </tr>
    </thead>
    <tbody>

            <%
                List<Product> products = (List<Product>) request.getAttribute("uSearchedProducts");

                for (Product product:products) {
                    out.print("<tr>");
                        out.print("<td>" + product.getName() + "</td>");
                        out.print("<td>" + product.getPrice() + "</td>");
                        out.print("<td>" + product.getDescription() + "</td>");
                    out.print("</td>");
                }
            %>
        </tbody>
</table>
<%--================================================================================================================--%>
<%@include file="includes/footer.jsp" %>
