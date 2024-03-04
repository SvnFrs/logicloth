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
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author admin
 */
@WebServlet(name = "ForgotController", urlPatterns = {"/Forgot"})
public class ForgotController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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

                    response.sendRedirect("confirm-email.jsp");
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
        final String username = "khanghuynhfdp@gmail.com";
        final String password = "uxnvcxivdalkyyef";
        String content = "Mã xác nhận của bạn là: ";

        // Thiết lập cấu hình cho máy chủ SMTP của Gmail
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        

        // Tạo một đối tượng Session để gửi email
        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        try {
            // Tạo đối tượng Message
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
            message.setSubject("D&C Food");
            message.setContent(content + verificationCode, "text/html; charset=UTF-8");

            // Gửi email
            Transport.send(message);
        } catch (MessagingException e) {
            // Xử lý ngoại lệ nếu gặp lỗi khi gửi email
            throw new RuntimeException(e);
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
