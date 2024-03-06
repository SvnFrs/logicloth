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
    <title>Admin Login</title>
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

                            <div class="remember">
                                <input type="checkbox" name="remember" id="remember">
                                <label for="remember">Ghi nhớ tài khoản</label>
                            </div>

                            <%--                                    <button class="submit" id="submitButton">Đăng nhập</button>--%>
                            <input type="button" id="submitButton" value="Đăng nhập" class="submit">
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
