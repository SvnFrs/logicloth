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

@WebServlet(name = "AddToCartController", urlPatterns = {"/AddToCart"})
public class AddToCartController extends HttpServlet {
}
