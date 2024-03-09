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

@WebServlet(name = "UpdateCartController", urlPatterns = {"/Cart/UpdateCartQuantity"})
public class UpdateCartController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int productID = Integer.parseInt(req.getParameter("productID"));
            int quantity = Integer.parseInt(req.getParameter("quantity"));
            HttpSession session = req.getSession();
            CartDAOs cartDAOs = new CartDAOs();
            int userID = Integer.parseInt(session.getAttribute("userID").toString());
            cartDAOs.updateCart(userID, productID, quantity);
            resp.getWriter().write("success");
        } catch (Exception e) {
            Logger.getLogger(UpdateCartController.class.getName()).log(Level.SEVERE, null, e);
        }
    }
}
