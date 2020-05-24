<%@ page import="dataLayer.Product" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="includes/header.jsp" %>
<%--================================================================================================================--%>

<div style="text-align: center;">
    <div class="card">
        <div class="card-body">
            <h5 class="card-title" style="margin-right:30%">Your results for "<i><% out.print(request.getParameter("query")); %></i>":</h5>

            <%
                List<Product> products = (List<Product>) request.getAttribute("uSearchedProducts");
                int results = 0;
                out.print("<table class=\"center\"><tr>");
                for (Product product:products) {
                    out.print("<td><div class=\"card text-center\" style=\"width: 18rem; display: inline-block; margin-right:1rem; margin-left:1rem; margin-top:1rem; margin-bottom:1rem\">");
                    out.print("<div class=\"card-body\">");

                    // TODO: dynamic image
                    out.print("<a href=\"product?id="+ product.getID() +"\"><img src=\""+ product.getImageLink()+ "\"width=\"200\" height=\"200\"></a><hr>");

                    if(product.getName().length()>89) out.print("<h5 class=\"card-title\"> <a id= \"title\" href=\"product?id="+ product.getID() +"\" data-toggle=\"tooltip\" title=\""+ product.getName() +"\">" + product.getName().substring(0,89) + "[...]</a></h5><hr>");
                    else out.print("<div style=\"height:81px\"><h5 class=\"card-title\"> <a id=\"title\" href=\"product?id="+ product.getID() +"\" data-toggle=\"tooltip\" title=\""+ product.getName() +"\"> " + product.getName() + "</h5></div><hr>");

                    int quantity = product.getQuantity();
                    if (quantity>=1) out.print("<hp class=\"card-text\"> <p style=\"color: green;\"> In Stock </p>");
                    else out.print("<hp class=\"card-text\"> <p style=\"color: red;\"> Not in Stock </p>");

                    out.print("<p class=\"card-text\"><b>" + product.getPrice() + "</b> RON</p>");

                    out.print("<a href=\"product?id="+ product.getID() +"\" class=\"btn btn-warning\"><i class=\"fas fa-info-circle\"></i> See details</a>");

                    out.print("</td></div></div>");

                    results ++;
                    if(results%4 == 0) //TODO: DOCUMENT THIS
                        out.print("<br><hr></tr>");
                }
                out.print("</table>");
            %>
        </div>
    </div>
</div>
<%--================================================================================================================--%>
<script>
    $(document).ready(function(){ //TODO: Document this (TOOLTIP)
        $('[data-toggle="tooltip"]').tooltip();
    });
</script>

<%@include file="includes/footer.jsp" %>
