package Controller;

import DAOs.*;
import Model.order;
import Model.orderStatus;
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
import java.sql.Date;
import java.util.Map;

@WebServlet(name = "OrderStatusController", urlPatterns = {"/OrderStatus"})
public class OrderStatusController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String action = req.getParameter("action");
        int orderID = Integer.parseInt(req.getParameter("orderID"));
        int restaurantID = Integer.parseInt(req.getParameter("restaurantID"));
        OrderDAOs orderDAOs = new OrderDAOs();
        CartDAOs cartDAOs = new CartDAOs();
        SaleDAOs saleDAOs = new SaleDAOs();
        RecordDAOs recordDAOs = new RecordDAOs();
        ExpenseDAOs expenseDAOs = new ExpenseDAOs();
        RestaurantDAOs restaurantDAOs = new RestaurantDAOs();
        int saleID = saleDAOs.generateSaleID();
        if (action.equals("cancel")) {
            orderDAOs.updateOrderStatus(orderID, 6, restaurantID);
            resp.getWriter().write("Order cancelled");
        } else if (action.equals("received")) {
            orderDAOs.updateOrderStatus(orderID, 4, restaurantID);
            List<orderDetail> orderDetails = orderDAOs.getOrderDetailByOrderIDAndRestaurantID(orderID, restaurantID);
            for (orderDetail orderDetail : orderDetails) {
                // remove product from cart
                cartDAOs.removeCartItemWhichReceived(orderDAOs.getUserIDByOrderID(orderDetail.getOrderID()), orderDetail.getProductID());
                restaurantDAOs.updateProductQuantity(orderDetail.getRestaurantID(), orderDetail.getProductID(), orderDetail.getQuantity());
                recordDAOs.insertRecord(orderDetail.getRestaurantID(), saleID);
                saleDAOs.insertSale(saleID, orderDetail.getProductID(), orderDetail.getQuantity(),
                        orderDetail.getTotalPrice(), Date.valueOf(orderDAOs.getOrderDateByOrderID(orderID)));
            }
            try {
                long amount = orderDAOs.getTotalPriceByOrderIDAndRestaurantID(orderID, restaurantID);
//                int restaurantID = orderDAOs.getRestaurantIDByOrderID(orderID);
                expenseDAOs.updateRestaurantExpense(restaurantID, amount);
            } catch (Exception e) {
                expenseDAOs.addAllRestaurantID();
                long amount = orderDAOs.getTotalPriceByOrderIDAndRestaurantID(orderID, restaurantID);
//                int restaurantID = orderDAOs.getRestaurantIDByOrderID(orderID);
                expenseDAOs.updateRestaurantExpense(restaurantID, amount);
            }

            resp.getWriter().write("Order received");
        }
    }
}
