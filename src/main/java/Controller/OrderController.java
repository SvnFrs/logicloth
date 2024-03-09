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

@WebServlet(name = "OrderController", urlPatterns = {"/Order"})
public class OrderController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if (session.getAttribute("userID") == null || session.getAttribute("userID").equals("") || session.getAttribute("userCookie") == null) {
            resp.sendRedirect(req.getContextPath() + "/Login");
        } else {
            int userID = (int) session.getAttribute("userID");
            OrderDAOs orderDAOs = new OrderDAOs();
            List<order> orders = orderDAOs.getAllByID(userID);
            session.setAttribute("Orders", orders);
            RequestDispatcher rd = req.getRequestDispatcher("order.jsp");
            rd.forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String fullName = req.getParameter("fullName");
        String phoneNumber = req.getParameter("phoneNumber");
        String address = req.getParameter("address");
        OrderDAOs orderDAOs = new OrderDAOs();
        ProductDAOs productDAOs = new ProductDAOs();
        CheckoutDAOs checkoutDAOs = new CheckoutDAOs();
        HttpSession session = req.getSession();

        boolean saveInfo = Boolean.parseBoolean(req.getParameter("saveInfo"));

//        int orderID = orderDAOs.generateOrderID();
        int orderDetailID = orderDAOs.generateOrderDetailID();
        int userID = (int) session.getAttribute("userID");

        List<checkout> checkoutItems = checkoutDAOs.getAllByID(userID);
        for (checkout checkout : checkoutItems) {
            int orderID = orderDAOs.generateOrderID();
            orderDAOs.insertOrder(orderID, userID, productDAOs.getRestaurantID(checkout.getProductID()));
            long totalPrice = productDAOs.getProductPrice(checkout.getProductID()) * checkout.getQuantity();
            orderDAOs.insertOrderDetail(orderDetailID, orderID, fullName, phoneNumber, checkout.getProductID(), checkout.getQuantity(), totalPrice, address);
        }
    }
}
