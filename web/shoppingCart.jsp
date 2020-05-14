<%@ page import="dataLayer.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@include file="includes/header.jsp" %>
<%--================================================================================================================--%>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="css/shoppingcart.css">
<%
    Product product1 = new Product();
    if(session.getAttribute("cartItem1") != null)
        product1 = (Product) session.getAttribute("cartItem1");

%>
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
                        <tr>
                            <td>
                                <div class="display-flex align-center">
                                    <div class="img-product">
                                        <img src="https://www.91-img.com/pictures/laptops/asus/asus-x552cl-sx019d-core-i3-3rd-gen-4-gb-500-gb-dos-1-gb-61721-large-1.jpg" alt="" class="mCS_img_loaded">
                                    </div>
                                    <div class="name-product">
                                        <% out.print(product1.getName()); %>
                                    </div>
                                </div>
                            </td>
                            <td class="product-count">
                                <form action="#" class="count-inlineflex">
                                    <div class="qtyminus">-</div>
                                    <input type="text" name="quantity" value="1" class="qty">
                                    <div class="qtyplus">+</div>
                                </form>
                            </td>
                            <td>
                                <div class="total">
                                    <% out.print("RON "+ product1.getPrice()); %>
                                </div>
                            </td>
                            <td>
                                <a href="#" title="">
                                    <img src="images/icons/delete.png" alt="" class="mCS_img_loaded">
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="display-flex align-center">
                                    <div class="img-product">
                                        <img src="https://www.91-img.com/pictures/laptops/asus/asus-x552cl-sx019d-core-i3-3rd-gen-4-gb-500-gb-dos-1-gb-61721-large-1.jpg" alt="" class="mCS_img_loaded">
                                    </div>
                                    <div class="name-product">
                                        Apple iPad Mini
                                        <br>G2356
                                    </div>
                                    <div class="price">
                                        $1,250.00
                                    </div>
                                </div>
                            </td>
                            <td class="product-count">
                                <form action="#" class="count-inlineflex">
                                    <div class="qtyminus">-</div>
                                    <input type="text" name="quantity" value="1" class="qty">
                                    <div class="qtyplus">+</div>
                                </form>
                            </td>
                            <td>
                                <div class="total">
                                    $6,250.00
                                </div>
                            </td>
                            <td>
                                <a href="#" title="">
                                    <img src="images/icons/delete.png" alt="" class="mCS_img_loaded">
                                </a>
                            </td>
                        </tr>
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
                                <td class="subtotal">$2,589.00</td>
                            </tr>
                            <tr>
                                <td>Shipping</td>
                                <td class="free-shipping">Free Shipping</td>
                            </tr>
                            <tr class="total-row">
                                <td>Total</td>
                                <td class="price-total">$1,591.00</td>
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
<div style="text-align:center;font-size:14px;padding-bottom:20px;">Get free icon packs for your next project at <a href="http://iiicons.in/" target="_blank" style="color:#ff5e63;font-weight:bold;">www.iiicons.in</a></div>
<script src="js/shoppingcart.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="	sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<%--================================================================================================================--%>
<%@include file="includes/footer.jsp" %>
