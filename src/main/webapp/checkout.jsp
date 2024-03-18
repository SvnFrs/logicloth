<%--
  Created by IntelliJ IDEA.
  User: IuseArch
  Date: 3/9/24
  Time: 10:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="DAOs.ProductDAOs" %>
<%@ page import="DAOs.CheckoutDAOs" %>

<%
    ProductDAOs productDAOs = new ProductDAOs();
    request.setAttribute("productDAOs", productDAOs);
    CheckoutDAOs checkoutDAOs = new CheckoutDAOs();
    request.setAttribute("checkoutDAOs", checkoutDAOs);
%>

<!DOCTYPE html>
<html>
<head>
    <%@include file="link.jsp" %>
    <title>Checkout</title>
</head>
<body>
<%@include file="user-header.jsp" %>
<div class="container">
    <div class="py-5 text-center">
        <h2>Checkout form</h2>
    </div>
    <div class="row">
        <div class="col-md-4 order-md-2 mb-4">
            <h4 class="d-flex justify-content-between align-items-center mb-3">
                <span class="text-muted">Your cart</span>
                <span class="badge badge-secondary badge-pill">3</span>
            </h4>
            <ul class="list-group mb-3 sticky-top">
                <c:forEach var="item" items="${CheckoutItems}">
                    <li class="list-group-item d-flex justify-content-between lh-condensed">
                        <div>
                            <h6 class="my-0">${productDAOs.getProductByID(item.productID).productName}</h6> <!-- Assuming productName is a property of checkout -->
                            <small class="text-muted">${item.quantity}</small> <!-- Assuming productDescription is a property of checkout -->
                        </div>
                        <span class="text-muted">${productDAOs.getProductByID(item.productID).productPrice}</span> <!-- Assuming productPrice is a property of checkout -->
                    </li>
                </c:forEach>
<%--                <li class="list-group-item d-flex justify-content-between bg-light">--%>
<%--                    <div class="text-success">--%>
<%--                        <h6 class="my-0">Promo code</h6>--%>
<%--                        <small>EXAMPLECODE</small>--%>
<%--                    </div>--%>
<%--                    <span class="text-success">-$5</span>--%>
<%--                </li>--%>
                <li class="list-group-item d-flex justify-content-between">
                    <span>Total (VND)</span>
                    <strong>${TotalPrice}</strong>
                </li>
            </ul>
        </div>
        <div class="col-md-8 order-md-1">
            <h4 class="mb-3">Thông tin thêm</h4>
            <form class="" novalidate="" action="">
                <div class="row">
                    <div class="col-md-12 mb-3">
                        <label for="fullName">Full name</label>
                        <input type="text" class="form-control" id="fullName" placeholder="" value="" required="required">
                        <div class="invalid-feedback"> Valid full name is required. </div>
                    </div>
                </div>
                <div class="mb-3">
                    <label for="phone-number">Số điện thoại</label>
                    <input type="text" class="form-control" id="phone-number" placeholder="0123456789" required="required"
                           pattern="0\d{9,10}" title="Please enter a valid Vietnam phone number starting with 0, and containing 10 or 11 digits">
                    <div class="invalid-feedback"> Please enter your phone number. </div>
                </div>
                <div class="mb-3">
                    <label for="address">Address</label>
                    <input type="text" class="form-control" id="address" placeholder="Can Tho" required="">
                    <div class="invalid-feedback"> Please enter your shipping address. </div>
                </div>
                <hr class="mb-4">
                <div class="custom-control custom-checkbox">
                    <input type="checkbox" class="custom-control-input" id="save-info">
                    <label class="custom-control-label" for="save-info">Save this information for next time</label>
                </div>
                <hr class="mb-4">
                <h4 class="mb-3">Payment</h4>
                <div class="d-block my-3">
                    <div class="custom-control custom-radio">
                        <input id="cod" name="cod" type="radio" class="custom-control-input" checked="" required="">
                        <label class="custom-control-label" for="cod">Thanh toán khi nhận hàng</label>
                    </div>
                </div>
                <hr class="mb-4">
                <div class="row">
                    <div class="btn-group">
                        <button class="btn btn-secondary" type="button" onclick="backToCart()">Cancel</button>
                        <button class="btn btn-primary" type="submit">Order</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<%@include file="footer.jsp" %>
<script>
    $(document).ready(function () {
        $('#phone-number').on('input', function () {
            var phoneNumber = $(this).val();
            var phoneNumberPattern = /^(0\d{9,10})$/;

            if (phoneNumberPattern.test(phoneNumber)) {
                $(this).removeClass('is-invalid');
                $(this).addClass('is-valid');
            } else {
                $(this).removeClass('is-valid');
                $(this).addClass('is-invalid');
            }
        });

        $('#phone-number').on('invalid', function () {
            if ($(this).val() === '') {
                $(this).removeClass('is-valid');
                $(this).addClass('is-invalid');
            }
        });
    });
</script>
<script src="js/checkout.js"></script>
</body>
</html>
