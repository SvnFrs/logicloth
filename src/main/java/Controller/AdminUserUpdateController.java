package Controller;

import java.io.IOException;

import DAOs.AdminDAOs;
import DAOs.SellerProductDAOs;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet(name = "AdminUserUpdateController", urlPatterns = {"/Admin/User/Update"})
public class AdminUserUpdateController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        AdminDAOs adminDAOs = new AdminDAOs();
        int userID = Integer.parseInt(req.getParameter("userID"));
        String username = req.getParameter("userName");
//        String role = req.getParameter("role");
        String email = req.getParameter("userEmail");
        boolean status = Boolean.parseBoolean(req.getParameter("userStatus"));
        String fullName = req.getParameter("userFullName");

        adminDAOs.updateUser(userID, username, email, fullName, status);
    }
}
