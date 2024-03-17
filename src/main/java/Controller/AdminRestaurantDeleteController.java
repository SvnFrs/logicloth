package Controller;

import java.io.IOException;

import DAOs.AdminDAOs;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet(name = "AdminRestaurantDeleteController", urlPatterns = {"/Admin/Restaurant/Delete"})
public class AdminRestaurantDeleteController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        AdminDAOs adminDAOs = new AdminDAOs();
        int restaurantID = Integer.parseInt(req.getParameter("restaurantID"));
        adminDAOs.deleteRestaurant(restaurantID);
        resp.sendRedirect(req.getContextPath() + "/Admin");
    }
}
