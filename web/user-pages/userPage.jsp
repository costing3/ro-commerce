<%@ page import="dataLayer.Order" %>
<%@ page import="java.util.Vector" %>
<%@ page import="dataLayer.Product" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="author" content="Bootstrap-ecommerce by Vosidiy M.">

<title>Profile Page</title>

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
	<a href="http://bootstrap-ecommerce.com" class="brand-wrap"><img class="logo" src="../images/logo.png"></a>
</div> <!-- container.// -->
</section>
</header> <!-- section-header.// -->


<section class="section-content padding-y bg">
<div class="container">

<!-- =========================  COMPONENT MYORDER 1 ========================= --> 
<div class="row">
	<aside class="col-md-3">
		<!--   SIDEBAR   -->
		<ul class="list-group">
			<a class="list-group-item" active href="#"> User details </a>
			<a class="list-group-item href="#"> My orders</a>
			<a class="list-group-item" href="#"> Return and refunds </a>
			<a class="list-group-item" href="#"> Change password </a>
			<a class="list-group-item" href="#"> My Selling Items </a>
			<a class="list-group-item" href="#"> Received orders </a>
			<% if(session.getAttribute("admin")!=null)
				out.print("<a class=\"list-group-item\" href=\"admin\">Administration Panel</a>");
			%>
		</ul>
		<br>
		<a class="btn btn-light btn-block" href="../logout.jsp"> <i class="fa fa-power-off"></i> <span class="text">Log out</span> </a>
		<!--   SIDEBAR .//END   -->
	</aside>

	<%
		Order myOrder = new Order();

		Vector<Integer> orderIDs = myOrder.getUserOrdersIds((Integer) session.getAttribute("userID"));


		for(int index=0; index<orderIDs.size(); index++) {
			List<Product> thisOrderProducts = myOrder.getOrderProducts(orderIDs.elementAt(index));
			if(index>0)
				out.print("<aside class=\"col-md-3\"></aside>");
			out.print("<br><br><main class=\"col-md-9\">\n" +
					"<article class=\"card\">\n" +
					"<header class=\"card-header\">\n" +
					"<strong class=\"d-inline-block mr-2\">Order ID: " + orderIDs.elementAt(index) + "</strong>");
			out.print("<span>| Order Date: " + myOrder.getDate() + " | </span>\n" +
					"<span class=\"b\">Total: RON " + myOrder.getPrice() + " </span></header>");


			for (Product thisOrderProduct : thisOrderProducts) {
				out.print("<div class=\"table-responsive\">\n" +
						"<table class=\"table table-hover\">\n" +
						"<tr>\n" +
						"<td width=\"65\">\n" +
						"<img src=\"" + thisOrderProduct.getImageLink() + "\" width=65px>" +
						"</td>\n" +
						"<td>\n" +
						"<p class=\"title mb-0\">" + thisOrderProduct.getName() + "</p>\n" +
						"<var class=\"price text-muted\">RON " + thisOrderProduct.getPrice() + "</var>\n" +
						"</td>\n" +
						"<td width=\"150\"> <a href=\"product?id="+ thisOrderProduct.getID() +"\" class=\"btn btn-outline-primary\">View Product</a> </td>\n" +
						"</tr>\n" +
						"<tr>\n" +
						"</table>\n" +
						"</div>");
			}
			out.print("</article> <!-- order-group.// -->\n" +
					"\t</main>");
		}

	%>

</div> <!-- row.// -->
<!-- =========================  COMPONENT MYORDER 1 END.// ========================= --> 

<br> <br>

<%--================================================================================================================--%>
<%@include file="../includes/footer.jsp" %>
