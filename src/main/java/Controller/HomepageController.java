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

@WebServlet(name = "HomepageController", urlPatterns = {"/"})
public class HomepageController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // if the user is not logged in, redirect to login page
        HttpSession session = request.getSession();
        AccountDAOs accountDAOs = new AccountDAOs();
        RequestDispatcher rd;
        if (session.getAttribute("userID") == null || session.getAttribute("userID").equals("") || session.getAttribute("userCookie") == null || session.getAttribute("sellerCookie") == null) {
//            response.sendRedirect(request.getContextPath() + "/Login");
            RestaurantDAOs restaurantDAOs = new RestaurantDAOs();
            List<restaurant> restaurants = restaurantDAOs.getAll();
            session.setAttribute("contextPath", request.getServletContext().getContextPath());
            session.setAttribute("Restaurants", restaurants);
            rd = request.getRequestDispatcher("/index.jsp");
            rd.forward(request, response);
        } else {
            try {
                int userID = (int) session.getAttribute("userID");
                String role  = accountDAOs.getRoleByID(userID);

                if (role.equals("seller")) {
//                    rd = request.getRequestDispatcher("/Seller");
                    response.sendRedirect(request.getContextPath() + "/Seller");
                } else {
//                    rd = request.getRequestDispatcher("/User");
                    response.sendRedirect(request.getContextPath() + "/User");
                }
//                rd.forward(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(HomepageController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }
}
