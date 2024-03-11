package Controller;

import java.io.IOException;

import DAOs.SellerOrderDAOs;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
@WebServlet(name = "SellerOrderStatusController", urlPatterns = {"/Seller/Order/Status"})
public class SellerOrderStatusController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        int orderID = Integer.parseInt(req.getParameter("orderID"));
        int statusID = Integer.parseInt(req.getParameter("statusID"));
        SellerOrderDAOs sellerOrderDAOs = new SellerOrderDAOs();
        sellerOrderDAOs.updateOrderStatus(orderID, statusID);
    }
}
