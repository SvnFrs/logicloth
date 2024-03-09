/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAOs.SellerDAOs;
import DAOs.AccountDAOs;
import Model.account;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.sql.SQLException;
import java.util.Objects;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author admin
 */
@WebServlet(name = "SellerLoginController", urlPatterns = {"/Login/Seller"})
public class SellerLoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("login-name");
        String password = request.getParameter("login-password");
        String remember = request.getParameter("rememberMe");

        try {
            account acc = new account(username, password);
            SellerDAOs sellerDAOs = new SellerDAOs();
            AccountDAOs accountDAOs = new AccountDAOs();
            boolean result = sellerDAOs.sellerLogin(acc);

            if (result) {
                int userID = accountDAOs.getUserID(acc);
                Cookie sellerCookie = new Cookie("userID", String.valueOf(userID));
                HttpSession session = request.getSession();
                session.setAttribute("userID", userID);
                session.setAttribute("sellerCookie", sellerCookie);
                response.addCookie(sellerCookie);

                if (Objects.equals(remember, "true")) {
                    sellerCookie.setMaxAge(60 * 60 * 24 * 30);
                } else {
                    sellerCookie.setMaxAge(0);
                }

                // Send success response to JavaScript
                response.getWriter().write("Seller Login successfully");
//                response.getWriter().write(session.getAttribute("userID").toString());
            } else {
                // Send failure response to JavaScript
                response.getWriter().write("Login failed");
            }
        } catch (SQLException ex) {
            Logger.getLogger(AdminLoginController.class.getName()).log(Level.SEVERE, null, ex);
            // Send failure response to JavaScript
            response.getWriter().write("Login failed");
        }
    }
}