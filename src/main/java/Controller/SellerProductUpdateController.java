package Controller;

import java.io.IOException;

import DAOs.SellerProductDAOs;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet(name = "SellerProductUpdateController", urlPatterns = {"/Seller/Product/Update"})
public class SellerProductUpdateController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        int productID = Integer.parseInt(req.getParameter("productID"));
        String productName = req.getParameter("productName");
        String productDescription = req.getParameter("productDescription");
        long productPrice = Long.parseLong(req.getParameter("productPrice"));
        String productImage = req.getParameter("productImage");
        int productQuantity = Integer.parseInt(req.getParameter("productQuantity"));
        boolean status = Boolean.parseBoolean(req.getParameter("status"));
        int restaurantID = (int) session.getAttribute("RestaurantID");

        SellerProductDAOs sellerProductDAOs = new SellerProductDAOs();
        sellerProductDAOs.updateProduct(productName, productPrice, productQuantity, status, productDescription, productImage, productID);

        resp.getWriter().println("Product updated successfully");
    }
}
