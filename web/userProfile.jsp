<%@ page import="kz.bitlab.techorda.db.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="head.jsp"%>
    <title><%=siteName%></title>
</head>
    <body>
        <div class="container mt-3 pt-4 bg-light pb-3">
            <%@include file="navbar.jsp"%>
            <%  User user = (User) request.getAttribute("user"); %>
            <h1 class="text-center mt-3">Hello <%=user.getFullName()%></h1>
            <h5 class="text-center mt-2">This is your profile page</h5>
        </div>
    </body>
</html>
