<%@ page import="dataLayer.Product" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="includes/header.jsp" %>
<% session.setAttribute("query",request.getParameter("query")); %>
<%-- For the back button ^^ --%>
<%--================================================================================================================--%>
<section class="section-name padding-y-sm">
    <div class="container">

            <h5 class="card-title" style="margin-right:30%">Your results for "<i><% out.print(request.getParameter("query")); %></i>":</h5>

            <%
                List<Product> products = (List<Product>) request.getAttribute("uSearchedProducts");
                int results = 0;
                out.print("<div class=\"row\">");
                for (Product product:products) {
                    out.print("<div class=\"col-md-3\">\n" +
                            "                <div href=\"#\" class=\"card card-product-grid\">\n" +
                            "                    <a href=\"product?id="+ product.getID() +"\" class=\"img-wrap\"> <img src=\""+ product.getImageLink() +"\" width=\"200\" height=\"200\"></a>\n" +
                            "            <figcaption class=\"info-wrap\">\n");
                    if(product.getName().length()>54)
                         out.print("<a href=\"product?id="+ product.getID() +"\" class=\"title\" data-toggle=\"tooltip\" title=\""+ product.getName() +"\">"+ product.getName().substring(0,50) +"...<hr></a>");
                    else
                        if(product.getName().length()<30)
                            out.print("<a href=\"product?id="+ product.getID() +"\" class=\"title\">"+ product.getName() +"<br>&nbsp;<hr></a>");
                        else out.print("<a href=\"product?id="+ product.getID() +"\" class=\"title\">"+ product.getName() +"<br><hr></a>");

                    out.print("<div class=\"price mt-1\">RON "+ product.getPrice() +"</div>");

                    int quantity = product.getQuantity();
                    if(quantity>=1) out.print("<p style=\"color: green;\"> In Stock </p>");
                    else out.print("<p style=\"color: red;\"> Out of Stock </p>");

                    out.print("</figcaption>\n" +
                            "        </div>\n" +
                            "    </div>");

                    results ++;
                    if(results%4 == 0) //TODO: DOCUMENT THIS
                        out.print("<br><hr></tr>");
                }
                out.print("</div>");
            %>
    </div><!-- container // -->
</section>
<%--================================================================================================================--%>
<script>
    $(document).ready(function(){ //TODO: Document this (TOOLTIP)
        $('[data-toggle="tooltip"]').tooltip();
    });
</script>

