/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAOs.AccountDAOs;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.security.SecureRandom;
import java.sql.SQLException;
import java.util.Base64;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.mail.*;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import jakarta.mail.Authenticator;

/**
 *
 * @author admin
 */
@WebServlet(name = "ForgotController", urlPatterns = {"/Forgot"})
public class ForgotController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher("forgot.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("forgot-email");
        String emailRegex = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
        AccountDAOs dao = new AccountDAOs();
        boolean isValid;

        //Validate email
        if (email.isEmpty()) {
            isValid = false;
            request.setAttribute("forgotError", "Bạn cần điền vào trường này!");
        } else if (!email.matches(emailRegex)) {
            isValid = false;
            request.setAttribute("forgotError", "Email bạn nhập không đúng!");
        } else {
            isValid = true;
            request.setAttribute("forgotError", "");
        }

        //Kiểm tra isValid
        if (isValid) {
            try {
                boolean exits = dao.emailExits(email);
                //Kiểm tra email có tồn tại trong database chưa
                if (exits) {
                    // Tạo mã xác nhận
                    String verificationCode = generateVerificationCode();

                    // Lưu mã xác nhận vào session
                    HttpSession session = request.getSession();
                    session.setAttribute("verificationCode", verificationCode);
                    session.setAttribute("email", email);

                    // Gửi email chứa mã xác nhận
                    sendEmail(email, verificationCode);

                    response.sendRedirect(
                            request.getContextPath() + "/Confirm");
                } else {
                    request.setAttribute("forgotError", "Email của bạn không trùng với tài khoản nào cả!");
                    RequestDispatcher rd = request.getRequestDispatcher("forgot.jsp");
                    rd.forward(request, response);
                }
            } catch (SQLException ex) {
                Logger.getLogger(ForgotController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            RequestDispatcher rd = request.getRequestDispatcher("forgot.jsp");
            rd.forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

    private void sendEmail(String email, String verificationCode) {
        String host = "smtp.gmail.com";
        String username = "khanghuynhfdp@gmail.com";
        String password = "uxnvcxivdalkyyef";
        String content = "Mã xác nhận của bạn là: ";

        Properties props = new Properties();
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.ssl.trust", host);
//        props.put("mail.smtp.socketFactory.port", "25");
        props.put("mail.smtp.port", "587");
//        props.put("mail.smtp.ssl.protocols", "TLSv1.2");
//        props.put("mail.smtp.socketFactory.fallback", "false");

        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
            message.setSubject("D&C Food");
            message.setText(content + verificationCode);

            Transport.send(message);
            System.out.println("Verification code email sent successfully.");
        } catch (MessagingException e) {
            e.printStackTrace();
            System.err.println("Error sending verification code email: " + e.getMessage());
        }
    }

    public String generateVerificationCode() {

        // Tạo mã xác nhận ngẫu nhiên, có thể là một chuỗi ngẫu nhiên, ví dụ:
        SecureRandom random = new SecureRandom();

        // Độ dài của mã xác nhận
        byte[] codeBytes = new byte[6];
        random.nextBytes(codeBytes);
        String verificationCode = Base64.getEncoder().encodeToString(codeBytes);
        return verificationCode;
    }
}
