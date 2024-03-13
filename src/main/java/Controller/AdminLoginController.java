/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAOs.AccountDAOs;
import DAOs.AdminDAOs;
import Model.account;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author admin
 */
@WebServlet(name = "AdminLoginController", urlPatterns = {"/Login/Admin"})
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
            AdminDAOs adminDAOs = new AdminDAOs();
            AccountDAOs accountDAOs = new AccountDAOs();
            boolean result = adminDAOs.adminLogin(acc);

            if (result) {
                int userID = accountDAOs.getUserID(acc);
                Cookie adminCookie = new Cookie("userID", String.valueOf(userID));
                HttpSession session = request.getSession();
                session.setAttribute("adminID", userID);
                session.setAttribute("adminCookie", adminCookie);
                response.addCookie(adminCookie);

                // Send success response to JavaScript
                response.getWriter().write("Admin Login successfully");

                // Redirect to admin page
                response.sendRedirect(request.getContextPath() + "/Admin");
            } else {
                response.getWriter().write("Login failed");
                request.setAttribute("loginError", "Sai tài khoản hoặc mật khẩu!");
                RequestDispatcher rd = request.getRequestDispatcher("admin-login.jsp");
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
