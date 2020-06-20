<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="includes/header.jsp" %>
<%--================================================================================================================--%>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<%@include file="includes/sidebar.jsp" %>

<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="css/shoppingcart.css">
<div class="cart-wrap">
    <div class="container">
        <div class="row">
            <div class="col-lg-8"><br><br>
                <div style="position: relative; left: 20%;" class="alert alert-warning" role="alert">
                    <h4 class="alert-heading">Hi, <% out.print(firstName+"!"); %></h4>
                    <p>Your shopping cart is <b>empty!</b></p>
                    <hr>
                    <p class="mb-0">You have not added any products in your shopping bag!
                        <br>To do so, find the best product that fits your needs, then press the <b>Add To Cart</b> button!<br>
                        <a href="homepage">Start Shopping Now!</a>
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="js/shoppingcart.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="	sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<%--================================================================================================================--%>

