package Controller;

import DAOs.AccountDAOs;
import DAOs.AdminDAOs;
import DAOs.ProductDAOs;
import DAOs.RestaurantDAOs;
import Model.account;
import Model.product;
import Model.restaurant;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "ProductController", urlPatterns = {"/Product"})
public class ProductController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getRequestURI();
        try {
            int productID = Integer.parseInt(req.getParameter("productID"));
            ProductDAOs productDAOs = new ProductDAOs();
            product singleProduct = productDAOs.getProductByID(productID);
            req.setAttribute("Product", singleProduct);
            req.setAttribute("contextPath", req.getServletContext().getContextPath());
            RequestDispatcher rd = req.getRequestDispatcher("product.jsp");
            rd.forward(req, resp);
        } catch (Exception e) {
            Logger.getLogger(ProductController.class.getName()).log(Level.SEVERE, null, e);
        }
    }
}
