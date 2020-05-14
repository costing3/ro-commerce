<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="dataLayer.CategoryDisplay" %>
<%@ page import="java.util.List"%>
<%
    String userID = (String) session.getAttribute("uID"); // Logged in user's name
    String searchedItem = request.getParameter("query"); // Did the user search for anything? Yes - Fill the search bar, No - Do nothing
    List<String> categoryItems = (List<String>) session.getAttribute("categories");

    int cartItems;
    if(session.getAttribute("cartItems") != null)
        cartItems = (Integer)session.getAttribute("cartItems");
    else cartItems=0;
%>
<%--================================================================================================================--%>

<html>
<head>
    <%-- Bootstrap Includes --%>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <%-- //Bootstrap Includes --%>

    <%-- Page Fonts --%>
    <link rel="stylesheet" type="text/css" href="css/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="css/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
    <%-- //Page Fonts --%>

    <%-- Login Form CSS --%>
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <link rel="stylesheet" type="text/css" href="css/login/util.css">
    <%-- //Login Form CSS --%>

    <%-- Other CSS --%>
    <link rel="stylesheet" type="text/css" href="css/sidebar.css">
    <%-- //Other CSS --%>

    <link rel="icon" type="image/png" href="images/icons/favicon.ico"/>

    <title>
        <% if(session.getAttribute("title")==null) out.print("Ro-Commerce");
                else out.print(session.getAttribute("title"));
        %>
    </title>
</head>

<body>
<nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark">
    <img src="images/logo-2.png" width="50" height="50" alt="Error">
    <a class="navbar-brand" href="">
        Ro-Commerce</a>

    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="btn btn-secondary" href="homepage"><i class="fas fa-home"></i> Home <span class="sr-only">(current)</span></a>
                <div class="btn-group" role="group" aria-label="Dropdown">
                    <div class="btn-group" role="group">
                        <button id="btnGroupDrop1" type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-stream"></i>&nbsp;
                            Categories
                        </button>
                        <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
                            <%
                                CategoryDisplay categories = new CategoryDisplay();

                                if(session.getAttribute("categories") == null) {
                                    categoryItems = categories.getCategories();
                                    session.setAttribute("categories",categoryItems);
                                }

                                for (String categoryItem : categoryItems)
                                    out.print("<a class=\"dropdown-item\" href=\"#\"> " + categoryItem + "</a>");
                            %>
                        </div>
                    </div>
                </div>
            </li>
        </ul>

        <form class="form-inline my-2 my-lg-0" style="margin-right:auto;" method="get" action="search">
            <div class="input-group mb-2" style="margin-top: 9px">
                <input type="text" name="query" class="form-control" size="50%" placeholder="Searching for anything? Try looking it up." aria-label="Search" aria-describedby="basic-addon2" value="<%if((searchedItem)!=null) out.print(searchedItem); %>">
                <div class="input-group-append">
                    <button class="btn btn-success" type="submit"><i class="fas fa-search"></i> Search</button>
                </div>
            </div>
        </form>
        <div class="btn-group" role="group" aria-label="Dropdown">
            <div class="btn-group" role="group">
                <button id="btnGroupDrop2" type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <%
                        if(userID == null)
                            out.print("<i class=\"fas fa-user-circle fa-lg\"></i> My Account </button>" +
                                    "<div class=\"dropdown-menu\" aria-labelledby=\"btnGroupDrop1\">\n" +
                                    "                    <a class=\"dropdown-item\" href=\"login\"><i class=\"fas fa-sign-out-alt\"></i> Log in</a>\n" +
                                    "                    <a class=\"dropdown-item\" href=\"register\"><i class=\"fas fa-plus-circle\"></i> Create an account</a>\n" +
                                    "                </div>");
                        else
                            out.print("<i class=\"fas fa-user-circle fa-lg\"></i> " + userID + " </button>" +
                                    "<div class=\"dropdown-menu\" aria-labelledby=\"btnGroupDrop1\">\n" +
                                    "                    <a class=\"dropdown-item\" href=\"#\"><i class=\"fas fa-user-cog\"></i> Account Settings</a>\n" +
                                    "                    <a class=\"dropdown-item\" href=\"#\"><i class=\"fas fa-history\"></i> My Orders</a><hr>\n" +
                                    "                    <a class=\"dropdown-item\" href=\"logout.jsp\"><i class=\"fas fa-sign-out-alt\"></i> Sign Out</a>\n" +
                                    "                </div>");

                    %>
            </div>
        </div>&nbsp;
        <a href="cart">
            <button type="button" class="btn btn-primary"><i class="fas fa-shopping-cart"></i>
            My Cart <span class="badge badge-light">
                    <% out.print(cartItems); %>
                </span>
            </button>&nbsp;
        </a>
    </div>
</nav><br><br><br>

<%--================================================================================================================--%>
<script src="https://kit.fontawesome.com/dfcda71f9c.js" crossorigin="anonymous"></script>
