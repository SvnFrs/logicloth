<%--
  Created by IntelliJ IDEA.
  User: IuseArch
  Date: 3/9/24
  Time: 10:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
                <li class="list-group-item d-flex justify-content-between lh-condensed">
                    <div>
                        <h6 class="my-0">Product name</h6>
                        <small class="text-muted">Brief description</small>
                    </div>
                    <span class="text-muted">$12</span>
                </li>
                <li class="list-group-item d-flex justify-content-between lh-condensed">
                    <div>
                        <h6 class="my-0">Second product</h6>
                        <small class="text-muted">Brief description</small>
                    </div>
                    <span class="text-muted">$8</span>
                </li>
                <li class="list-group-item d-flex justify-content-between lh-condensed">
                    <div>
                        <h6 class="my-0">Third item</h6>
                        <small class="text-muted">Brief description</small>
                    </div>
                    <span class="text-muted">$5</span>
                </li>
                <li class="list-group-item d-flex justify-content-between bg-light">
                    <div class="text-success">
                        <h6 class="my-0">Promo code</h6>
                        <small>EXAMPLECODE</small>
                    </div>
                    <span class="text-success">-$5</span>
                </li>
                <li class="list-group-item d-flex justify-content-between">
                    <span>Total (VND)</span>
                    <strong>$20</strong>
                </li>
            </ul>
<%--            <form class="card p-2">--%>
<%--                <div class="input-group">--%>
<%--                    <input type="text" class="form-control" placeholder="Promo code">--%>
<%--                    <div class="input-group-append">--%>
<%--                        <button type="submit" class="btn btn-secondary">Redeem</button>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </form>--%>
        </div>
        <div class="col-md-8 order-md-1">
            <h4 class="mb-3">Thông tin thêm</h4>
            <form class="needs-validation" novalidate="">
                <div class="row">
                    <div class="col-md-12 mb-3">
                        <label for="fullName">Full name</label>
                        <input type="text" class="form-control" id="fullName" placeholder="" value="" required="">
                        <div class="invalid-feedback"> Valid full name is required. </div>
                    </div>
                </div>
                <div class="mb-3">
                    <label for="username">Username</label>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">@</span>
                        </div>
                        <input type="text" class="form-control" id="username" placeholder="Username" required="" disabled>
                        <div class="invalid-feedback" style="width: 100%;"> Your username is required. </div>
                    </div>
                </div>
                <div class="mb-3">
                    <label for="phone-number">Số điện thoại</label>
                    <input type="text" class="form-control" id="phone-number" placeholder="0123456789" required="">
                    <div class="invalid-feedback"> Please enter your shipping address. </div>
                </div>
                <div class="mb-3">
                    <label for="address">Address</label>
                    <input type="text" class="form-control" id="address" placeholder="Can Tho" required="">
                    <div class="invalid-feedback"> Please enter your shipping address. </div>
                </div>
<%--                <div class="row">--%>
<%--                    <div class="col-md-5 mb-3">--%>
<%--                        <label for="country">Country</label>--%>
<%--                        <select class="custom-select d-block w-100" id="country" required="">--%>
<%--                            <option value="">Choose...</option>--%>
<%--                            <option>United States</option>--%>
<%--                        </select>--%>
<%--                        <div class="invalid-feedback"> Please select a valid country. </div>--%>
<%--                    </div>--%>
<%--                    <div class="col-md-4 mb-3">--%>
<%--                        <label for="state">State</label>--%>
<%--                        <select class="custom-select d-block w-100" id="state" required="">--%>
<%--                            <option value="">Choose...</option>--%>
<%--                            <option>California</option>--%>
<%--                        </select>--%>
<%--                        <div class="invalid-feedback"> Please provide a valid state. </div>--%>
<%--                    </div>--%>
<%--                    <div class="col-md-3 mb-3">--%>
<%--                        <label for="zip">Zip</label>--%>
<%--                        <input type="text" class="form-control" id="zip" placeholder="" required="">--%>
<%--                        <div class="invalid-feedback"> Zip code required. </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
                <hr class="mb-4">
                <div class="custom-control custom-checkbox">
                    <input type="checkbox" class="custom-control-input" id="save-info">
                    <label class="custom-control-label" for="save-info">Save this information for next time</label>
                </div>
                <hr class="mb-4">
                <h4 class="mb-3">Payment</h4>
                <div class="d-block my-3">
                    <div class="custom-control custom-radio">
                        <input id="cod" name="paymentMethod" type="radio" class="custom-control-input" checked="" required="">
                        <label class="custom-control-label" for="cod">Thanh toán khi nhận hàng</label>
                    </div>
                </div>
                <hr class="mb-4">
                <div class="row">
                    <div class="btn-group">
                        <button class="btn btn-secondary" type="reset">Cancel</button>
                        <button class="btn btn-primary" type="submit">Order</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<%@include file="footer.jsp" %>
</body>
</html>
