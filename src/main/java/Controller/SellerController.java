package Controller;

import DAOs.AccountDAOs;
import DAOs.AdminDAOs;
import Model.account;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

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
                if (!role.equals("seller")) {
                    response.sendRedirect(request.getContextPath() + "/User");
                } else {
                    RequestDispatcher rd = request.getRequestDispatcher("seller.jsp");
                    rd.forward(request, response);
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }
}
