package Controller;

import java.io.IOException;

import DAOs.SellerProductDAOs;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet(name = "SellerProductDeleteController", urlPatterns = {"/Seller/Product/Delete"})
public class SellerProductDeleteController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        SellerProductDAOs sellerProductDAOs = new SellerProductDAOs();
        int productID = Integer.parseInt(req.getParameter("productID"));
        sellerProductDAOs.deleteProduct(productID);
        resp.sendRedirect(req.getContextPath() + "/Seller");
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        SellerProductDAOs sellerProductDAOs = new SellerProductDAOs();
        int productID = Integer.parseInt(req.getParameter("productID"));
        sellerProductDAOs.deleteProduct(productID);
        resp.getWriter().println("Product updated successfully");
    }
}
