<%--
  Created by IntelliJ IDEA.
  User: IuseArch
  Date: 3/8/24
  Time: 1:30 AM
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="DAOs.ProductDAOs" %>
<%@ page import="Model.product" %>


<%
    ProductDAOs productDAOs = new ProductDAOs();
    request.setAttribute("productDAOs", productDAOs);
%>


<!DOCTYPE html>
<html>
<head>
    <%@include file="link.jsp" %>
    <title>${sessionScope.username}'s Cart</title>
</head>
<body>
<%@include file="user-header.jsp" %>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <h1>${sessionScope.username}'s Cart</h1>
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th></th>
                    <th>Product Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Subtotal</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="cartItem" items="${CartItems}">
                    <tr>
                        <td>
                            <div class="form-check d-flex justify-content-center">
                                <input class="form-check-input" type="checkbox" value="" id="choose-${cartItem.productID}" name="productChooser">
                                <label class="form-check-label" for="choose-${cartItem.productID}">
                                </label>
                                <input value="${productDAOs.getProductByID(cartItem.productID).productQuantity}"
                                       hidden="hidden"
                                       id="${cartItem.productID}-max-quantity"
                                >
                            </div>
                        </td>
<%--                        <td><img src="${productDAOs.getProductByID(cartItem.productID).productImage}"/></td>--%>
                        <td>${productDAOs.getProductByID(cartItem.productID).productName}</td>
                        <td>
                            <span id="price-${cartItem.productID}">
                                    ${productDAOs.getProductByID(cartItem.productID).productPrice}
                            </span>
                        </td>
                        <td class="align-middle" style="width: 15%;">
                            <div id="" class="d-flex flex-row">
                                <div class="input-group-btn">
                                    <button
                                            onclick=""
                                            class="btn btn-sm btn-dark btn-minus"
                                            id="btn-minus-${cartItem.productID}"
                                    >
                                        <i class="fa fa-minus"></i>
                                    </button>
                                </div>
                                <input type="text"
                                       id="quantity-${cartItem.productID}"
                                       class="form-control form-control-sm bg-white text-center"
                                       value="${cartItem.quantity}" disabled>
                                <div class="input-group-btn">
                                    <button
                                            onclick=""
                                            class="btn btn-sm btn-dark btn-plus"
                                            id="btn-plus-${cartItem.productID}"
                                    >
                                        <i class="fa fa-plus"></i>
                                    </button>
                                </div>
                            </div>
                        </td>
                        <td class="align-middle text-center" style="width: 10vw">
                            <span style="width: 10vw">
                                <input id="subtotal-${cartItem.productID}"
                                       value="${cartItem.quantity * productDAOs.getProductByID(cartItem.productID).productPrice}"
                                       disabled style="width:7vw">
                            </span>
                        </td>
                        <td>
                            <button id="remove-${cartItem.productID}" class="btn btn-sm btn-danger btn-remove">
                                Remove
                            </button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <h3 id="total">Total: </h3> <!-- You'll need to calculate the total -->
            <a href="" id="checkout-button" class="btn btn-primary">Checkout</a>
        </div>
    </div>

</div>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="js/cart.js"></script>
<%--<script src="js/checkout.js"></script>--%>
<%@include file="footer.jsp" %>
</body>
</html>
