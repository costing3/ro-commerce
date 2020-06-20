<%@ page import="java.util.List" %>
<%@ page import="dataLayer.CategoryDisplay" %>
<%@ page import="dataLayer.Product" %>
<%--
  Created by IntelliJ IDEA.
  User: Costin
  Date: 25-May-20
  Time: 02:02
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String userID = (String) session.getAttribute("userName"); // Logged in user's name
    String lastName = (String) session.getAttribute("lastName");
    String firstName = (String) session.getAttribute("firstName");
    String searchedItem = request.getParameter("query"); // Did the user search for anything? Yes - Fill the search bar, No - Do nothing

    int cartItems;
    if(session.getAttribute("cartItems") != null)
        cartItems = (Integer)session.getAttribute("cartItems");
    else {
        session.setAttribute("cartItems",0);
        cartItems=0;
    }

    List<String> categoryItems;
    CategoryDisplay categories = new CategoryDisplay();
    if(session.getAttribute("categories")==null){
        categoryItems = categories.getCategories();
        session.setAttribute("categories",categoryItems);
    }else categoryItems= (List<String>) session.getAttribute("categories");


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

    <link href="images/favicon.ico" rel="shortcut icon" type="image/x-icon">

    <!-- jQuery -->
    <script src="js/jquery-2.0.0.min.js" type="text/javascript"></script>

    <!-- Bootstrap4 files-->
    <script src="js/bootstrap.bundle.min.js" type="text/javascript"></script>
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>

    <!-- Font awesome 5 -->
    <link href="fonts/fontawesome/css/all.min.css" type="text/css" rel="stylesheet">

    <!-- custom style -->
    <link href="css/ui.css" rel="stylesheet" type="text/css"/>
    <link href="css/responsive.css" rel="stylesheet" media="only screen and (max-width: 1200px)" />

    <!-- custom javascript -->
    <script src="js/script.js" type="text/javascript"></script>

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
                    <a href="homepage" class="brand-wrap">
                        <img class="logo" src="images/logo.png">
                    </a> <!-- brand-wrap.// -->
                </div>
                <div class="col-lg-6 col-sm-12">
                    <form action="search" class="search">
                        <div class="input-group w-100">
                            <input type="text" class="form-control" name="query" placeholder="Search for products" value="<%if((searchedItem)!=null) out.print(searchedItem); %>">
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
                            <a href="cart" class="icon icon-sm rounded-circle border"><i class="fa fa-shopping-cart"></i></a>
                            <span class="badge badge-pill badge-danger notify">
                                <%
                                    if(userID != null)
                                        out.print(cartItems);
                                    else out.print(0);
                                %>
                            </span>
                        </div>
                        <div class="widget-header icontext">
                            <a href="profile" class="icon icon-sm rounded-circle border"><i class="fa fa-user"></i></a>
                            <div class="text">
                                <%
                                    if(userID == null)
                                        out.print("<span class=\"text-muted\">Welcome!</span><div>\n" +
                                            "                                    <a href=\"login\"><i class=\"fas fa-sign-in-alt\"></i> Sign in</a> |\n" +
                                            "                                    <a href=\"register\"><i class=\"fas fa-user-plus\"></i> Register</a>\n" +
                                            "                                </div>");
                                    else
                                        out.print("<span class=\"text\">"+ firstName +" "+ lastName +"</span><div>\n" +
                                            "                                   <a href=\"login\"><i class=\"fas fa-history\"></i> My Orders</a> |\n"+
                                            "                                   <a href=\"logout.jsp\"><i class=\"fas fa-sign-out-alt\"></i> Sign out</a>");

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
                    <a class="nav-link" href="homepage">Home</a>
                </li>
                <%
                    int categoryCount=0;
                    for (String categoryItem : categoryItems) {
                        categoryCount++;
                        out.print("<li class=\"nav-item\">");
                        out.print("<a class=\"nav-link\" href=\"search?query="+ categoryCount +"\">" + categoryItem + "</a>");
                        out.print("</li>");
                    }
                %>
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
