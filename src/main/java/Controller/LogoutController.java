/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAOs.UserDAOs;
import DAOs.AccountDAOs;
import Model.account;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "LogoutController", urlPatterns = {"/Logout"})
public class LogoutController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        try {
            if (session.getAttribute("userCookie") != null) {
                Cookie logoutCookie = (Cookie) session.getAttribute("userCookie");
                logoutCookie.setMaxAge(0);
                resp.addCookie(logoutCookie);
                session.setAttribute("userCookie", null);
                session.setAttribute("userID", null);
                resp.sendRedirect("/FoodWeb/");
            } else if ((Cookie) session.getAttribute("sellerCookie") != null) {
                Cookie logoutCookie = (Cookie) session.getAttribute("sellerCookie");
                logoutCookie.setMaxAge(0);
                resp.addCookie(logoutCookie);
                session.setAttribute("sellerCookie", null);
                session.setAttribute("sellerID", null);
                resp.sendRedirect("/FoodWeb/");
            } else {
                resp.sendRedirect("/FoodWeb/");
            }
        } catch (Exception e) {
            resp.sendRedirect("/FoodWeb/");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}