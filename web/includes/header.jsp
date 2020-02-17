<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <title> RO-Commerce </title>
</head>

<body>„
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
                <a class="btn btn-secondary" href="homepage">Home <span class="sr-only">(current)</span></a>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0" style="margin-right:auto">
            <div class="input-group mb-2" style="margin-top: 1%">
                <input type="text" name="product-search" class="form-control" size="100%" placeholder="Search for a product" aria-label="Search" aria-describedby="basic-addon2">
                <div class="input-group-append">
                    <button class="btn btn-success" type="submit">Search</button>
                </div>
            </div>
        </form>
        <button type="button" class="btn btn-primary">
            My Cart <span class="badge badge-light">4</span>
        </button>&nbsp;
        <div class="btn-group" role="group" aria-label="Button group with nested dropdown">
            <div class="btn-group" role="group">
                <button id="btnGroupDrop1" type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    My Account
                </button>
                <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
                    <a class="dropdown-item" href="login">Login</a><hr>
                    <a class="dropdown-item" href="register.jsp">Register</a>
                </div>
            </div>
        </div>
    </div>
</nav><br><br><br><br>
