package Controller;

import DAOs.AccountDAOs;
import DAOs.AdminDAOs;
import DAOs.RestaurantDAOs;
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

@WebServlet(name = "UserController", urlPatterns = {"/User"})
public class UserController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // if the user is not logged in, redirect to login page
        HttpSession session = request.getSession();
        if (session.getAttribute("userID") == null) {
            response.sendRedirect(request.getContextPath() + "/Login");
        } else {
            AccountDAOs accountDAOs = new AccountDAOs();
            RestaurantDAOs restaurantDAOs = new RestaurantDAOs();
            String username;
            try {
                username = accountDAOs.getNameByID((int) session.getAttribute("userID"));
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            List<restaurant> restaurants = restaurantDAOs.getAll();
            request.setAttribute("contextPath", request.getServletContext().getContextPath());
            request.setAttribute("Restaurants", restaurants);
            session.setAttribute("username", username);
            RequestDispatcher rd = request.getRequestDispatcher("user.jsp");
            rd.forward(request, response);
        }
    }
}
