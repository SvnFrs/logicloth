package Controller;

import DAOs.*;
import Model.order;
import Model.orderDetail;
import Model.product;
import Model.sale;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "SellerController", urlPatterns = {"/Seller"})
public class SellerController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        // if the user is not logged in, redirect to login page
        if (session.getAttribute("userID") == null) {
            response.sendRedirect(request.getContextPath() + "/Login");
        } else {
            try {
                AccountDAOs accountDAOs = new AccountDAOs();
                int userID = (int) session.getAttribute("userID");
                String role  = accountDAOs.getRoleByID(userID);
                String username;
                try {
                    username = accountDAOs.getNameByID((int) session.getAttribute("userID"));
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                if (!role.equals("seller")) {
                    response.sendRedirect(request.getContextPath() + "/User");
                } else {
                    session.setAttribute("username", username);
                    SellerOrderDAOs sellerOrderDAOs = new SellerOrderDAOs();
                    SellerProductDAOs sellerProductDAOs = new SellerProductDAOs();
                    SaleDAOs saleDAOs = new SaleDAOs();
                    int restaurantID = sellerOrderDAOs.getRestaurantID(userID);
                    List<sale> saleIDs = saleDAOs.getAllSaleIDByRestaurantID(restaurantID);
                    List<sale> sales = saleDAOs.getAllSaleBySaleIDs(saleIDs);
                    List<order> orderIDs = sellerOrderDAOs.getAllOrderIDByRestaurantID(restaurantID);
                    List<order> orders = sellerOrderDAOs.getAllByOrderIDs(orderIDs);
                    List<orderDetail> orderDetails = sellerOrderDAOs.getOrderDetailsByOrderID(orderIDs);

                    List<product> products = sellerProductDAOs.getAllByRestaurantID(restaurantID);
                    session.setAttribute("RestaurantID", restaurantID);
                    session.setAttribute("Orders", orders);
                    session.setAttribute("OrderDetails", orderDetails);
                    session.setAttribute("Products", products);
                    session.setAttribute("Sales", sales);
                    RequestDispatcher rd = request.getRequestDispatcher("seller.jsp");
                    rd.forward(request, response);
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }
}
