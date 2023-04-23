<%@ page import="java.util.ArrayList" %>
<%@ page import="kz.bitlab.techorda.db.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="head.jsp"%>
    <title><%=siteName%></title>
</head>
    <body>
        <div class="container mt-3 bg-light">
            <%@include file="navbar.jsp"%>
            <% Boolean flag = (Boolean)request.getAttribute("loginFailed");
                if (flag==Boolean.TRUE) {%>
                    <div class="card mt-3 mx-3">
                        <div class="card-body " style="background-color: lightpink">
                            <h5 class="card-title" >Incorrect email or login</h5>
                        </div>
                    </div>

            <% }%>
                <form action="/login" method="post" class="p-3">
                    <div class="card mt-3">
                        <div class="bg-light py-2 px-3" >
                            <h5 class="card-title">Login Page</h5>
                        </div>
                        <div class="card-body">
                            <div class="card-text">
                                <table class="mt-2"  style="width: 100%;">
                                    <tr>
                                        <td style="width: 15%">
                                            Email <br><br>
                                        </td>
                                        <td style="width: 85%">
                                            <input style="width: 100%;border:1px solid lightgray" type="text" name="email">
                                            <br><br>
                                        </td>
                                    </tr>

                                    <tr style="padding-top: 10px">
                                        <td style="width: 15%">
                                            Password
                                        </td>
                                        <td style="width: 85%">
                                            <input style="width: 100%;border:1px solid lightgray" type="password" name="password">
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <button class="btn btn-success mt-3">Login</button>
                        </div>
                    </div>
                </form>
        </div>
    </body>
</html>
