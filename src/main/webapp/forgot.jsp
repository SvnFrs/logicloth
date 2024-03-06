<%-- 
    Document   : forgot
    Created on : Jan 24, 2024, 11:10:01 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="link.jsp"%>
        <title>Forgot Password</title>
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
                </div>
            </div>
        </header>

        <div class="main">
            <div class="forgot">
                <h3>Quên mật khẩu</h3>
                <div class="forgot-form">
                    <form action="Forgot" method="post" id="forgot">
                        <div class="forgot-email">
                            <div class="form-group">
                                <label>Nhập email của bạn</label>
                                <input type="email" id="email" name="forgot-email" placeholder="VD: nguyenvana1123@gmail.com">
                                <span class="err-message">${requestScope.forgotError}</span>
                            </div>

                            <div class="btn">
                                <button id="continue">Tiếp tục</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp"%>
        <script>
            Validator('#forgot');
        </script>
    </body>
</html>
