package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import DAOs.SellerProductDAOs;

@WebServlet(name = "SellerProductAddController", urlPatterns = {"/Seller/Product/Add"})
public class SellerProductAddController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        SellerProductDAOs sellerProductDAOs = new SellerProductDAOs();
        int restaurantID = (int) session.getAttribute("RestaurantID");
        int productID = sellerProductDAOs.getNewProductIDOfRestaurant(restaurantID);
        productID++;
        String productName = req.getParameter("productName");
        String productDescription = req.getParameter("productDescription");
        long productPrice = Long.parseLong(req.getParameter("productPrice"));
        String productImage = req.getParameter("productImage");
        int productQuantity = Integer.parseInt(req.getParameter("productQuantity"));

        sellerProductDAOs.addProduct(productID, restaurantID, productName, productDescription, productPrice, productImage, productQuantity);
    }
}
