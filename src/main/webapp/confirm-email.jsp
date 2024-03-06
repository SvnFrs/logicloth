<%-- 
    Document   : confirm-email
    Created on : Feb 29, 2024, 12:21:47 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <%@include file="link.jsp"%>
        <title>Confirm email</title>
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
                <div class="email-verification">
                    <h3>D&C Food đã gửi email xác nhận cho bạn</h3>
                    <form action="Confirm" method="post">
                        <div class="form-group" style="margin-bottom: 5px;">
                            <input type="text" id="code" name="code" placeholder="Nhập mã xác nhận">
                            <span class="err-message">${requestScope.confirmError}</span>
                        </div>

                        <div class="btn">
                            <button id="continue">Tiếp tục</button>
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
