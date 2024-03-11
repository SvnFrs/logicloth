package Controller;

import DAOs.CheckoutDAOs;
import DAOs.OrderDAOs;
import DAOs.ProductDAOs;
import Model.order;
import Model.orderDetail;
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

@WebServlet(name = "OrderDetailController", urlPatterns = {"/OrderDetail"})
public class OrderDetailController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if (session.getAttribute("userID") == null || session.getAttribute("userID").equals("") || session.getAttribute("userCookie") == null) {
            resp.sendRedirect(req.getContextPath() + "/Login");
        } else {
            int orderID = Integer.parseInt(req.getParameter("orderID"));
            OrderDAOs orderDAOs = new OrderDAOs();
            List<orderDetail> orderDetails = orderDAOs.getOrderDetailByOrderID(orderID);
            session.setAttribute("OrderDetails", orderDetails);
            resp.getWriter().write("Get order detail success");
        }
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
