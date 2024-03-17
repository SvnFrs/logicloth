package Controller;

import DAOs.AccountDAOs;
import DAOs.AdminDAOs;
import DAOs.ProductDAOs;
import DAOs.RestaurantDAOs;
import Model.account;
import Model.product;
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

@WebServlet(name = "RestaurantController", urlPatterns = {"/Restaurant"})
public class RestaurantController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getRequestURI();
        try {
            int restaurantID = Integer.parseInt(req.getParameter("restaurantID"));
            RestaurantDAOs restaurantDAOs = new RestaurantDAOs();
            ProductDAOs productDAOs = new ProductDAOs();
            restaurant singleRestaurant = restaurantDAOs.getRestaurantByID(restaurantID);
            String restaurantName = restaurantDAOs.getNameByID(restaurantID);
            List<product> products = productDAOs.getAllByID(restaurantID);
            req.setAttribute("restaurantID", restaurantID);
            req.setAttribute("Restaurant", singleRestaurant);
            req.setAttribute("restaurantName", restaurantName);
            req.setAttribute("Products", products);
            req.setAttribute("contextPath", req.getServletContext().getContextPath());
            RequestDispatcher rd = req.getRequestDispatcher("restaurant.jsp");
            rd.forward(req, resp);
        } catch (Exception e) {
            Logger.getLogger(RestaurantController.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
