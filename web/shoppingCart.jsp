<%@ page import="dataLayer.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@include file="includes/header.jsp" %>

<%--================================================================================================================--%>

<%--<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">--%>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="css/shoppingcart.css">
<div class="cart-wrap">
    <div class="container">
        <div class="row">
            <div class="col-lg-8">
                <div class="main-heading">Shopping Cart</div>
                <div class="table-cart">
                    <table>
                        <thead>
                        <tr>
                            <th>Image <i style="padding-left:120px;">Product</i></th>
                            <th style="padding-left:25px;">Quantity</th>
                            <th style="padding-left:50px;">Total</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <%session.setAttribute("discount",4200);
                            List<Product> cartProducts = (List<Product>) session.getAttribute("cartProducts");
                            float price=0;
                            float discount=0;
                            System.out.print("\n>> [DEBUG]cartProducts List: "+cartProducts);
                            System.out.print("\n>> [DEBUG]cartProducts from sessionAttribute: "+session.getAttribute("cartProducts"));
                            for (Product cartProduct:cartProducts) {
                                out.print("<tr>\n" +
                                        "                            <td>\n" +
                                        "                                <div class=\"display-flex align-center\">\n" +
                                        "                                    <div class=\"img-product\">");
                                out.print("<a href=\"product?id="+cartProduct.getID()+"\" style=\"text-decoration: none;\">");
                                out.print("<img src=\"" + cartProduct.getImageLink() + "\" alt=\"\" class=\"mCS_img_loaded\"");
                                out.print("<img src=\"images/placeholder.png\" alt=\"\" class=\"mCS_img_loaded\">");
                                out.print("</div>\n" +
                                        "                                    <div class=\"name-product\">");
                                out.print(cartProduct.getName()+"</a>");
                                out.print("</div>\n" + //TODO: The dynamic count / update
                                        "                                </div>\n" +
                                        "                            </td>\n" +
                                        "                            <td class=\"product-count\">\n" +
                                        "                                <form action=\"#\" class=\"count-inlineflex\">\n" +
                                        "                                    <div class=\"qtyminus\">-</div>\n" +
                                        "                                    <input type=\"text\" name=\"quantity\" value=\"1\" class=\"qty\">\n" +
                                        "                                    <div class=\"qtyplus\">+</div>\n" +
                                        "                                </form>\n" +
                                        "                            </td>\n" +
                                        "                            <td>\n" +
                                        "                                <div class=\"total\">");
                                out.print("RON "+ cartProduct.getPrice());
                                out.print("<div>\n" +
                                        "                            </td>\n" +
                                        "                            <td>\n" +
                                        "                                <a href=\"#\" title=\"\">\n" +
                                        "                                    <img src=\"images/icons/delete.png\" alt=\"\" class=\"mCS_img_loaded\">\n" +
                                        "                                </a>\n" +
                                        "                            </td>\n" +
                                        "                        </tr>");
                                price += cartProduct.getPrice();
                            }
                        %>
                        </tbody>
                    </table>
                    <div class="coupon-box">
                        <form action="#" method="get" accept-charset="utf-8">
                            <div class="coupon-input">
                                <input type="text" name="coupon code" placeholder="Coupon Code">
                                <button type="submit" class="round-black-btn">Apply Coupon</button>
                            </div>
                        </form>
                    </div>
                </div>
                <!-- /.table-cart -->
            </div>
            <!-- /.col-lg-8 -->
            <div class="col-lg-4">
                <div class="cart-totals">
                    <h3>Cart Totals</h3>
                    <form action="#" method="get" accept-charset="utf-8">
                        <table>
                            <tbody>
                            <tr>
                                <td>Subtotal</td>
                                <td class="subtotal"><% out.print("RON "+price); %></td>
                            </tr>
                            <tr>
                                <td>Shipping</td>
                                <td class="free-shipping">Free Shipping</td>
                            </tr>
                            <% if(session.getAttribute("discount")!=null){
                                discount=(Integer)session.getAttribute("discount");
                                out.print("<span style=\"color:red;\">\n" +
                                        "                                <td>Discount</td>\n" +
                                        "                                <td class=\"subtotal\">"+discount+"</td>\n" +
                                        "                                </tr>\n" +
                                        "                            </span>");
                            }%>
                            <tr class="total-row">
                                <td>Total</td>
                                <td class="price-total"><%
                                    price=price-discount;//TODO: Document this
                                    if(price>0)
                                        out.print("RON "+price);
                                    else out.print("FREE!");
                                %></td>
                            </tr>
                            </tbody>
                        </table>
                        <div class="btn-cart-totals">
                            <a href="#" class="update round-black-btn" title="">Update Cart</a>
                            <a href="#" class="checkout round-black-btn" title="">Proceed to Checkout</a>
                        </div>
                        <!-- /.btn-cart-totals -->
                    </form>
                    <!-- /form -->
                </div>
                <!-- /.cart-totals -->
            </div>
            <!-- /.col-lg-4 -->
        </div>
    </div>
</div>
<script src="js/shoppingcart.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="	sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<%--================================================================================================================--%>
<%@include file="includes/footer.jsp" %>
