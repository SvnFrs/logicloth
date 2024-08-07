package Controller;

import DAOs.*;
import Model.account;
import Model.cart;
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

@WebServlet(name = "CartController", urlPatterns = {"/Cart"})
public class CartController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if (session.getAttribute("userID") == null) {
            resp.sendRedirect(req.getContextPath() + "/Login");
        } else {
            int userID = (int) session.getAttribute("userID"); // Assuming the user ID is stored in the session
            CartDAOs cartDAOs = new CartDAOs();
            List<cart> cartItems = cartDAOs.getAllByID(userID);
            session.setAttribute("CartItems", cartItems);// Assuming the user ID is stored in the session
            CheckoutDAOs checkoutDAO = new CheckoutDAOs();
            checkoutDAO.deleteCheckoutByUserID(userID);
            session.setAttribute("CheckoutItems", null);
            RequestDispatcher rd = req.getRequestDispatcher("cart.jsp");
            rd.forward(req, resp);
        }
    }


    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPut(req, resp);
    }
}
