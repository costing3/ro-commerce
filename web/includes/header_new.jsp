<%--
  Created by IntelliJ IDEA.
  User: Costin
  Date: 25-May-20
  Time: 02:02
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String userID = (String) session.getAttribute("uID"); // Logged in user's name
    String searchedItem = request.getParameter("query"); // Did the user search for anything? Yes - Fill the search bar, No - Do nothing

    int cartItems;
    if(session.getAttribute("cartItems") != null)
        cartItems = (Integer)session.getAttribute("cartItems");
    else {
        session.setAttribute("cartItems",0);
        cartItems=0;
    }
%>
<!DOCTYPE HTML>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>
        <% if(session.getAttribute("title")==null) out.print("Ro-Commerce");
            else out.print(session.getAttribute("title"));
        %>
    </title>

    <link href="../images_new/favicon.ico" rel="shortcut icon" type="image/x-icon">

    <!-- jQuery -->
    <script src="../js_new/jquery-2.0.0.min.js" type="text/javascript"></script>

    <!-- Bootstrap4 files-->
    <script src="../js_new/bootstrap.bundle.min.js" type="text/javascript"></script>
    <link href="../css_new/bootstrap.css" rel="stylesheet" type="text/css"/>

    <!-- Font awesome 5 -->
    <link href="../fonts/fontawesome/css/all.min.css" type="text/css" rel="stylesheet">

    <!-- custom style -->
    <link href="../css_new/ui.css" rel="stylesheet" type="text/css"/>
    <link href="../css_new/responsive.css" rel="stylesheet" media="only screen and (max-width: 1200px)" />

    <!-- custom javascript -->
    <script src="../js_new/script.js" type="text/javascript"></script>

    <script type="text/javascript">
        /// some script

        // jquery ready start
        $(document).ready(function() {
            // jQuery code

        });
        // jquery end
    </script>

</head>
<body>


<header class="section-header">

    <section class="header-main border-bottom">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-2 col-4">
                    <a href="http://bootstrap-ecommerce.com" class="brand-wrap">
                        <img class="logo" src="../images_new/logo.png">
                    </a> <!-- brand-wrap.// -->
                </div>
                <div class="col-lg-6 col-sm-12">
                    <form action="search" class="search">
                        <div class="input-group w-100">
                            <input type="text" class="form-control" placeholder="Search for products" value="<%if((searchedItem)!=null) out.print(searchedItem); %>">
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="submit">
                                    <i class="fa fa-search"></i>
                                </button>
                            </div>
                        </div>
                    </form> <!-- search-wrap .end// -->
                </div> <!-- col.// -->
                <div class="col-lg-4 col-sm-6 col-12">
                    <div class="widgets-wrap float-md-right">
                        <div class="widget-header  mr-3">
                            <a href="#" class="icon icon-sm rounded-circle border"><i class="fa fa-shopping-cart"></i></a>
                            <span class="badge badge-pill badge-danger notify">
                                <%
                                    if(userID != null)
                                        out.print(cartItems);
                                    else out.print(0);
                                %>
                            </span>
                        </div>
                        <div class="widget-header icontext">
                            <a href="#" class="icon icon-sm rounded-circle border"><i class="fa fa-user"></i></a>
                            <div class="text">
                                <%
                                    if(userID == null)
                                        out.print("<span class=\"text-muted\">Welcome!</span><div>\n" +
                                            "                                    <a href=\"login\">Sign in</a> |\n" +
                                            "                                    <a href=\"register\"> Register</a>\n" +
                                            "                                </div>");
                                    else
                                        out.print("<span class=\"text\">"+ userID +"</span><div>\n" +
                                            "                                   <a href=\"login\">My Orders</a> |\n"+
                                            "                                   <a href=\"login\">Sign out</a>");

                                %>

                            </div>
                        </div>

                    </div> <!-- widgets-wrap.// -->
                </div> <!-- col.// -->
            </div> <!-- row.// -->
        </div> <!-- container.// -->
    </section> <!-- header-main .// -->
</header> <!-- section-header.// -->


<nav class="navbar navbar-main navbar-expand-lg navbar-light border-bottom">
    <div class="container">

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#main_nav" aria-controls="main_nav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="main_nav">
            <ul class="navbar-nav">
                <li class="nav-item dropdown">
                    <a class="nav-link" href="#">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">About</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Supermarket</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Partnership</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Baby &amp Toys</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Fitness sport</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Clothing</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Furnitures</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"> More</a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="#">Foods and Drink</a>
                        <a class="dropdown-item" href="#">Home interior</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">Category 1</a>
                        <a class="dropdown-item" href="#">Category 2</a>
                        <a class="dropdown-item" href="#">Category 3</a>
                    </div>
                </li>
            </ul>
        </div> <!-- collapse .// -->
    </div> <!-- container .// -->
</nav>
 <!-- section-header.// -->
