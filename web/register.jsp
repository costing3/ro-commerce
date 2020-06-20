<%@include file="includes/header.jsp" %>
<% if(session.getAttribute("userName") != null) {
	session.setAttribute("warningMessage", "<div style=\"position: absolute; right: 0px;\" class=\"alert alert-warning alert-dismissible fade show\" role=\"alert\">\n" +
			"  <strong>You're logged in!<br></strong>You're unable to create another account while signed in! <a href=\"logout.jsp\">Log out</a> first.\n" +
			"  <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">\n" +
			"    <span aria-hidden=\"true\">&times;</span>\n" +
			"  </button>\n" +
			"</div>");
	response.sendRedirect("homepage");
}
%>

<%--<section class="section-content padding-y">--%>
<!-- ============================ COMPONENT REGISTER   ================================= -->
	<div class="card mx-auto" style="max-width:520px; margin-top:40px;">
      <article class="card-body">
		<header class="mb-4"><h4 class="card-title">Sign up</h4></header>
		  ${errorMessage} <!-- OR --> ${successMessage} <!-- OR --> ${warningMessage}
		  <%

			  session.setAttribute("errorMessage",null);
			  session.setAttribute("warningMessage",null);
			  session.setAttribute("successMessage",null);
		  %>
		<form name="registerForm" action="register" method="post">
				<div class="form-row">
					<div class="col form-group">
						<label><i class="fas fa-address-card"></i> First name</label>
					  	<input type="text" name="firstname" class="form-control" placeholder="">
					</div> <!-- form-group end.// -->
					<div class="col form-group">
						<label><i class="far fa-address-card"></i> Last name</label>
					  	<input type="text" name="lastname" class="form-control" placeholder="">
					</div> <!-- form-group end.// -->
				</div> <!-- form-row end.// -->
				<div class="form-group">
					<label><i class="fa fa-envelope"></i> Email</label>
					<input type="email" name="username" class="form-control" placeholder="">
					<small class="form-text text-muted">We'll never share your email with anyone else.</small>
				</div> <!-- form-group end.// -->
				<div class="form-row">
					<div class="form-group col-md-6">
						<label><i class="fas fa-calendar-alt"></i> Age</label>
						<input type="text" name="age" class="form-control">
					</div>
					<div class="form-group col-md-6">
						<label><i class="fas fa-globe"></i> Country</label>
						<select id="inputState" name="country" class="form-control">
							<option> ------------- </option>
							<option value="Romania" selected="">Romania</option>
							<option value="United Kingdom">United Kingdom</option>
							<option value="United States">United States</option>
						</select>
					</div> <!-- form-group end.// -->
				</div>
				<div class="form-group">
					<label><i class="fas fa-map-marked-alt"></i> Address</label>
					<input type="text" name="address" class="form-control">
				</div>
				<div class="form-row">
					<div class="form-group col-md-6">
					  <label><i class="fas fa-map-marked-alt"></i> City</label>
					  <input type="text" name="city" class="form-control">
					</div>
					<div class="form-group col-md-6">
						<label><i class="fas fa-at"></i> Zipcode</label>
						<input type="text" name="zipcode" class="form-control">
					</div> <!-- form-group end.// -->
				</div> <!-- form-row.// -->
				<div class="form-row">
					<div class="form-group col-md-6">
						<label><i class="fa fa-lock"></i> Create password</label>
					    <input class="form-control" name="password" type="password">
					</div> <!-- form-group end.// --> 
					<div class="form-group col-md-6">
						<label><i class="fa fa-lock"></i> Repeat password</label>
					    <input class="form-control" name="validatePassword" type="password">
					</div> <!-- form-group end.// -->  
				</div>
			    <div class="form-group">
			        <button type="submit" class="btn btn-primary btn-block"> Register  </button>
			    </div> <!-- form-group// -->
			</form>
		</article><!-- card-body.// -->
    </div> <!-- card .// -->
    <p class="text-center mt-4">Already have an account? <a href="login">Log In</a></p>
    <br><br>
<!-- ============================ COMPONENT REGISTER  END.// ================================= -->


<%--</section>--%>
