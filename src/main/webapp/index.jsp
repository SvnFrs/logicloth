<%--<jsp:useBean id="Restaurant" scope="session" type="Model.restaurant"/>--%>
<%--
    Document   : index
    Created on : Jan 4, 2024, 8:49:25 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="link.jsp"%>
        <title>Home</title>
    </head>
    <body>

    <c:if test="${sessionScope.user == null}">
        <%@include file="guest-header.jsp" %>
    </c:if>
    <c:if test="${sessionScope.user != null}">
        <%@include file="user-header.jsp" %>
    </c:if>

    <main>
        <div class="container">
            <div class="content">
                <div class="left-content">
                    <div class="content-heading">
                        <h4>Được chọn nhiều</h4>
                    </div>
                    <div class="most-choice">
                        <div class="row">
                            <div class="tag"><a href="">Bánh mì</a></div>
                            <div class="tag"><a href="">Cơm tấm</a></div>
                            <div class="tag"><a href="">Hủ tiếu</a></div>
                            <div class="tag"><a href="">Pizza</a></div>
                        </div>

                        <div class="row">
                            <div class="tag"><a href="">Cháo</a></div>
                            <div class="tag"><a href="">Gà rán - Burger</a></div>
                            <div class="tag"><a href="">Trà sữa</a></div>
                            <div class="tag"><a href="">Khác</a></div>
                        </div>
                    </div>
                </div>

                <div class="right-content">
                    <div class="content-heading">
                        <h4>Một số gian hàng đề cử</h4>
                    </div>
                    <div class="list-restaurant container">
                        <%--<c:forEach var="restaurant" items="${Restaurants}" varStatus="status">--%>
                        <jsp:useBean id="Restaurants" scope="session" type="java.util.List"/>
                        <c:forEach var="restaurant" items="${Restaurants}" varStatus="status">
                        <c:if test="${status.index % 3 == 0}">
                        <c:if test="${!status.first}">
                    </div> <!-- Close the previous row if it's not the first item -->
                    </c:if>
                    <div class="row">
                        </c:if>

                        <div class="col-lg-4 col-md-12">
                                <%--                        <a href="<%= request.getServletContext().getContextPath()%>/Restaurant?restaurantID=${restaurant.restaurantID}" style="color: inherit; text-decoration: none;">--%>
                            <a href="${contextPath}/Restaurant?restaurantID=${restaurant.restaurantID}"
                               style="color: inherit; text-decoration: none;">

                                <div class="img-holder">
                                    <img src="${restaurant.restaurantImage}" class="img-100 img-fluid" alt="">
                                </div>

                                <div class="food-title">
                                    <p class="restaurant-name">${restaurant.restaurantName}</p>
                                    <p class="restaurant-description">${restaurant.restaurantDescription}</p>
                                    <div class="rate">
                                        <div class="rating">
                                            <i class="fa-solid fa-star"></i>
                                                <%--                                        <span>${restaurant.rating}</span>--%>
                                        </div>

                                        <div class="price">
                                            <i class="fa fa-money-bill-1-wave"></i>
                                                <%--                                        <p>${restaurant.priceRange}</p>--%>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>

                        <c:if test="${status.last}">
                    </div> <!-- Close the last row -->
                    </c:if>
                    </c:forEach>
                </div>
            </div>
        </div>
    </main>
    </body>
<%@include file="footer.jsp" %>
</html>
