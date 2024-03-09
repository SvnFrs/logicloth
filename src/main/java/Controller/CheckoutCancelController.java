package Controller;

import DAOs.CheckoutDAOs;
import Model.product;
import Model.checkout;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.BufferedReader;
import java.io.IOException;
import java.lang.reflect.Type;
import java.util.List;
import java.util.Map;

@WebServlet(name = "CheckoutCancelController", urlPatterns = {"/CheckoutCancel"})
public class CheckoutCancelController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            HttpSession session = req.getSession();
        if (session.getAttribute("userID") == null) {
            resp.sendRedirect(req.getContextPath() + "/Login");
        } else {
            int userID = (int) session.getAttribute("userID"); // Assuming the user ID is stored in the session
            CheckoutDAOs checkoutDAO = new CheckoutDAOs();
            checkoutDAO.deleteCheckoutByUserID(userID);
            session.setAttribute("CheckoutItems", null);
        }


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
