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
        <link rel="stylesheet" href="Css/style.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
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
