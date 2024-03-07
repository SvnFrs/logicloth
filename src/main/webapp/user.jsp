<%-- 
    Document   : user-page
    Created on : Feb 29, 2024, 10:50:55 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="link.jsp"%>
        <title>D&C Food</title>
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

                    <div class="other" style="justify-content: end; gap: 30px">
                        <div class="search">
                            <input type="text" name="search-product" id="search" placeholder="Nhập từ khóa cần tìm...">
                            <i class="fa-solid fa-magnifying-glass"></i>
                        </div>

                        <div class="user-icon">
                            <div id="mySidenav" class="sidenav">
                                <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                                <div class="infor">
                                    <div class="infor-icon">
                                        <i class="fa-regular fa-user"></i>
                                    </div>

                                    <h3>Huynh Nhut Khang</h3>
                                </div>
                                <a href="#">Thông tin</a>
                                <a href="#">Đơn hàng hiện có</a>
                                <a href="index.jsp">Đăng xuất</a>
                            </div>
                            <i class="fa-regular fa-user" onclick="openNav()"></i>
                        </div>

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

                        <div class="list-food">
                            <div class="row">
                                <div class="col">
                                    <div class="food-img">
                                        <img src="images/1707-vietnam-3881.jpg" alt="">
                                    </div>

                                    <div class="food-title">
                                        <p class="restaurant-name">Tên của gian hàng</p>
                                        <p class="restaurant-decription">Thông tin cơ bản và địa chỉ</p>
                                        <div class="rate">
                                            <div class="rating">
                                                <i class="fa-solid fa-star"></i>
                                                <span>5.0</span>
                                            </div>

                                            <div class="price">
                                                <i class="fa fa-money-bill-1-wave"></i>
                                                <p>19.000 - 199.000đ</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col">
                                    <div class="food-img">
                                        <img src="images/1707-vietnam-3881.jpg" alt="">
                                    </div>

                                    <div class="food-title">
                                        <p class="restaurant-name">Tên của gian hàng</p>
                                        <p class="restaurant-decription">Thông tin cơ bản và địa chỉ</p>
                                        <div class="rate">
                                            <div class="rating">
                                                <i class="fa-solid fa-star"></i>
                                                <span>5.0</span>
                                            </div>

                                            <div class="price">
                                                <i class="fa fa-money-bill-1-wave"></i>
                                                <p>19.000 - 199.000đ</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col">
                                    <div class="food-img">
                                        <img src="images/1707-vietnam-3881.jpg" alt="">
                                    </div>

                                    <div class="food-title">
                                        <p class="restaurant-name">Tên của gian hàng</p>
                                        <p class="restaurant-decription">Thông tin cơ bản và địa chỉ</p>
                                        <div class="rate">
                                            <div class="rating">
                                                <i class="fa-solid fa-star"></i>
                                                <span>5.0</span>
                                            </div>

                                            <div class="price">
                                                <i class="fa fa-money-bill-1-wave"></i>
                                                <p>19.000 - 199.000đ</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <div class="food-img">
                                        <img src="images/1707-vietnam-3881.jpg" alt="">
                                    </div>

                                    <div class="food-title">
                                        <p class="restaurant-name">Tên của gian hàng</p>
                                        <p class="restaurant-decription">Thông tin cơ bản và địa chỉ</p>
                                        <div class="rate">
                                            <div class="rating">
                                                <i class="fa-solid fa-star"></i>
                                                <span>5.0</span>
                                            </div>

                                            <div class="price">
                                                <i class="fa fa-money-bill-1-wave"></i>
                                                <p>19.000 - 199.000đ</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col">
                                    <div class="food-img">
                                        <img src="images/1707-vietnam-3881.jpg" alt="">
                                    </div>

                                    <div class="food-title">
                                        <p class="restaurant-name">Tên của gian hàng</p>
                                        <p class="restaurant-decription">Thông tin cơ bản và địa chỉ</p>
                                        <div class="rate">
                                            <div class="rating">
                                                <i class="fa-solid fa-star"></i>
                                                <span>5.0</span>
                                            </div>

                                            <div class="price">
                                                <i class="fa fa-money-bill-1-wave"></i>
                                                <p>19.000 - 199.000đ</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col">
                                    <div class="food-img">
                                        <img src="images/1707-vietnam-3881.jpg" alt="">
                                    </div>

                                    <div class="food-title">
                                        <p class="restaurant-name">Tên của gian hàng</p>
                                        <p class="restaurant-decription">Thông tin cơ bản và địa chỉ</p>
                                        <div class="rate">
                                            <div class="rating">
                                                <i class="fa-solid fa-star"></i>
                                                <span>5.0</span>
                                            </div>

                                            <div class="price">
                                                <i class="fa fa-money-bill-1-wave"></i>
                                                <p>19.000 - 199.000đ</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="food-img">
                                        <img src="images/1707-vietnam-3881.jpg" alt="">
                                    </div>

                                    <div class="food-title">
                                        <p class="restaurant-name">Tên của gian hàng</p>
                                        <p class="restaurant-decription">Thông tin cơ bản và địa chỉ</p>
                                        <div class="rate">
                                            <div class="rating">
                                                <i class="fa-solid fa-star"></i>
                                                <span>5.0</span>
                                            </div>

                                            <div class="price">
                                                <i class="fa fa-money-bill-1-wave"></i>
                                                <p>19.000 - 199.000đ</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col">
                                    <div class="food-img">
                                        <img src="images/1707-vietnam-3881.jpg" alt="">
                                    </div>

                                    <div class="food-title">
                                        <p class="restaurant-name">Tên của gian hàng</p>
                                        <p class="restaurant-decription">Thông tin cơ bản và địa chỉ</p>
                                        <div class="rate">
                                            <div class="rating">
                                                <i class="fa-solid fa-star"></i>
                                                <span>5.0</span>
                                            </div>

                                            <div class="price">
                                                <i class="fa fa-money-bill-1-wave"></i>
                                                <p>19.000 - 199.000đ</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col">
                                    <div class="food-img">
                                        <img src="images/1707-vietnam-3881.jpg" alt="">
                                    </div>

                                    <div class="food-title">
                                        <p class="restaurant-name">Tên của gian hàng</p>
                                        <p class="restaurant-decription">Thông tin cơ bản và địa chỉ</p>
                                        <div class="rate">
                                            <div class="rating">
                                                <i class="fa-solid fa-star"></i>
                                                <span>5.0</span>
                                            </div>

                                            <div class="price">
                                                <i class="fa fa-money-bill-1-wave"></i>
                                                <p>19.000 - 199.000đ</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
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

        <%@include file="footer.jsp"%>
    </body>
</html>
