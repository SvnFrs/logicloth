package Controller;

import java.io.IOException;

import DAOs.AdminDAOs;
import DAOs.SellerProductDAOs;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet(name = "AdminRestaurantAddController", urlPatterns = {"/Admin/Restaurant/Add"})
public class AdminRestaurantAddController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        int  restaurantID = Integer.parseInt(req.getParameter("restaurantID"));
        String restaurantName = req.getParameter("restaurantName");
        int sellerID = Integer.parseInt(req.getParameter("sellerID"));
        String restaurantAddress = req.getParameter("restaurantAddress");
        String restaurantDescription = req.getParameter("restaurantDescription");
        String restaurantImage = req.getParameter("restaurantImage");

        AdminDAOs adminDAOs = new AdminDAOs();
        adminDAOs.addRestaurant(sellerID, restaurantID, restaurantName, restaurantAddress, restaurantDescription, restaurantImage);
    }
}
