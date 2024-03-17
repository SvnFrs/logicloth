package Controller;

import java.io.IOException;

import DAOs.AdminDAOs;
import DAOs.SellerProductDAOs;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet(name = "AdminUserAddController", urlPatterns = {"/Admin/User/Add"})
public class AdminUserAddController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        AdminDAOs adminDAOs = new AdminDAOs();
//        int userID = adminDAOs.generateUserID();
        String username = req.getParameter("userName");
        String role = req.getParameter("role");
        String email = req.getParameter("userEmail");
        String fullName = req.getParameter("userFullName");

        adminDAOs.addUsers(username, email, fullName, role);
    }
}
