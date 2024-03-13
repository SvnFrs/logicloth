package Controller;

import DAOs.AccountDAOs;
import DAOs.AdminDAOs;
import Model.account;
import Model.restaurant;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "AdminController", urlPatterns = {"/Admin"})
public class AdminController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("adminID") == null) {
            response.sendRedirect(request.getContextPath() + "/AdminLogin");
        } else {
            AdminDAOs adminDAOs = new AdminDAOs();
            AccountDAOs accountDAOs = new AccountDAOs();
            String username;
            try {
                username = accountDAOs.getNameByID((int) session.getAttribute("adminID"));
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            List<account> accounts = adminDAOs.getAllAccountsButAdmin();
            List<restaurant> restaurants = adminDAOs.getAllRestaurants();
            session.setAttribute("username", username);
            request.setAttribute("accounts", accounts);
            request.setAttribute("restaurants", restaurants);
            RequestDispatcher rd = request.getRequestDispatcher("admin.jsp");
            rd.forward(request, response);
        }
    }
}
