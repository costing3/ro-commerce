<%@include file="includes/header.jsp" %>
<% if(session.getAttribute("userID") != null)
    response.sendRedirect("homepage");
%>
<%--================================================================================================================--%>
        <div class="limiter">
            <div class="container-login100">
                <div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-50">

                    <form class="login100-form validate-form"  autocomplete="off" method="post">
					<span class="login100-form-title p-b-33"><i class="fas fa-sign-out-alt fa-3x"></i><br>
						Account Login
					</span>
<%--                        TODO: Data validation!!--%>
                        ${errorMessage} <!-- OR --> ${successMessage}
                        <%
                            session.setAttribute("errorMessage",null);
                            session.setAttribute("successMessage",null);
                        %>
                        <div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
                            <input class="input100" type="text" name="username" placeholder="Username">
                            <span class="focus-input100-1"></span>
                            <span class="focus-input100-2"></span>
                        </div>

                        <div class="wrap-input100 rs1 validate-input" data-validate="Password is required">
                            <input class="input100" type="password" name="password" placeholder="Password">
                            <span class="focus-input100-1"></span>
                            <span class="focus-input100-2"></span>
                        </div>

                        <div class="container-login100-form-btn m-t-20">
                            <button class="login100-form-btn"><i class="fas fa-sign-out-alt"></i>&nbsp;
                                Sign in
                            </button>

                        </div>
                        <div class="text-center p-t-45 p-b-4">
						<span class="txt1"><i class="fas fa-key"></i>
							Forgot
						</span>

                            <a href="#" class="txt2 hov1">
                                Username / Password?
                            </a>
                        </div>

                        <div class="text-center">
						<span class="txt1"><i class="fas fa-plus-circle"></i>
							Don't have an account?
						</span>

                            <a href="register" class="txt2 hov1">
                                Sign up
                            </a>
                        </div>
                    </form>
                </div>
            </div>
        </div>

<%--================================================================================================================--%>
<%@include file="includes/footer.jsp" %>
