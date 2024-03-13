package Controller;

import java.io.IOException;

import DAOs.AdminDAOs;
import DAOs.SellerProductDAOs;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet(name = "AdminRestaurantUpdateController", urlPatterns = {"/Admin/Restaurant/Update"})
public class AdminRestaurantUpdateController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        int  restaurantID = Integer.parseInt(req.getParameter("restaurantID"));
        String restaurantName = req.getParameter("restaurantName");
        String restaurantAddress = req.getParameter("restaurantAddress");
        String restaurantDescription = req.getParameter("restaurantDescription");
        String restaurantImage = req.getParameter("restaurantImage");

        AdminDAOs adminDAOs = new AdminDAOs();
        adminDAOs.updateRestaurant(restaurantName, restaurantAddress, restaurantDescription, restaurantImage, restaurantID);
    }
}
