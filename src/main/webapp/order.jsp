<%@ page import="DAOs.*" %><%--
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
    AddressDAOs addressDAOs = new AddressDAOs();
    request.setAttribute("addressDAOs", addressDAOs);
    ProductDAOs productDAOs = new ProductDAOs();
    request.setAttribute("productDAOs", productDAOs);
    RestaurantDAOs restaurantDAOs = new RestaurantDAOs();
    request.setAttribute("restaurantDAOs", restaurantDAOs);
%>

<!DOCTYPE html>
<html>
<head>
    <%@include file="link.jsp" %>
    <title>${sessionScope.username}'s Orders</title>
</head>
<body>
<%@include file="user-header.jsp" %>

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
                    <th>Order Date</th>
<%--                    <th>Order Status</th>--%>
                    <th>Order Total</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${Orders}" var="orders">
                    <tr>
                        <td>${orders.orderID}</td>
                        <td>
                            <span id="date-${orders.orderID}">
                                    ${orders.orderDate}
                            </span>
                        </td>
<%--                        <td>${orderDAOs.getOrderStatusByOrderStatusID(orders.orderStatus)}</td>--%>
                        <td>${orderDAOs.getTotalPriceByOrderID(orders.orderID)}</td>
                        <td>
                            <a href="" class="btn btn-primary"
                               data-bs-toggle="modal" data-bs-target="#order-modal-${orders.orderID}"
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
            <div class="modal-dialog modal-lg modal-dialog-scrollable">
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
                                            <c:forEach
                                                    items="${orderDAOs.getOrderDetailsByOrderID(order.orderID)}"
                                                    var="orderDetail">
                                                <tr>
                                                    <td>${productDAOs.getProductByID(orderDetail.productID).productName}</td>
                                                    <td>${orderDetail.quantity}</td>
                                                    <td>${orderDetail.totalPrice}</td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="my-2">
                                    <div class="card">
                                        <div class="card-header">
                                            Order Status
                                        </div>
                                        <div class="card-body">
<%--                                            <p>${orderDAOs.getOrderStatusByOrderStatusID(order.orderStatus)}</p>--%>
                                            <c:forEach items="${orderDAOs.getRestaurantIDByOrderID(order.orderID)}" var="orderStatus">
                                                <p>Restaurant: ${restaurantDAOs.getRestaurantByID(orderStatus.restaurantID).restaurantName}</p>
                                                <p>Status: ${orderDAOs.getOrderStatusByOrderStatusID(orderDAOs.getOrderStatusByOrderIDAndRestaurantID(order.orderID, orderStatus.restaurantID))}</p>
                                                <c:if test="${orderDAOs.getOrderStatusByOrderIDAndRestaurantID(order.orderID, orderStatus.restaurantID) == 1}">
                                                    <button id="cancel-order-${order.orderID}"
                                                            class="btn btn-danger"
                                                            onclick="cancelOrder(${order.orderID}, ${orderStatus.restaurantID})"
                                                    >
                                                        Cancel Order
                                                    </button>
                                                </c:if>
                                                <c:if test="${orderDAOs.getOrderStatusByOrderIDAndRestaurantID(order.orderID, orderStatus.restaurantID) > 1 && orderDAOs.getOrderStatusByOrderIDAndRestaurantID(order.orderID, orderStatus.restaurantID) < 3 }">
                                                    <button id="receive-order-${order.orderID}"
                                                            class="btn btn-success disabled"
                                                    >
                                                        Đã nhận được hàng
                                                    </button>
                                                </c:if>
                                                <c:if test="${orderDAOs.getOrderStatusByOrderIDAndRestaurantID(order.orderID, orderStatus.restaurantID) == 3}">
                                                    <button id="receive-order-${order.orderID}"
                                                            class="btn btn-success"
                                                            onclick="receivedOrder(${order.orderID}, ${orderStatus.restaurantID})"
                                                    >
                                                        Đã nhận được hàng
                                                    </button>
                                                </c:if>
                                            </c:forEach>
                                        </div>
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
                                                    <%--                                                        <p>Order Status: ${sellerOrderDAOs.getOrderStatusByOrderStatusID(order.orderStatus)}</p>--%>
                                            </div>
                                            <div class="col-lg-12 col-md-12">
                                                <p>Customer
                                                    Name: ${addressDAOs.getAddressByOrderID(order.orderID).receiverName}</p>
                                                <p>Customer
                                                    Phone: ${addressDAOs.getAddressByOrderID(order.orderID).phoneNumber}</p>
                                                <p>Customer
                                                    Address: ${addressDAOs.getAddressByOrderID(order.orderID).address}</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        Total: <span
                            class="text-success fs-4">${orderDAOs.getTotalPriceByOrderID(order.orderID)}</span>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
</div>

<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="js/order.js"></script>
<%@include file="footer.jsp" %>
</body>
</html>
