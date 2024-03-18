<%@ page import="DAOs.SellerOrderDAOs" %>
<%@ page import="DAOs.AddressDAOs" %>
<%@ page import="DAOs.ProductDAOs" %>
<%@ page import="DAOs.OrderDAOs" %>
<%--
    Document   : seller
    Created on : Mar 1, 2024, 7:05:38 PM
    Author     : admin
--%>

<%
    SellerOrderDAOs sellerOrderDAOs = new SellerOrderDAOs();
    request.setAttribute("sellerOrderDAOs", sellerOrderDAOs);
    OrderDAOs orderDAOs = new OrderDAOs();
    request.setAttribute("orderDAOs", orderDAOs);
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
                            <td>${sellerOrderDAOs.getOrderStatusByOrderStatusID(orderDAOs.getOrderStatusByOrderIDAndRestaurantID(order.orderID, RestaurantID))}</td>
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
                    <%--            <c:forEach items="${sellerOrderDAOs.getOrderDetailsByOrderIDAndRestaurantID(order.orderID, restaurantID)}"--%>
                var="orders">
                <div class="modal-dialog modal-lg modal-dialog-scrollable">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Order <span class="text-success fs-4">${order.orderID}'s</span>
                                Detail</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
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
                                                        items="${sellerOrderDAOs.getOrderDetailsByOrderID(order.orderID)}"
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
                                    <div class="my-5">
                                        <c:choose>
                                            <c:when test="${order.orderStatus == 4}">
                                                <div class="card">
                                                    <div class="card-header text-center">
                                                        Order Status
                                                    </div>
                                                    <div class="card-body text-center">
                                                        <p class="text-success">${addressDAOs.getAddressByOrderID(order.orderID).receiverName}
                                                            đã nhận đơn hàng</p>
                                                    </div>
                                                </div>
                                            </c:when>
                                            <c:when test="${order.orderStatus == 6}">
                                                <div class="card">
                                                    <div class="card-header text-center">
                                                        Order Status
                                                    </div>
                                                    <div class="card-body text-center">
                                                        <p class="text-danger">${addressDAOs.getAddressByOrderID(order.orderID).receiverName}
                                                            đã hủy đơn hàng</p>
                                                    </div>
                                                </div>
                                            </c:when>
                                            <c:otherwise>
                                                <select class="form-select"
                                                        aria-label="order-status-${order.orderID}"
                                                        id="order-status-${order.orderID}">
                                                    <option value="${orderDAOs.getOrderStatusByOrderIDAndRestaurantID(order.orderID, RestaurantID)}"
                                                            selected>${sellerOrderDAOs.getOrderStatusByOrderStatusID(orderDAOs.getOrderStatusByOrderIDAndRestaurantID(order.orderID, RestaurantID))}</option>
                                                    <c:forEach
                                                            items="${sellerOrderDAOs.allOrderStatusBySeller(orderDAOs.getOrderStatusByOrderIDAndRestaurantID(order.orderID, RestaurantID))}"
                                                            var="orderStatus">
                                                        <option value="${orderStatus.orderStatusID}">${orderStatus.orderStatus}</option>
                                                    </c:forEach>
                                                        <%--                                            <option value="${sellerOrderDAOs.lastOrderStatusID()}">${sellerOrderDAOs.getOrderStatusByOrderStatusID(sellerOrderDAOs.lastOrderStatusID())}</option>--%>
                                                </select>
                                            </c:otherwise>
                                        </c:choose>
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
                            Total Paid: <span
                                class="text-success fs-4">${sellerOrderDAOs.getTotalPriceByOrderID(order.orderID)}</span>
                            <div class="row">
                                <div class="col-12">
                                    <button type="button" class="btn btn-primary"
                                            onclick="updateOrderStatus(${order.orderID})">Update
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%--            </c:forEach>--%>
        </c:forEach>

    </div>

    <div class="container-xxl py-5">
        <div class="card">
            <div class="card-header">
                <div class="row">
                    <div class="col-lg-10 col-md-9">
                        Product List
                    </div>
                    <div class="col-lg-2 col-md-3 text-end justify-content-end">
                        <a href="" class="btn btn-success"
                           data-bs-toggle="modal" data-bs-target="#product-add-modal"
                        >Add Product</a>
                    </div>
                </div>
            </div>
            <div class="card-body">
                <table class="table table-striped align-middle">
                    <thead>
                    <tr>
                        <th>Product ID</th>
                        <th>Product Name</th>
                        <th>Product Image</th>
                        <th>Product Price</th>
                        <th>Product Stock</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${Products}" var="product">
                        <tr>
                            <td>${product.productID}</td>
                            <td>${product.productName}</td>
                            <td><img src="${product.productImage}" alt="" class="img-fluid"
                                     style="width: auto;height: 100px;object-fit: contain;"></td>
                            <td>${product.productPrice}</td>
                            <td>${product.productQuantity}</td>
                            <td>
                                <div class="btn-group-lg">
                                    <div class="row">
                                        <a href="" class="btn btn-primary"
                                           data-bs-toggle="modal"
                                           data-bs-target="#product-update-modal-${product.productID}"
                                        >Update</a>
                                        <a href="<%= request.getServletContext().getContextPath()%>/Seller/Product/Delete?productID=${product.productID}"
                                           class="btn btn-danger">Delete</a>

                                    </div>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

        <c:forEach items="${Products}" var="product">
            <div class="modal fade" id="product-update-modal-${product.productID}" tabindex="-1" aria-hidden="true">
                <div class="modal-dialog modal-lg modal-dialog-scrollable">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Update<span class="text-success fs-4">${product.productID}</span>
                                Detail</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form>
                                <div class="row">
                                    <div class="col-lg-9 col-md-12">
                                        <div class="mb-3">
                                            <label for="product-update-name-${product.productID}" class="form-label">Product
                                                name</label>
                                            <input pattern="^[a-zA-Z0-9\s\-_',.()&]+$" 
                                            title="Product name can contain letters, numbers, spaces, and certain punctuation marks" type="text" class="form-control"
                                                   id="product-update-name-${product.productID}"
                                                   value="${product.productName}"
                                                   aria-describedby="product-name">
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-12">
                                        <div class="mb-3">
                                            <label for="product-update-price-${product.productID}" class="form-label
                                        ">Product price</label>
                                        <!-- add pattern to input only numer as prices -->
                                            <input pattern="^\d+(\.\d{1,2})?$" 
                                            title="Price must be in decimal format (e.g., 10.99, 100.00)" type="text" class="form-control"
                                                   id="product-update-price-${product.productID}"
                                                   value="${product.productPrice}"
                                                   aria-describedby="product-price">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-9 col-md-12">
                                        <div class="mb-3">
                                            <label for="product-update-quantity-${product.productID}"
                                                   class="form-label">Product quantity</label>
                                            <input pattern="^[1-9]\d*$" title="Quantity must be a positive integer"
                                             type="text" class="form-control"
                                                   id="product-update-quantity-${product.productID}"
                                                   value="${product.productQuantity}"
                                                   aria-describedby="product-quantity">
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-12">
                                        <div class="mb-3">
                                            <label for="product-update-status-${product.productID}" class="form-label">Product
                                                status</label>
                                            <select class="form-select" aria-label="product-status"
                                                    id="product-update-status-${product.productID}">
                                                <c:if test="${product.status == false}">
                                                    <option value="false" selected>Unavailable</option>
                                                    <option value="true">Available</option>
                                                </c:if>
                                                <c:if test="${product.status == true}">
                                                    <option value="true" selected>Available</option>
                                                    <option value="false">Unavailable</option>
                                                </c:if>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12 col-md-12">
                                        <label for="product-update-description-${product.productID}" class="form-label">Product
                                            description</label>
                                        <textarea class="form-control"
                                                  id="product-update-description-${product.productID}" rows="3"
                                                  value="${product.productDescription}"
                                        ></textarea>
                                    </div>
                                </div>
                            </form>
                            <div class="col-lg-12 col-md-12">
                                    <%--                            <form id="uploadForm-${product.productID}" method="post" action="" enctype="multipart/form-data">--%>
                                    <%--                                <label class="form-label">Product image</label>--%>
                                    <%--                                <div class="row">--%>
                                    <%--                                    <div class="col-lg-9 col-md-12">--%>
                                    <%--                                        <input type="file" id="fileInput-${product.productID}" name="multiPartServlet" class="form-control"/>--%>
                                    <%--                                    </div>--%>
                                    <%--                                    <div class="col-lg-3 col-md-12">--%>
                                    <%--                                        <input type="submit" value="Upload" class="form-control"/>--%>
                                    <%--                                    </div>--%>
                                    <%--                                </div>--%>
                                    <%--                            </form>--%>
                                <div class="mb-3">
                                    <label class="form-label" for="image-path">Ảnh quán ăn</label>
                                    <input type="text" id="image-path" class="form-control"
                                           placeholder="Xin nhập link ảnh">
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <div class="row">
                                <div class="col-12">
                                    <button type="button" class="btn btn-primary"
                                            onclick="updateProduct(${product.productID})">Update
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>

        <div class="modal fade" id="product-add-modal" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-scrollable">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Add<span class="text-success fs-4"></span>
                            Product</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">

                        <form>
                            <div class="row">
                                <div class="col-lg-9 col-md-12">
                                    <div class="mb-3">
                                        <label for="product-add-name" class="form-label">Product name</label>
                                        <input type="text" class="form-control" id="product-add-name"
                                               aria-describedby="product-name">
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-12">
                                    <div class="mb-3">
                                        <label for="product-add-price" class="form-label
                                        ">Product price</label>
                                        <input type="text" class="form-control" id="product-add-price"
                                               aria-describedby="product-price">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-9 col-md-12">
                                    <div class="mb-3">
                                        <label for="product-add-quantity" class="form-label">Product quantity</label>
                                        <input type="text" class="form-control" id="product-add-quantity"
                                               aria-describedby="product-quantity">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12 col-md-12">
                                    <label for="product-add-description" class="form-label">Product description</label>
                                    <textarea class="form-control" id="product-add-description" rows="3"></textarea>
                                </div>
                            </div>
                        </form>
                        <div class="col-lg-12 col-md-12">
                            <%--                            <form id="product-add-image" method="post" action="" enctype="multipart/form-data">--%>
                            <%--                                <label class="form-label">Product image</label>--%>
                            <%--                                <div class="row">--%>
                            <%--                                    <div class="col-lg-9 col-md-12">--%>
                            <%--                                        <input type="file" id="product-add-file" name="multiPartServlet"--%>
                            <%--                                               class="form-control"/>--%>
                            <%--                                    </div>--%>
                            <%--                                    <div class="col-lg-3 col-md-12">--%>
                            <%--                                        <input type="submit" value="Upload" class="form-control"/>--%>
                            <%--                                    </div>--%>
                            <%--                                </div>--%>
                            <%--                            </form>--%>
                            <div class="mb-3">
                                <label class="form-label" for="product-add-image-path">Ảnh món ăn</label>
                                <input type="text" id="product-add-image-path" class="form-control"
                                       placeholder="Xin nhập link ảnh">
                            </div>
                           </div>
                    </div>
                    <div class="modal-footer">
                        <div class="row">
                            <div class="col-12">
                                <button type="button" class="btn btn-primary" onclick="addProduct()">Add</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container-xxl py-5">
        <div class="card">
            <div class="card-header">
                <div class="row">
                    <div class="col-lg-10 col-md-9">
                        Sales Report
                    </div>
                </div>
            </div>
            <div class="card-body">
                <table class="table table-striped align-middle">
                    <thead>
                    <tr>
                        <th>Date</th>
                        <th>Amount</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    <jsp:useBean id="Sales" scope="session" type="java.util.List"/>
                    <c:forEach items="${Sales}" var="sale">
                        <tr>
                            <td>${sale.saleDate}</td>
                            <td>${sale.totalSale}</td>
                            <td>
                                <div class="btn-group-lg">
                                    <div class="row">
                                        <a href="" class="btn btn-primary"
                                           data-bs-toggle="modal" data-bs-target=""
                                        >Detail</a>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</main>

<script src="js/add.js"></script>
<script src="js/update.js"></script>
<script src="js/upload.js"></script>
<%@include file="footer.jsp" %>
</body>
</html>
