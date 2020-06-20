<%@ page import="dataLayer.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	Product myProduct = (Product) request.getAttribute("MyProduct");
	session.setAttribute("title", myProduct.getName());
	//TODO: Create a bloody 404 not found page

%> <%-- Load the product info & temporarly set the title --%>
<%@include file="includes/header.jsp" %>

<%--<!-- jQuery -->--%>
<%--<script src="../js/jquery-2.0.0.min.js" type="text/javascript"></script>--%>

<%--<!-- Bootstrap4 files-->--%>
<%--<script src="../js/bootstrap.bundle.min.js" type="text/javascript"></script>--%>
<%--<link href="../css/bootstrap.css" rel="stylesheet" type="text/css"/>--%>

<%--<!-- Font awesome 5 -->--%>
<%--<link href="../fonts/fontawesome/css/all.min.css" type="text/css" rel="stylesheet">--%>

<%--<!-- custom style -->--%>
<%--<link href="../css/ui.css" rel="stylesheet" type="text/css"/>--%>
<%--<link href="../css/responsive.css" rel="stylesheet" />--%>

<%--<!-- custom javascript -->--%>
<%--<script src="../js/script.js" type="text/javascript"></script>--%>
<body>

<section class="section-content padding-y bg">
<div class="container">

<!-- ============================ COMPONENT 1 ================================= -->
<div class="card">
	<div class="row no-gutters">
		<aside class="col-md-6">
<article class="gallery-wrap"> 
	<div class="img-big-wrap"><br>
	   <a href="#"><% out.print("<img src=\""+ myProduct.getImageLink()+ "\"><hr>"); %></a>
	</div> <!-- img-big-wrap.// -->
</article> <!-- gallery-wrap .end// -->
		</aside>
		<main class="col-md-6 border-left">
<article class="content-body">

<h2 class="title"><% out.print(myProduct.getName()); %></h2>

<div class="rating-wrap my-3">
	<small class="label-rating text-success"> <i class="fa fa-clipboard-check"></i> <% out.print(myProduct.getOrders()); %> confirmed orders </small>
</div> <!-- rating-wrap.// -->

<div class="mb-3"> 
	<var class="price h4">RON <% out.print(myProduct.getPrice()); %></var>
	<span class="text-muted">/unit</span>
</div> 

<p><% out.print(myProduct.getDescription()); %></p>

<dl class="row">
  <dt class="col-sm-3">Model#</dt>
  <dd class="col-sm-9"><% out.print(myProduct.getModelNo()); %></dd>

  <dt class="col-sm-3">Color</dt>
  <dd class="col-sm-9"><% out.print(myProduct.getColor()); %></dd>

  <dt class="col-sm-3">Other details</dt>
  <dd class="col-sm-9"><% out.print(myProduct.getOther()); %></dd>
</dl>

<hr>
	<div class="rating-wrap my-3">
		<%
			if(myProduct.getQuantity()==0)
				out.print("<small class=\"label-rating text-danger\"><i class=\"fas fa-times\"></i> This product is out of stock  </small>");
			else if(myProduct.getQuantity()>0)
				out.print("<small class=\"label-rating text-success\"><i class=\"fas fa-check\"></i> This product is in stock </small>");
		%>

	</div>
	<form action="cart" method="post">
		<input type="hidden" value="<% out.print(myProduct.getID()); %>" name="idul">
		<input type="submit" class="btn  btn-outline-primary" value="Add to Cart " <% if(myProduct.getQuantity()==0) out.print("disabled"); %>>
		<a <% out.print("href=\"search?query="+ session.getAttribute("query") +"\""); %> class="btn  btn-danger"> Back </a>
	</form>

</article> <!-- product-info-aside .// -->
		</main> <!-- col.// -->
	</div> <!-- row.// -->
</div> <!-- card.// -->

<!-- ========================= FOOTER END // ========================= -->

<%@include file="includes/footer.jsp" %>
