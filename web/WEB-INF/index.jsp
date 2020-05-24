<%@ page import="java.util.Date" %>
<%@include file="../includes/header.jsp" %>
<%--================================================================================================================--%>
<div class="container-fluid">
    <div class="row">
<div class="d-flex" id="wrapper">


<%@include file="../includes/sidebar.jsp" %>


    <!-- Page Content -->
    <div id="page-content-wrapper">
        ${warningMessage} ${successMessage}
        <%--  display the message in the session variable --%>
        <%  session.setAttribute("warningMessage",null);  //then clean up
            session.setAttribute("successMessage",null);  //after yourself
        %>
    </div>
    <!-- /#page-content-wrapper -->
</div></div>
</div>

<%--================================================================================================================--%>
<%@include file="../includes/footer.jsp" %>
