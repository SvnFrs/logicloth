<%--
  Created by IntelliJ IDEA.
  User: IuseArch
  Date: 3/8/24
  Time: 1:30 AM
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <%@include file="link.jsp" %>
    <title>${sessionScope.username}'s Cart</title>
</head>
<body>
<%@include file="user-header.jsp" %>
<div class="container">
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
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="choose">
                                <label class="form-check-label" for="choose">
                                </label>
                            </div>
                        </td>
                        <td><img src="${productDAOs.getProductByID(cartItem.productID).productImage}"/></td>
                        <td>${productDAOs.getProductByID(cartItem.productID).productName}</td>
                        <td>${productDAOs.getProductByID(cartItem.productID).productPrice}</td>
                        <td>${cartItem.quantity}</td>
                        <td>${cartItem.quantity * productDAOs.getProductByID(cartItem.productID).productPrice}</td>
                        <td><a href="">Remove</a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <h3>Total: </h3> <!-- You'll need to calculate the total -->
            <a href="" class="btn btn-primary">Checkout</a>
        </div>
    </div>

</div>
<%@include file="footer.jsp" %>
</body>
</html>
