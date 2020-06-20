<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Costin
  Date: 25-May-20
  Time: 02:00
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../includes/header.jsp" %>

${warningMessage} ${successMessage}
<%--  display the message in the session variable --%>
<%
    session.setAttribute("warningMessage",null);  //then clean up
    session.setAttribute("successMessage",null);  //after yourself

    Product product = new Product();
    List<Product> homepageProducts;
    if(session.getAttribute("homepageProducts")==null){
        homepageProducts = product.getNewestProducts();
    }else homepageProducts = (List<Product>) session.getAttribute("homepageProducts");

%>

<section class="section-name padding-y-sm">
    <div class="container">
        <header class="section-heading">
            <h3 class="section-title">Latest Products</h3>
        </header><!-- sect-heading -->


        <div class="row">
            <%
                for (Product homepageProduct:homepageProducts) {
                    out.print("<div class=\"col-md-3\">\n" +
                            "                <div href=\"#\" class=\"card card-product-grid\">\n" +
                            "                    <a href=\"product?id="+ homepageProduct.getID() +"\" class=\"img-wrap\">");
                    out.print("<img src=\"" + homepageProduct.getImageLink() + "\"> </a>");
                    out.print("<figcaption class=\"info-wrap\">\n" +
                            "                        <a href=\"product?id="+ homepageProduct.getID() +"\" class=\"title\">");
                    if(homepageProduct.getName().length()>54){
                        out.print(homepageProduct.getName().substring(0,50));
                        out.print("...</a>");
                    } else {
                        out.print(homepageProduct.getName());
                        out.print("</a>");
                    }
                    out.print("<div class=\"price mt-1\">RON "+ homepageProduct.getPrice() +"</div>");
                    out.print("</figcaption>\n" +
                            "                </div>\n" +
                            "            </div>");
                }

            %>
        </div> <!-- row.// -->

    </div><!-- container // -->
</section>
<!-- ========================= SECTION  END// ========================= -->


<!-- ========================= SECTION  ========================= -->

<!-- ========================= SECTION  END// ======================= -->
<%@include file="../includes/footer.jsp" %>
