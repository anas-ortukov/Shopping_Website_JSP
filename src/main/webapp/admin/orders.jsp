<%@ page import="java.util.List" %>
<%@ page import="org.example.jsp_shopping_website.repo.OrderRepo" %>
<%@ page import="org.example.jsp_shopping_website.entity.Order" %>
<%@ page import="org.example.jsp_shopping_website.entity.enums.Status" %>
<%@ page import="java.text.NumberFormat" %><%--
  Created by IntelliJ IDEA.
  User: azizo
  Date: 31/03/2024
  Time: 12:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Category</title>
    <link rel="stylesheet" href="../static/bootstrap.min.css">
</head>
<body>

<%@include file="admin_navbar.jsp" %>
<%
    OrderRepo orderRepo = new OrderRepo();
    List<Order> orders = orderRepo.findAll();
    NumberFormat numberFormat = NumberFormat.getNumberInstance();
    List<Order> newOrders = orderRepo.getOrderByStatus(orders, Status.NEW);
    List<Order> inProgressOrders = orderRepo.getOrderByStatus(orders, Status.IN_PROGRESS);
    List<Order> completedOrders = orderRepo.getOrderByStatus(orders, Status.COMPLETED);
%>
<div class="col-10 offset-1">
    <div class="d-flex justify-content-end my-5 me-5">
        <a href="archive.jsp" class="btn btn-success">Go to Archieve</a>
    </div>
    <div class="row">
        <div class="col-4">
            <h3 class="text-center">New</h3>
            <%
                for (Order order : newOrders) {
            %>
            <div class="card bg-light rounded my-3 py-4">
                <div class="card offset-1">
                    <div class="card-body">
                        <h5 class="card-text">Order ID: <span style="font-weight: normal"><%= order.getId()%></span>
                        </h5>
                        <p class="card-title"><span
                                style="font-weight: bold">Products: </span><%= order.getOrderProducts().size()%>
                        </p>
                        <p class="card-title"><span
                                style="font-weight: bold">Profile: </span><%= order.getUser().getEmail()%>
                        </p>
                        <p class="card-title"><span
                                style="font-weight: bold">Total Price: </span><%= numberFormat.format(orderRepo.getOrderSum(order))%>$
                        </p>
                        <a class="btn btn-warning text-white my-3" href="orderDetails.jsp?orderId=<%=order.getId()%>">Order
                            Details</a>
                    </div>
                </div>
            </div>
            <%
                }
            %>
        </div>
        <div class="col-4">
            <h3 class="text-center">In Progress</h3>
            <%
                for (Order order : inProgressOrders) {
            %>
            <div class="card bg-light rounded my-3 py-4">
                <div class="card offset-1">
                    <div class="card-body">
                        <h5 class="card-text">Order ID: <span style="font-weight: normal"><%= order.getId()%></span>
                        </h5>
                        <p class="card-title"><span
                                style="font-weight: bold">Products: </span><%= order.getOrderProducts().size()%>
                        </p>
                        <p class="card-title"><span
                                style="font-weight: bold">Profile: </span><%= order.getUser().getEmail()%>
                        </p>
                        <p class="card-title"><span
                                style="font-weight: bold">Total Price: </span><%= numberFormat.format(OrderRepo.getOrderSum(order))%>$
                        </p>
                        <a class="btn btn-warning text-white my-3" href="orderDetails.jsp?orderId=<%=order.getId()%>">Order
                            Details</a>
                    </div>
                </div>
            </div>
            <%
                }
            %>
        </div>
        <div class="col-4">
            <h3 class="text-center">Completed</h3>
            <%
                for (Order order : completedOrders) {
            %>
            <div class="card bg-light rounded my-3 py-4">
                <div class="card offset-1">
                    <div class="card-body">
                        <h5 class="card-text">Order ID: <span style="font-weight: normal"><%= order.getId()%></span>
                        </h5>
                        <p class="card-title"><span
                                style="font-weight: bold">Products: </span><%= order.getOrderProducts().size()%>
                        </p>
                        <p class="card-title"><span
                                style="font-weight: bold">Profile: </span><%= order.getUser().getEmail()%>
                        </p>
                        <p class="card-title"><span
                                style="font-weight: bold">Total Price: </span><%= numberFormat.format(OrderRepo.getOrderSum(order))%>$
                        </p>
                        <a class="btn btn-warning text-white my-3" href="orderDetails.jsp?orderId=<%=order.getId()%>">Order
                            Details</a>
                    </div>
                </div>
            </div>
            <%
                }
            %>
        </div>
    </div>
</div>

</body>
</html>
