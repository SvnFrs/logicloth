package Controller;

import DAOs.CheckoutDAOs;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import Model.product;
import Model.checkout;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.BufferedReader;
import java.io.IOException;
import java.lang.reflect.Type;
import java.util.List;
import java.util.Map;

@WebServlet(name = "CheckoutController", urlPatterns = {"/Checkout"})
public class CheckoutController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if (session.getAttribute("userID") == null) {
            resp.sendRedirect(req.getContextPath() + "/Login");
        } else {
            int userID = (int) session.getAttribute("userID"); // Assuming the user ID is stored in the session
            CheckoutDAOs checkoutDAO = new CheckoutDAOs();
            List<checkout> checkoutItems = checkoutDAO.getAllByID(userID);
            session.setAttribute("CheckoutItems", checkoutItems);
            RequestDispatcher rd = req.getRequestDispatcher("checkout.jsp");
            rd.forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Read the request body
        StringBuilder sb = new StringBuilder();
        BufferedReader reader = req.getReader();
        String line;
        while ((line = reader.readLine()) != null) {
            sb.append(line);
        }
        String jsonString = sb.toString();

        // Parse the JSON string into an array of Product objects
        Gson gson = new Gson();
        Type listType = new TypeToken<List<product>>() {}.getType();
        List<product> products = gson.fromJson(jsonString, listType);
        CheckoutDAOs checkoutDAO = new CheckoutDAOs();
        HttpSession session = req.getSession();
        int userID = (int) session.getAttribute("userID");

        // Iterate over the array of products and insert each one into the 'Checkout' table
        for (product Product : products) {
            int productID = Product.getProductID();
            int quantity = Product.getProductQuantity();
            // Get the user's id and the restaurant's id
            // Insert the product into the 'Checkout' table
            checkoutDAO.insertCheckout(userID, productID, quantity);
        }

        // Send a response back to the client
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write("{\"message\":\"Checkout successful\"}");
    }
}
