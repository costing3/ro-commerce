<%@include file="includes/header.jsp" %>
<% if(session.getAttribute("userName") != null)
        response.sendRedirect("homepage");
%>

<section class="section-conten padding-y" style="min-height:84vh">

    <!-- ============================ COMPONENT LOGIN   ================================= -->
    <div class="card mx-auto" style="max-width: 380px; margin-top:100px;">
        <div class="card-body">
            <h4 class="card-title mb-4">Sign in</h4>
            ${errorMessage} <!-- OR --> ${successMessage} <!-- OR --> ${warningMessage}
            <%
//                out.print(session.getAttribute("successMessage"));
//                out.print(session.getAttribute("warningMessage"));
//                out.print(session.getAttribute("errorMessage"));
                session.setAttribute("errorMessage",null);
                session.setAttribute("warningMessage",null);
                session.setAttribute("successMessage",null);
            %>
            <form method="post">
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"> <i class="fa fa-envelope"></i> </span>
                        </div>
                        <input name="username" class="form-control" placeholder="Email" type="text">
                    </div>
                </div> <!-- form-group// -->
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
                        </div>
                        <input name="password" class="form-control" placeholder="Password" type="password">
                    </div>
                </div> <!-- form-group// -->

                <div class="form-group">
                    <a href="forgotPassword.jsp" class="float-right">Forgot password?</a>
                    <label class="float-left custom-control custom-checkbox"> <input type="checkbox" name="rememberMe" class="custom-control-input"> <div class="custom-control-label"> Remember </div> </label>
                </div> <!-- form-group form-check .// -->
                <div class="form-group">
                    <button type="submit" class="btn btn-primary btn-block"> Login  </button>
                </div> <!-- form-group// -->
            </form>
        </div> <!-- card-body.// -->
    </div> <!-- card .// -->

    <p class="text-center mt-4">Don't have account? <a href="register">Sign up</a></p>
    <br><br>
    <!-- ============================ COMPONENT LOGIN  END.// ================================= -->


</section>
