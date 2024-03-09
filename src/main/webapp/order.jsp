<%@ page import="DAOs.OrderDAOs" %><%--
  Created by IntelliJ IDEA.
  User: IuseArch
  Date: 3/10/24
  Time: 4:50 AM
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    OrderDAOs orderDAOs = new OrderDAOs();
    request.setAttribute("orderDAOs", orderDAOs);
%>

<!DOCTYPE html>
<html>
<head>
    <%@include file="link.jsp" %>
    <title>${sessionScope.username}'s Orders</title>
</head>
<body>
<%@include file="user-header.jsp" %>
<div class="container">
    <h1>${sessionScope.username}'s Orders</h1>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>Order ID</th>
            <th>Order Date</th>
            <th>Order Total</th>
            <th>Order Status</th>
            <th>Order Details</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${Orders}" var="orders">
            <tr>
                <td>${orders.orderID}</td>
                <td>${orders.orderDate}</td>
                <td>${orderDAOs.getTotalPriceByOrderID(orders.orderID)}</td>
                <td>${orders.orderStatus}</td>
                <td><a href="order-details?orderID=${orders.orderID}">Details</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
