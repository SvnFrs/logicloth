/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author admin
 */
@WebServlet(name = "ConfirmController", urlPatterns = {"/Confirm"})
public class ConfirmController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher("confirm-email.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String code = request.getParameter("code");
        HttpSession session = request.getSession();
        String storedCode = (String) session.getAttribute("verificationCode");
        boolean isValid = true;

        if (code.isEmpty()) {
            isValid = false;
            request.setAttribute("confirmError", "Bạn cần điền vào trường này!");
        } else if (code.length() != 8) {
            isValid = false;
            request.setAttribute("confirmError", "Mã xác nhận có độ dài là 8!");
        } else if (!code.equals(storedCode)) {
            isValid = false;
            request.setAttribute("confirmError", "Mã xác nhận bạn nhập không đúng!");
        } else {
            request.setAttribute("confirmError", "");
        }

        if (isValid) {
            session.removeAttribute("verificationCode");
            response.sendRedirect(request.getContextPath() + "/Reset");
        } else {
            RequestDispatcher rd = request.getRequestDispatcher("confirm-email.jsp");
            rd.forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
