<%@ page import="DAOs.SellerOrderDAOs" %>
<%@ page import="DAOs.AddressDAOs" %>
<%@ page import="DAOs.ProductDAOs" %>
<%--
    Document   : seller
    Created on : Mar 1, 2024, 7:05:38 PM
    Author     : admin
--%>

<%
    SellerOrderDAOs sellerOrderDAOs = new SellerOrderDAOs();
    request.setAttribute("sellerOrderDAOs", sellerOrderDAOs);
    AddressDAOs addressDAOs = new AddressDAOs();
    request.setAttribute("addressDAOs", addressDAOs);
    ProductDAOs productDAOs = new ProductDAOs();
    request.setAttribute("productDAOs", productDAOs);
%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%@include file="link.jsp" %>
    <title>D&C Food</title>
</head>
<body>

<%@include file="seller-header.jsp" %>

<main>
    <div class="container-xxl py-5">
        <div class="card">
            <div class="card-header">
                Order List
            </div>
            <div class="card-body">
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Customer Name</th>
                        <th>Order Date</th>
                        <th>Order Status</th>
                        <th>Order Total</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${Orders}" var="order">
                        <tr>
                            <td>${order.orderID}</td>
                            <td>${addressDAOs.getAddressByOrderID(order.orderID).receiverName}</td>
                            <td>
                            <span id="date-${order.orderID}">
                                    ${order.orderDate}
                            </span>
                            </td>
                            <td>${sellerOrderDAOs.getOrderStatusByOrderStatusID(order.orderStatus)}</td>
                            <td>${sellerOrderDAOs.getTotalPriceByOrderID(order.orderID)}</td>
                            <td>
                                <a href="" class="btn btn-primary"
                                   data-bs-toggle="modal" data-bs-target="#order-modal-${order.orderID}"
                                >Detail</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

        <jsp:useBean id="Orders" scope="session" type="java.util.List"/>
        <c:forEach items="${Orders}" var="order">
            <div class="modal fade" id="order-modal-${order.orderID}" tabindex="-1" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Order <span class="text-success fs-4">${order.orderID}'s</span>
                                Detail</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-lg-6 col-md-12">
                                    <div class="card">
                                        <div class="card-header">
                                            Order Detail
                                        </div>
                                        <div class="card-body container-fluid">
                                            <table class="table table-striped align-middle text-center">
                                                <thead class="align-middle">
                                                <tr>
                                                    <th>Product Name</th>
                                                    <th>Quantity</th>
                                                    <th>Price</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach begin="1" end="${sellerOrderDAOs.countOrderInOrderDetailsByOrderID(order.orderID)}"  var="orderDetails">
                                                    <tr>
                                                        <td>${productDAOs.getProductByID(sellerOrderDAOs.getOrderDetailByOrderID(order.orderID).productID).productName}</td>
                                                        <td>${sellerOrderDAOs.getOrderDetailByOrderID(order.orderID).quantity}</td>
                                                        <td>${sellerOrderDAOs.getOrderDetailByOrderID(order.orderID).totalPrice}</td>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-12 col-sm-12">
                                    <div class="card">
                                        <div class="card-header">
                                            Order Information
                                        </div>
                                        <div class="card-body">
                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12">
                                                        <p>Order ID: ${order.orderID}</p>
                                                        <p>Order Date: ${order.orderDate}</p>
                                                        <p>Order Status: ${sellerOrderDAOs.getOrderStatusByOrderStatusID(order.orderStatus)}</p>
                                                    </div>
                                                    <div class="col-lg-12 col-md-12">
                                                        <p>Customer Name: ${addressDAOs.getAddressByOrderID(order.orderID).receiverName}</p>
                                                        <p>Customer Phone: ${addressDAOs.getAddressByOrderID(order.orderID).phoneNumber}</p>
                                                        <p>Customer Address: ${addressDAOs.getAddressByOrderID(order.orderID).address}</p>
                                                    </div>
                                                </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            Total Paid: <span class="text-success fs-4">${sellerOrderDAOs.getTotalPriceByOrderID(order.orderID)}</span>
                            <div class="row">
                                <div class="col-12">
                                    <button type="button" class="btn btn-primary">Update</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>

    </div>
</main>

<%@include file="footer.jsp" %>
</body>
</html>
