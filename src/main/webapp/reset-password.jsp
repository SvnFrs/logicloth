<%-- 
    Document   : reset-password
    Created on : Feb 29, 2024, 12:40:58 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="link.jsp"%>
        <title>Reset Password</title>
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
            <div class="reset">
                <h3>Thay đổi mật khẩu</h3>
                <form action="Reset" id="reset-pass" method="post">
                    <div class="form-group">
                        <label>Nhập mật khẩu mới</label>
                        <input type="password" id="new-password" name="new-password">
                        <span class="err-message">${requestScope.newPassError}</span>
                    </div>

                    <div class="form-group">
                        <label>Nhập lại mật khẩu</label>
                        <input type="password" id="confirm-new-password" name="confirm-new-password">
                        <span class="err-message">${requestScope.confirmNewPassError}</span>
                    </div>

                    <div class="btn">
                        <button id="continue">Đổi mật khẩu</button>
                    </div>
                </form>
            </div>
        </div>

        <%@include file="footer.jsp"%>
        <script>
            Validator('#forgot');
        </script>
    </body>
</html>
