<%@ page import="DAOs.ProductDAOs" %><%--<jsp:useBean id="Restaurant" scope="request" type="Model.restaurant"/>--%>
<%--<jsp:useBean id="Products" scope="request" type="Model.product"/>--%>
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
    <title>${requestScope.restaurantName}</title>
</head>
<body>

<%
    ProductDAOs productDAOs = new ProductDAOs();
    request.setAttribute("ProductsDAOs", productDAOs);
%>

<c:if test="${sessionScope.user == null}">
    <%@include file="guest-header.jsp" %>
</c:if>
<c:if test="${sessionScope.user != null}">
    <%@include file="user-header.jsp" %>
</c:if>

<div class="bg-cream">
    <div class="container-xxl py-5">
        <div class="container">
            <div class="h2">
                <h2>Menu</h2>
            </div>
            <div class="row">
                <jsp:useBean id="Products" scope="request" type="java.util.List"/>
                <c:choose>
                    <c:when test="${ProductsDAOs.isEmptyOrNull(Products)}">
                        <div class="col-md-12 col-sm-12 p-2">
                            <h3>Không có kết quả.</h3>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="product" items="${Products}">
                            <div class="col-md-4 col-sm-12 p-2">
                                <div class="card">
                                    <a href="" data-bs-toggle="modal" data-bs-target="#exampleModal${product.productID}"
                                       style="color: inherit; text-decoration: none;">
                                        <div class="card-img">
                                                <%--                                <img src="${product.productImage}" class="img-fluid"/>--%>
                                            <img src="images/1707-vietnam-3881.jpg" class="img-fluid" alt="">
                                        </div>
                                        <div class="card-body">
                                            <h5 class="card-title">${product.productName}</h5>
                                            <div class="h-25">
                                                <p class="card-text">${product.productDescription}</p>
                                            </div>
                                            <div class="p-lg-2">
                                                <p class="card-text text-center text-success">${product.productPrice}</p>
                                            </div>
                                            <div>
                                                <p>${product.productQuantity}</p>
                                            </div>
                                            <div>
                                                <a href="${contextPath}/AddToCart?productID=${product.productID}&quantity=1"
                                                   class="btn btn-primary">Add to Cart</a>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <div class="modal fade" id="exampleModal${product.productID}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h1 class="modal-title fs-5" id="exampleModalLabel">${product.productName}</h1>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <img src="images/1707-vietnam-3881.jpg" class="img-fluid" alt="">
                                        </div>
                                        <div class="modal-footer">
                                            <a href="${contextPath}/AddToCart?productID=${product.productID}&quantity=1"
                                               class="btn btn-primary">Add to Cart</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>


            </div>
        </div>
    </div>

</div>
<script src="js/main.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
