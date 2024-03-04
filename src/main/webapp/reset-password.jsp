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
        <link rel="stylesheet" href="Css/style.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
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
        <script src="main.js"></script>
        <script>
            Validator('#forgot');
        </script>
    </body>
</html>
