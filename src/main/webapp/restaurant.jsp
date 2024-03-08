<jsp:useBean id="Restaurant" scope="request" type="Model.restaurant"/>
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

    <%@include file="user-header.jsp"%>

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
                    <div class="col-md-4 col-sm-12">
                        <div class="card">
                            <div class="card-img">
                                <img src="${product.productImage}" class="img-fluid"/>
                            </div>
                            <div class="card-body">
                                <h5 class="card-title">${product.productName}</h5>
                                <p class="card-text">${product.productDescription}</p>
                                <p class="card-text">${product.productPrice}</p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
    <%@include file="footer.jsp" %>
</body>
</html>
