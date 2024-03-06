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
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author admin
 */
@WebServlet(name = "LoginControl", urlPatterns = {"/Login"})
public class AdminLoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("login-name");
        String password = request.getParameter("login-password");

        try {
            account acc = new account(username, password);
            AccountDAOs dao = new AccountDAOs();
            boolean result = dao.Login(acc);

            if (result) {
                request.setAttribute("loginError", "");
                String role = dao.getRole(acc);
                switch (role) {
                    case "user":
                        response.sendRedirect("user.jsp");
                        break;
                    case "seller":
                        response.sendRedirect("seller.jsp");
                        break;
                    case "admin":
                        response.sendRedirect("admin.jsp");
                        break;
                    default:
                        throw new AssertionError();
                }

            } else {
                request.setAttribute("loginError", "Sai tài khoản hoặc mật khẩu!");
                RequestDispatcher rd = request.getRequestDispatcher("login-register.jsp");
                rd.forward(request, response);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AdminLoginController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
