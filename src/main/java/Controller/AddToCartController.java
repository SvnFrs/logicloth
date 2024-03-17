package Controller;

import DAOs.*;
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

@WebServlet(name = "AddToCartController", urlPatterns = {"/AddToCart"})
public class AddToCartController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if (session.getAttribute("userID") == null || session.getAttribute("userID").equals("") || session.getAttribute("userCookie") == null) {
            resp.sendRedirect(req.getContextPath() + "/Login");
        } else {
            CartDAOs cartDAOs = new CartDAOs();
            boolean isInCart = cartDAOs.isProductInCart((int) session.getAttribute("userID"), Integer.parseInt(req.getParameter("productID")));
            int productID = Integer.parseInt(req.getParameter("productID"));
            int userID = (int) session.getAttribute("userID");
            int quantity = Integer.parseInt(req.getParameter("quantity"));
            if (isInCart) {
                cartDAOs.addQuantity(userID, productID);
            } else {
                cartDAOs.addToCart(userID, productID, quantity);
            }
            // Redirect to restaurant page
            resp.sendRedirect(req.getContextPath() + "/Restaurant?restaurantID=" + req.getParameter("restaurantID"));
//        RequestDispatcher dispatcher = req.getRequestDispatcher("/User");
//        dispatcher.forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
