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
        <header>
        <div class="container">
            <div class="head">
                <div class="logo">
                    <div class="logo-img">
                        <a href="${pageContext.request.contextPath}/"><img src="images/D&C Food (1).png" alt="logo"></a>
                    </div>

                    <div class="logo-name">
                        <a href="${pageContext.request.contextPath}/">
                            <p>D&C Food</p>
                        </a>
                    </div>
                </div>

                <div class="other">
                    <div class="search">
                        <input type="text" name="search-product" id="search" placeholder="Nhập từ khóa cần tìm...">
                        <i class="fa-solid fa-magnifying-glass"></i>
                    </div>
                    <div class="login"><a href="<%=
                    request.getServletContext().getContextPath()%>/Login">Login/Sign Up</a></div>
                    <div class="cart">
                        <i class="fa fa-bag-shopping"></i>
                    </div>
                </div>
            </div>
        </div>
    </header>

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
                        <jsp:useBean id="Restaurants" scope="request" type="java.util.List"/>
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

            <div class="category">
                <div class="category-heading">
                    <p>Các món phù hợp với mọi người</p>
                </div>

                <div class="category-infor">
                    <div class="row gap">
                        <div class="col">
                            <div class="category-img">
                                <img src="images/banh_mi.jpg" alt="">
                            </div>
    
                            <div class="category-title">
                                <p>Bánh mì</p>
                            </div>
                        </div>
    
                        <div class="col">
                            <div class="category-img">
                                <img src="images/pizza.jpg" alt="">
                            </div>
    
                            <div class="category-title">
                                <p>Pizza</p>
                            </div>
                        </div>
    
                        <div class="col">
                            <div class="category-img">
                                <img src="images/tra_sua.jpg" alt="">
                            </div>
    
                            <div class="category-title">
                                <p>Trà sữa</p>
                            </div>
                        </div>
    
                        <div class="col">
                            <div class="category-img">
                                <img src="images/Gà rán.png" alt="">
                            </div>
    
                            <div class="category-title">
                                <p>Gà rán - Burger</p>
                            </div>
                        </div>
                    </div>
    
    
                    <div class="row gap">
                        <div class="col">
                            <div class="category-img">
                                <img src="images/cháo.jpg" alt="">
                            </div>
    
                            <div class="category-title">
                                <p>Cháo</p>
                            </div>
                        </div>
    
                        <div class="col">
                            <div class="category-img">
                                <img src="images/salad.jpg" alt="">
                            </div>
    
                            <div class="category-title">
                                <p>Salad</p>
                            </div>
                        </div>
    
                        <div class="col">
                            <div class="category-img">
                                <img src="images/mi_y.jpg" alt="">
                            </div>
    
                            <div class="category-title">
                                <p>Mì Ý</p>
                            </div>
                        </div>
    
                        <div class="col">
                            <div class="category-img">
                                <img src="images/hu_tieu.jpg" alt="">
                            </div>
    
                            <div class="category-title">
                                <p>Hủ tiếu</p>
                            </div>
                        </div>
                    </div>
    
                    <div class="row gap">
                        <div class="col">
                            <div class="category-img">
                                <img src="images/com.jpg" alt="">
                            </div>
    
                            <div class="category-title">
                                <p>Cơm</p>
                            </div>
                        </div>
    
                        <div class="col">
                            <div class="category-img">
                                <img src="images/an_vat.jpg" alt="">
                            </div>
    
                            <div class="category-title">
                                <p>Ăn vặt</p>
                            </div>
                        </div>
    
                        <div class="col">
                            <div class="category-img">
                                <img src="images/bun.jpg" alt="">
                            </div>
    
                            <div class="category-title">
                                <p>Bún</p>
                            </div>
                        </div>
    
                        <div class="col">
                            <div class="category-img">
                                <img src="images/do_uong_lanh.jpg" alt="">
                            </div>
    
                            <div class="category-title">
                                <p>Đồ uống lạnh</p>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </main>
    </body>
<%@include file="footer.jsp" %>
</html>
