/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAOs.AccountDAOs;
import Model.account;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author admin
 */
public class RegisterController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        boolean isValid = true;
        String fullName = request.getParameter("fullname");
        String email = request.getParameter("register-email");
        String username = request.getParameter("register-name");
        String role = request.getParameter("role");
        String password = request.getParameter("register-password");
        String confirmPassword = request.getParameter("confirm-password");
        String emailRegex = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
//        String role = "user";

        //Kiểm tra fullname
        if (fullName.isEmpty()) {
            isValid = false;
            request.setAttribute("fullnameError", "Bạn cần điền vào trường này!");
        } else if (fullName.length() < 3 || fullName.length() > 30) {
            isValid = false;
            request.setAttribute("fullnameError", "Họ và tên phải từ 3 đến 30 ký tự!");
        } else {
            request.setAttribute("fullnameError", "");
        }

        //Kiểm tra email
        if (email.isEmpty()) {
            isValid = false;
            request.setAttribute("emailError", "Bạn cần điền vào trường này!");
        } else if (!email.matches(emailRegex)) {
            isValid = false;
            request.setAttribute("emailError", "Email bạn nhập không đúng!");
        } else {
            request.setAttribute("emailError", "");
        }

        //Kiểm tra tên đăng nhập
        if (username.isEmpty()) {
            isValid = false;
            request.setAttribute("usernameError", "Bạn cần điền vào trường này!");
        } else if (username.length() < 3 || username.length() > 30) {
            isValid = false;
            request.setAttribute("usernameError", "Tên đăng nhập phải từ 3 đến 30 ký tự!");
        } else {
            request.setAttribute("usernameError", "");
        }

        //Kiểm tra mật khẩu
        if (password.isEmpty()) {
            isValid = false;
            request.setAttribute("passwordError", "Bạn cần điền vào trường này!");
        } else if (password.length() < 6) {
            isValid = false;
            request.setAttribute("passwordError", "Độ dài của mật khẩu phải từ 6 trở lên!");
        } else {
            request.setAttribute("passwordError", "");
        }

        //Kiểm tra nhập lại mật khẩu
        if (confirmPassword.isEmpty()) {
            isValid = false;
            request.setAttribute("confirmPasswordError", "Bạn cần điền vào trường này!");
        } else if (!confirmPassword.equals(password)) {
            isValid = false;
            request.setAttribute("confirmPasswordError", "Mật khẩu mà bạn nhập lại không trùng khớp!");
        } else {
            request.setAttribute("confirmPasswordError", "");
        }

        //Kiểm tra isValid
        if (isValid) {
            account acc = new account(fullName, email, username, password, role);
            AccountDAOs ad = new AccountDAOs();
            ad.AddNew(acc);
            HttpSession session = request.getSession();
            session.setAttribute("message", "Bạn đã đăng ký tài khoản thành công!");
            response.sendRedirect("login-register.jsp");
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("message", "Đăng ký chưa thành công, vui lòng kiểm tra lại thông tin!");
            RequestDispatcher rd = request.getRequestDispatcher("login-register.jsp");
            rd.forward(request, response);
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
