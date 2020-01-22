<%@ page contentType="text/html;charset=UTF-8" %>
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

        <link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
        <title> Login</title>
    </head>

    <body>
    <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark">
        <img src="images/logo-2.png" width="50" height="30" alt0="Error">
        <a class="navbar-brand" href="#">
            Ro-Commerce</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                </li>
            </ul>
            <form class="form-inline my-2 my-lg-0" style="margin-right:25%">
                <div class="input-group mb-2" style="margin-top: 1%">
                    <input type="text" name="product-search" class="form-control" size="65" placeholder="Search for a product" aria-label="Search" aria-describedby="basic-addon2">
                    <div class="input-group-append">
                        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                    </div>
                </div>
            </form>

            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    My Account
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="login.jsp">Login</a>
                    <a class="dropdown-item" href="register.jsp">Register</a>
                </div>
            </li>
        </div>
    </nav>