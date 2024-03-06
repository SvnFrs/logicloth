/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAOs.UserDAOs;
import DAOs.AccountDAOs;
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
@WebServlet(name = "LoginControl", urlPatterns = {"/Login/User"})
public class UserLoginController extends HttpServlet {

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
            UserDAOs userDAOs = new UserDAOs();
            AccountDAOs accountDAOs = new AccountDAOs();
            boolean result = userDAOs.userLogin(acc);

            if (result) {
                int userID = accountDAOs.getUserID(acc);
                Cookie userCookie = new Cookie("userID", String.valueOf(userID));
                HttpSession session = request.getSession();
                session.setAttribute("userID", userID);
                session.setAttribute("userCookie", userCookie);
                response.addCookie(userCookie);

                // Send success response to JavaScript
                response.getWriter().write("User Login successfully");
            } else {
                // Send failure response to JavaScript
                response.getWriter().write("Login failed");
            }
        } catch (SQLException ex) {
            Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
            // Send failure response to JavaScript
            response.getWriter().write("Login failed");
        }
    }
}