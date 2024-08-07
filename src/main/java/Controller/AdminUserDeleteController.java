package Controller;

import java.io.IOException;

import DAOs.AdminDAOs;
import DAOs.SellerProductDAOs;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet(name = "AdminUserDeleteController", urlPatterns = {"/Admin/User/Delete"})
public class AdminUserDeleteController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        AdminDAOs adminDAOs = new AdminDAOs();
        int userID = Integer.parseInt(req.getParameter("userID"));
        adminDAOs.deleteUser(userID);
        resp.sendRedirect(req.getContextPath() + "/Admin");
    }
}
