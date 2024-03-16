package Controller;

import DAOs.*;
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


@WebServlet(name = "SearchController", urlPatterns = {"/Search"})
public class SearchController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getRequestURI();
        try {
            String search = req.getParameter("search");
            ProductDAOs productDAOs = new ProductDAOs();
            SearchDAOs searchDAOs = new SearchDAOs();
            List<product> products = searchDAOs.searchProduct(search);
            req.setAttribute("Products", products);
            req.setAttribute("contextPath", req.getServletContext().getContextPath());
            RequestDispatcher rd = req.getRequestDispatcher("search-result.jsp");
            rd.forward(req, resp);
        } catch (Exception e) {
            Logger.getLogger(SearchController.class.getName()).log(Level.SEVERE, null, e);
        }
    }
}
