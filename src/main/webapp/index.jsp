<%-- 
    Document   : index
    Created on : Jan 4, 2024, 8:49:25 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="Css/style.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <title>Home</title>
    </head>
    <body>
        <header>
        <div class="container">
            <div class="head">
                <div class="logo">
                    <div class="logo-img">
                        <a href="index.jsp"><img src="images/D&C Food (1).png" alt="logo"></a>
                    </div>

                    <div class="logo-name">
                        <a href="index.jsp">
                            <p>D&C Food</p>
                        </a>
                    </div>
                </div>

                <div class="other">
                    <div class="search">
                        <input type="text" name="search-product" id="search" placeholder="Nhập từ khóa cần tìm...">
                        <i class="fa-solid fa-magnifying-glass"></i>
                    </div>
                    <div class="login" onclick="window.location.href = 'login-register.jsp'">Login/Sign Up</div>
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

    <footer>
        <div class="container">
            <h3 class="footer-heading">D&C Food</h3>
            <div class="footer-content">
                <div class="contact">
                    <h3>Liên hệ</h3>
                    <p><span>Điện thoại: </span>0869293003</p>
                    <p><span>Email: </span>khanghnce171827@fpt.edu.vn</p>
                </div>

                <div class="about">
                    <h3>About D&C Food</h3>
                    <ul>
                        <li><a href="">About us</a></li>
                        <li><a href="">Chính sách bảo mật</a></li>
                    </ul>
                </div>
            </div>
            <div class="copyright">
                <p>©D&C Food 2024 | Design by Huynh Nhut Khang</p>
            </div>
        </div>
    </footer>
        <script src="Javascript/main.js"></script>
    </body>
</html>
