<jsp:useBean id="Restaurant" scope="request" type="Model.restaurant"/>
<%--<jsp:useBean id="Products" scope="request" type="Model.product"/>--%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <%@include file="link.jsp" %>
    <title>${requestScope.restaurantName}</title>
</head>
<body>

<c:if test="${sessionScope.userID == null}">
    <%@include file="guest-header.jsp" %>
</c:if>
<c:if test="${sessionScope.userID != null}">
    <%@include file="user-header.jsp" %>
</c:if>

<div class="bg-cream">
    <div class="container-xxl py-5">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <div class="d-flex justify-content-lg-end justify-content-md-center justify-content-sm-center">
                        <img src="${Restaurant.restaurantImage}" class="img-fluid img-200"/>
                    </div>
                </div>
                <div class="col-md-6">
                    <h1>${Restaurant.restaurantName}</h1>
                    <p>${Restaurant.restaurantAddress}</p>
                    <p>${Restaurant.restaurantDescription}</p>
                </div>
            </div>
        </div>
    </div>
    <div class="container-xxl py-5">
        <div class="container">
            <div class="h2">
                <h2>Menu</h2>
            </div>
            <div class="row">
                <jsp:useBean id="Products" scope="request" type="java.util.List"/>
                <c:forEach var="product" items="${Products}">
                    <div class="col-md-4 col-sm-12 p-2">
                        <div class="card">
                            <a href="" data-bs-toggle="modal" data-bs-target="#exampleModal${product.productID}"
                               style="color: inherit; text-decoration: none;">
                                <div class="card-img">
                                    <img src="${product.productImage}" class="img-fluid" alt="images/1707-vietnam-3881.jpg"/>
<%--                                    <img src="images/1707-vietnam-3881.jpg" class="img-fluid" alt="">--%>
                                </div>
                                <div class="card-body">
                                    <h5 class="card-title">${product.productName}</h5>
                                    <div class="h-25">
                                        <p class="card-text">${product.productDescription}</p>
                                    </div>
                                    <div class="p-lg-2">
                                        <p class="card-text text-center text-success">Giá : ${product.productPrice}.Đ</p>
                                    </div>
                                    <div>
                                        <p class="text-center text-success">Số lượng : ${product.productQuantity}</p>
                                    </div>
                                    <div>
                                        <a href="${contextPath}/AddToCart?productID=${product.productID}&quantity=1&restaurantID=${Restaurant.restaurantID}"
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
                                    <img src="${product.productImage}" class="img-fluid" alt="images/1707-vietnam-3881.jpg"/>
                                </div>
                                <div class="modal-footer">
                                    <a href="${contextPath}/AddToCart?productID=${product.productID}&quantity=1"
                                       class="btn btn-primary">Add to Cart</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>

</div>
<%@include file="footer.jsp" %>
</body>
</html>
