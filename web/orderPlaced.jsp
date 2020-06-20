<%@ page import="dataLayer.Product" %>
<%@ page import="java.util.List" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="author" content="Bootstrap-ecommerce by Vosidiy M.">

    <title>Website title - bootstrap html template</title>

    <!-- jQuery -->
    <script src="js/jquery-2.0.0.min.js" type="text/javascript"></script>

    <!-- Bootstrap4 files-->
    <script src="js/bootstrap.bundle.min.js" type="text/javascript"></script>
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>

    <!-- Font awesome 5 -->
    <link href="fonts/fontawesome/css/all.min.css" type="text/css" rel="stylesheet">

    <!-- custom style -->
    <link href="css/ui.css" rel="stylesheet" type="text/css"/>
    <link href="css/responsive.css" rel="stylesheet" />

    <!-- custom javascript -->
    <script src="js/script.js" type="text/javascript"></script>

</head>
<body>

<header class="section-header">
    <section class="header-main border-bottom">
        <div class="container">
            <a href="http://bootstrap-ecommerce.com" class="brand-wrap"><img class="logo" src="images/logo.png"></a>
        </div> <!-- container.// -->
    </section>
</header> <!-- section-header.// -->


<section class="section-content padding-y bg">
    <div class="container">

        <!-- =========================  COMPONENT MYORDER 1 ========================= -->


        <!-- =========================  COMPONENT MYORDER 2 ========================= -->


        <!-- =========================  COMPONENT TRACKING ========================= -->
        <article class="card">
            <header class="card-header"> My Orders / Tracking </header>
            <div class="card-body">
                <h6>Order ID: <%
                    request.getAttribute("test");
                %></h6>
                <article class="card">
                    <div class="card-body row no-gutters">
                        <div class="col">
                            <strong>Delivery Estimate time:</strong> <br>16:40, 12 nov 2018
                        </div>
                        <div class="col">
                            <strong>Shipping company:</strong> <br> Fedex, | <i class="fa fa-phone"></i> +123467890
                        </div>
                        <div class="col">
                            <strong>Status:</strong> <br> Picked by the courier
                        </div>
                        <div class="col">
                            <strong>Tracking #:</strong> <br> 98765432123
                        </div>
                    </div>
                </article>

                <div class="tracking-wrap">
                    <div class="step active">
                        <span class="icon"> <i class="fa fa-check"></i> </span>
                        <span class="text">Order confirmed</span>
                    </div> <!-- step.// -->
                    <div class="step">
                        <span class="icon"> <i class="fa fa-user"></i> </span>
                        <span class="text"> Picked by courier</span>
                    </div> <!-- step.// -->
                    <div class="step">
                        <span class="icon"> <i class="fa fa-truck"></i> </span>
                        <span class="text"> On the way </span>
                    </div> <!-- step.// -->
                    <div class="step">
                        <span class="icon"> <i class="fa fa-box"></i> </span>
                        <span class="text">Delivered</span>
                    </div> <!-- step.// -->
                </div>


                <hr>

                    <%
                        List<Product> cartProducts = (List<Product>) session.getAttribute("cartProducts");
                        Integer displayedProducts = 0;
                        out.print("<ul class=\"row\">");
                        for (Product cartProduct:cartProducts) {
                            out.print("<li class=\"col-md-4\">\n" +
                                    "                        <figure class=\"itemside  mb-3\">\n" +
                                    "                            <div class=\"aside\"><a href=\"product?id="+ cartProduct.getID() +"\"><img src=\""+ cartProduct.getImageLink() +"\" class=\"img-sm border\"></div>\n" +
                                    "                            <figcaption class=\"info align-self-center\">\n" +
                                    "                                <p class=\"title\">");
                            out.print(cartProduct.getName());
                            out.print("</p>\n" +
                                    "                                <span class=\"text-muted\">RON ");
                            out.print(cartProduct.getPrice());
                            out.print("</span>\n" +
                                    "                            </figcaption>\n" +
                                    "                        </figure>\n" +
                                    "                    </li>");
                            displayedProducts++;
                            if(displayedProducts %3 ==0 ){
                                out.print("</ul>");
                                out.print("<ul class=\"row\">");
                            }
                            out.print("</ul>");
                        }
                    %>
                <p><strong>Note: </strong>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                    tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                    quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                    consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
                    cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
                    proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                <br><br>
                <a href="#" class="btn btn-light"> <i class="fa fa-chevron-left"></i> Back to orders</a>
            </div> <!-- card-body.// -->
        </article>
        <!-- =========================  COMPONENT TRACKING END.// ========================= -->

        <br><br>



    </div> <!-- container .//  -->
</section>
<!-- ========================= SECTION CONTENT END// ========================= -->

</body>
</html>
