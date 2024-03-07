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

@WebServlet(name = "HomepageController", urlPatterns = {"/"})
public class HomepageController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // if the user is not logged in, redirect to login page
        HttpSession session = request.getSession();
        AccountDAOs accountDAOs = new AccountDAOs();
        if (session.getAttribute("userID") == null) {
            response.sendRedirect(request.getContextPath() + "/Login");
        } else {
            try {
                int userID = (int) session.getAttribute("userID");
                String role  = accountDAOs.getRoleByID(userID);
                RequestDispatcher rd;
                if (role.equals("seller")) {
                    rd = request.getRequestDispatcher("seller.jsp");
                } else {
                    rd = request.getRequestDispatcher("user.jsp");
                }
                rd.forward(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(HomepageController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }
}
