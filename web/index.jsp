<%@ page import="java.util.ArrayList" %>
<%@ page import="kz.bitlab.techorda.db.Item" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <%@include file="head.jsp"%>
        <title><%=siteName%></title>
    </head>
    <body>
        <div class="container mt-3 bg-light pb-3">
            <%@include file="navbar.jsp"%>
            <div class="row mt-3">
                <h4 class="text-center">
                    Welcome to <%=siteName%>
                </h4>
                <h6 class="text-center mt-2"><%=siteDescription%></h6>
            </div>
                <%
                ArrayList<Item> items = (ArrayList<Item>) request.getAttribute("goods");
                int count = 0;
                if (items!=null){
                    for (Item item : items) {
                        if (count%3==0) {
                            %>
                            <div class="mt-4 d-flex flex-row justify-content-around ">
                                <div class="text-center bg-white pl-2" style="width: 30%;">
                                    <h4 class="bg-secondary p-1" style="height: 40px"><%=item.getName()%></h4>
                                    <h3 class="text-success">$ <%=item.getPrice()%></h3>
                                    <p><%=item.getDescription()%></p>
                                    <button type="button" class="btn btn-success btn-lg mb-2" style="width:90%">Buy now</button>
                                </div>
                        <% } else {
                            %>
                            <div class="text-center bg-white pl-2" style="width: 30%;">
                                <h4 class="bg-secondary p-1" style="height: 40px"><%=item.getName()%></h4>
                                <h3 class="text-success">$ <%=item.getPrice()%></h3>
                                <p><%=item.getDescription()%></p>
                                <button type="button" class="btn btn-success btn-lg mb-2" style="width:90%">Buy now</button>
                            </div>
                            <%
                            }
                            count++;
                            if (count%3==0) {
                                %></div> <%
                            }
                    }%>

                <%
                }
                %>
        </div>
    </body>
</html>
