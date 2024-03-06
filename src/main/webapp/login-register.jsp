<%-- 
    Document   : login
    Created on : Jan 15, 2024, 7:31:04 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="link.jsp" %>
        <title>Login</title>
    </head>
    <body>
        <%
            String message = (String) session.getAttribute("message");
            if (message != null) {
        %>
        <script>alert("<%= message%>");</script>
        <%
                session.removeAttribute("message"); // Xóa thông báo sau khi hiển thị
            }
        %>
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
                </div>
            </div>
        </header>


        <main style="background-image: none; padding-top: 0px; padding-bottom: 0px;">
            <div class="login-interface">
                <div class="left-side">
                    <img src="images/3639_160126224550363737441452448.jpg" alt="">
                </div>

                <div class="right-side">
                    <div class="slider">
                        <div class="list">
                            <div class="login-form item">
                                <h3>Đăng nhập</h3>
<%--                                <form action="Login" method="post" id="Login">--%>
                                <form  id="Login">
                                    <div class="user-name">
                                        <i class="fa-regular fa-envelope"></i>
                                        <input type="text" name="login-name" id="login-name" rules="required" placeholder="Tên đăng nhập" required>
                                    </div>

                                    <div class="pass">
                                        <i class="fa-solid fa-lock"></i>
                                        <input type="password" name="login-password" id="login-password" rules="required" placeholder="Mật khẩu"required>
                                    </div>
                                    <span class="err-message" style="color: red; font-size: 15px">${requestScope.loginError}</span>

                                    <div class="forgot-link">
                                        <a href="forgot.jsp">Quên mật khẩu?</a>
                                    </div>

                                    <div class="role-switcher">
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="role" id="userRole" value="User">
                                            <label class="form-check-label" for="userRole">
                                                User
                                            </label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="role" id="sellerRole" value="Seller">
                                            <label class="form-check-label" for="sellerRole">
                                                Seller
                                            </label>
                                        </div>
                                    </div>
                                    <div class="remember">
                                        <input type="checkbox" name="remember" id="remember">
                                        <label for="remember">Ghi nhớ tài khoản</label>
                                    </div>

<%--                                    <button class="submit" id="submitButton">Đăng nhập</button>--%>
                                    <input type="button" id="submitButton" value="Đăng nhập" class="submit" onclick="CommonLogin()">
                                    <div class="register-link">
                                        <p>Bạn chưa có tài khoản?<span id="next">Đăng ký</span></p>
                                    </div>
                                </form>
                            </div>

                            <div class="register-form item">
                                <h3>Đăng ký</h3>
                                <form action="Register" method="post" id="regis">
                                    <div class="form-group">
                                        <label class="fw-medium fs-6">Họ và tên</label>
                                        <input type="text" id="fullname" name="fullname" placeholder="VD: Nguyễn Văn A" rules="required|checklengthname" required>
                                        <span class="err-message">${requestScope.fullnameError}</span>
                                    </div>

                                    <div class="form-group">
                                        <label class="fw-medium fs-6">Tên đăng nhập</label>
                                        <input type="text" id="register-name" name="register-name" rules="required|checkusername" placeholder="VD: Hoang Thien" required>
                                        <span class="err-message">${requestScope.usernameError}</span>
                                    </div>


                                    <div class="form-group">
                                        <label class="fw-medium fs-6">Email</label>
                                        <input type="email" id="email" name="register-email" placeholder="VD: nguyenvana1123@gmail.com" rules="required|email" required>
                                        <span class="err-message">${requestScope.emailError}</span>
                                    </div>

                                    <div class="role-chooser mb-2">
                                        <label class="fw-medium fs-6">Vai trò</label>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="role" id="regUser" value="user" required>
                                            <label class="form-check-label" for="regUser">
                                                User
                                            </label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="role" id="regSeller" value="seller" required>
                                            <label class="form-check-label" for="regSeller">
                                                Seller
                                            </label>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="fw-medium fs-6">Mật khẩu</label>
                                        <input type="password" id="password" name="register-password" rules="required|checkpasswordlength" required>
                                        <span class="err-message">${requestScope.passwordError}</span>
                                    </div>

                                    <div class="form-group">
                                        <label class="fw-medium fs-6">Nhập lại mật khẩu</label>
                                        <input type="password" id="confirm-password" name="confirm-password" rules="required|checkpasswordlength|checkpassword" required>
                                        <span class="err-message">${requestScope.confirmPasswordError}</span>
                                    </div>

                                    <button class="submit t20px">Đăng ký</button>

                                    <p>Bạn đã có tài khoản?<span id="prev">Đăng nhập</span></p>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <%@include file="footer.jsp"%>
        <script src="js/login.js"></script>
        <script>
                Validator('#regis');
                ValidatorUserName('#Login');
                ValidatorPass('#Login');
        </script>
    </body>
</html>
