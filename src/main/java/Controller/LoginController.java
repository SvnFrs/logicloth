/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAOs.UserDAOs;
import DAOs.AccountDAOs;
import Model.account;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
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
@WebServlet(name = "LoginController", urlPatterns = {"/Login"})
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        AccountDAOs accountDAOs = new AccountDAOs();
        if (session.getAttribute("userID") != null) {
            int userID = (int) session.getAttribute("userID");
            String role  = null;
            try {
                role = accountDAOs.getRoleByID(userID);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

            if (role.equals("seller")) {
//                    rd = request.getRequestDispatcher("/Seller");
                response.sendRedirect(request.getContextPath() + "/Seller");
            } else {
//                    rd = request.getRequestDispatcher("/User");
                response.sendRedirect(request.getContextPath() + "/User");
            }
        } else {
//            response.sendRedirect(request.getContextPath() + "/login-register.jsp");
            RequestDispatcher rd = request.getRequestDispatcher("login-register.jsp");
            rd.forward(request, response);
        }
    }
}