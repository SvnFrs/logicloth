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
        <script src="https://accounts.google.com/gsi/client" async></script>

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
                            <a href="${pageContext.request.contextPath}/"><img src="images/D&C Food (1).png" alt="logo"></a>
                        </div>

                        <div class="logo-name">
                            <a href="${pageContext.request.contextPath}/">
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
                                        <a href="${pageContext.request.contextPath}/Forgot">Quên mật khẩu ?</a>
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
                                        <input type="checkbox" name="remember-me" id="remember-me">
                                        <label for="remember-me">Ghi nhớ tài khoản</label>
                                    </div>


                                    <input type="button" id="submitButton" value="Đăng nhập" class="submit" onclick="CommonLogin()">
                                    

                                        <div id="g_id_onload"
                                            data-client_id="520426773417-jkl1slr0qquv9vrujs83crfmf8f8nnlg.apps.googleusercontent.com"
                                            data-context="signin"
                                            data-ux_mode="popup"
                                            data-callback="onSignIn"
                                            data-auto_prompt="false">
                                        </div>

                                        <div class="g_id_signin"
                                            data-type="standard"
                                            data-shape="rectangular"
                                            data-theme="outline"
                                            data-text="signin_with"
                                            data-size="large"
                                            data-logo_alignment="left">
                                        </div>



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
                                        <input  pattern="^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$" title="Full name must contain only alphabetical characters with optional punctuation and spaces" type="text" id="fullname" name="fullname" placeholder="VD: Nguyễn Văn A" rules="required|checklengthname" required>
                                        <span class="err-message">${requestScope.fullnameError}</span>
                                    </div>

                                    <div class="form-group">
                                        <label class="fw-medium fs-6">Tên đăng nhập</label>
                                        <input pattern="[a-zA-Z][a-zA-Z0-9_]{2,15}" title="Username must start with a letter, contain only letters, numbers, or underscores, and be between 3 and 16 characters long."  type="text" id="register-name" name="register-name" rules="required|checkusername" placeholder="VD: Hoang Thien" required>
                                        <span class="err-message">${requestScope.usernameError}</span>
                                    </div>


                                    <div class="form-group">
                                        <label class="fw-medium fs-6">Email</label>
                                        <input pattern="\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b" title="Please enter a valid email address." type="email" id="email" name="register-email" placeholder="VD: nguyenvana1123@gmail.com" rules="required|email" required>
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
                                        <input pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, and one number." type="password" id="password" name="register-password" rules="required|checkpasswordlength" required>
                                        <span class="err-message">${requestScope.passwordError}</span>
                                    </div>

                                    <div class="form-group">
                                        <label class="fw-medium fs-6">Nhập lại mật khẩu</label>
                                        <input pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, and one number." type="password" id="confirm-password" name="confirm-password" rules="required|checkpasswordlength|checkpassword" required>
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
        <script>
            function onSignIn(googleUser) {
              // Lấy các trường thông tin từ đối tượng JSON googleUser
              console.log(googleUser);
              const clientId = googleUser.clientId;
              const client_id = googleUser.client_id;
              const credential = googleUser.credential;
              console.log(clientId);
          
              // Gửi GET request đến server
              fetch(`http://localhost:3030/get_credential/` + credential, {
                method: "GET",
                mode: "cors",
                headers: {
                  "Content-Type": "application/json",
                },
              })
                .then((response) => response.json())
                .then((data) => {


                  console.log(data);
                  document.getElementById("login-name").value = data.email.split("@")[0];
                  document.getElementById("login-password").value = data.password;
                  var regUserInput = document.querySelector("#userRole");
                  regUserInput.setAttribute("checked", true);
          
                  // document.getElementById("txtEmail").style.display = "none";
                  // document.getElementById("txtPassword").style.display = "none";
                  CommonLogin()
                })
                .catch((error) => {
                  console.error("Error:", error);
                });
            }
          </script>

        <script src="js/login.js"></script>
        <script>
                Validator('#regis');
                ValidatorUserName('#Login');
                ValidatorPass('#Login');
        </script>
    </body>
</html>
