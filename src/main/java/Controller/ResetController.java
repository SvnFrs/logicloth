/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAOs.AccountDAOs;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author admin
 */
@WebServlet(name = "ResetController", urlPatterns = {"/Reset"})
public class ResetController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher("reset-password.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String newPass = request.getParameter("new-password");
        String confirm = request.getParameter("confirm-new-password");
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        AccountDAOs dao = new AccountDAOs();
        boolean isValid = true;

        //Kiểm tra mật khẩu mới
        if (newPass.isEmpty()) {
            isValid = false;
            request.setAttribute("newPassError", "Bạn cần điền vào trường này!");
        } else if (newPass.length() < 6) {
            isValid = false;
            request.setAttribute("newPassError", "Mật khẩu phải có độ dài từ 6 trở lên!");
        } else {
            request.setAttribute("newPassError", "");
        }

        //Kiểm tra nhập lại mật khẩu
        if (confirm.isEmpty()) {
            isValid = false;
            request.setAttribute("confirmNewPassError", "Bạn cần điền vào trường này!");
        } else if (confirm.length() < 6) {
            isValid = false;
            request.setAttribute("confirmNewPassError", "Mật khẩu nhập lại phải có độ dài từ 6 trở lên!");
        } else if (!confirm.equals(newPass)) {
            isValid = false;
            request.setAttribute("confirmNewPassError", "Mật khẩu bạn nhập không khớp!");
        } else {
            request.setAttribute("confirmNewPassError", "");
        }

        if (isValid) {
            try {
                int result = dao.updatePassword(email, newPass);
                if (result > 0) {
                    session.setAttribute("message", "Đặt lại mật khẩu thành công!");
                    response.sendRedirect("/Login");
                }else{
                    session.setAttribute("message", "Đặt lại mật khẩu thất bại!");
                    response.sendRedirect("/Login");
                }
            } catch (SQLException ex) {
                Logger.getLogger(ResetController.class.getName()).log(Level.SEVERE, null, ex);
            }

        } else {
            RequestDispatcher rd = request.getRequestDispatcher("reset-password.jsp");
            rd.forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
