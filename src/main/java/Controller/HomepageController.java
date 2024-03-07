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
        if (session.getAttribute("userID") == null) {
//            response.sendRedirect(request.getContextPath() + "/login-register.jsp");
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);
        } else {
//            RequestDispatcher rd = request.getRequestDispatcher("user.jsp");
//            rd.forward(request, response);
        }
    }
}
