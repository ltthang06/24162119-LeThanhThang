package vn.iotstar.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import vn.iotstar.model.User;
import vn.iotstar.service.UserService;
import vn.iotstar.service.impl.UserServiceImpl;
import vn.iotstar.util.EmailUtils;

@WebServlet(urlPatterns = { "/register" })
public class RegisterController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserService service = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/views/register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String email = req.getParameter("email");
        String fullname = req.getParameter("fullname");
        String phone = req.getParameter("phone");

        
        if (username == null || username.trim().isEmpty() ||
            password == null || password.trim().isEmpty() ||
            email == null || email.trim().isEmpty()) {
            
            req.setAttribute("alert", "Vui lòng nhập đầy đủ Tên tài khoản, Mật khẩu và Email!");
            req.getRequestDispatcher("/WEB-INF/views/register.jsp").forward(req, resp);
            return;
        }

        if (password.length() < 6) {
            req.setAttribute("alert", "Mật khẩu phải chứa ít nhất 6 ký tự!");
            req.getRequestDispatcher("/WEB-INF/views/register.jsp").forward(req, resp);
            return;
        }

        if (!email.matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
            req.setAttribute("alert", "Định dạng Email không hợp lệ!");
            req.getRequestDispatcher("/WEB-INF/views/register.jsp").forward(req, resp);
            return;
        }

        if (phone != null && !phone.trim().isEmpty() && !phone.matches("\\d{10}")) {
            req.setAttribute("alert", "Số điện thoại phải bao gồm đúng 10 chữ số!");
            req.getRequestDispatcher("/WEB-INF/views/register.jsp").forward(req, resp);
            return;
        }

        if (service.findByUsername(username) != null) {
            req.setAttribute("alert", "Tài khoản đã tồn tại!");
            req.getRequestDispatcher("/WEB-INF/views/register.jsp").forward(req, resp);
            return;
        }

        if (service.findByEmail(email) != null) {
            req.setAttribute("alert", "Email này đã được sử dụng cho tài khoản khác!");
            req.getRequestDispatcher("/WEB-INF/views/register.jsp").forward(req, resp);
            return;
        }

        if (phone != null && !phone.trim().isEmpty() && service.findByPhone(phone) != null) {
            req.setAttribute("alert", "Số điện thoại này đã được sử dụng cho tài khoản khác!");
            req.getRequestDispatcher("/WEB-INF/views/register.jsp").forward(req, resp);
            return;
        }

        String otp = String.valueOf((int) ((Math.random() * (999999 - 100000)) + 100000));

        User user = new User();
        user.setUserName(username);
        user.setPassWord(password);
        user.setEmail(email);
        user.setFullName(fullname);
        user.setPhone(phone);
        user.setRoleid(3);
        user.setCode(otp);
        user.setStatus(0);

        service.insert(user);

        EmailUtils.sendEmail(email, "Mã kích hoạt tài khoản", "Mã OTP kích hoạt của bạn là: <b>" + otp + "</b>");

        req.getSession().setAttribute("verifyEmail", email);

        resp.sendRedirect(req.getContextPath() + "/verify-code");
    }
}