package vn.iotstar.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import vn.iotstar.model.User;
import vn.iotstar.service.UserService;
import vn.iotstar.service.impl.UserServiceImpl;
import vn.iotstar.util.Constant;

@SuppressWarnings("serial")
@WebServlet(urlPatterns = { "/login" })
public class LoginController extends HttpServlet {

    private UserService service = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        if (session != null && session.getAttribute("account") != null) {
            resp.sendRedirect(req.getContextPath() + "/waiting");
            return;
        }

        Cookie[] cookies = req.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals(Constant.COOKIE_REMEMBER)) {
                    session = req.getSession(true);
                    User user = service.findByUsername(cookie.getValue());
                    if (user != null) {
                        session.setAttribute("account", user);
                        resp.sendRedirect(req.getContextPath() + "/waiting");
                        return;
                    }
                }
            }
        }
        req.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");

        String username = req.getParameter("username") != null ? req.getParameter("username").trim() : "";
        String password = req.getParameter("password") != null ? req.getParameter("password").trim() : "";
        String alertMsg = "";

        if (username.isEmpty() || password.isEmpty()) {
            alertMsg = "Tài khoản hoặc mật khẩu không được rỗng";
            req.setAttribute("alert", alertMsg);
            req.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(req, resp);
            return;
        }

        User user = service.login(username, password);

        boolean isRememberMe = false;
        String remember = req.getParameter("remember");
        if ("on".equals(remember)) {
            isRememberMe = true;
        }

        if (user != null) {
            HttpSession session = req.getSession(true);
            session.setAttribute("account", user);

            if (isRememberMe) {
                saveRemeberMe(resp, username, req);
            }
            resp.sendRedirect(req.getContextPath() + "/waiting");
        } else {
            alertMsg = "Tài khoản hoặc mật khẩu không đúng";
            req.setAttribute("alert", alertMsg);
            req.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(req, resp);
        }
    }

    private void saveRemeberMe(HttpServletResponse response, String username, HttpServletRequest request) {
        Cookie cookie = new Cookie(Constant.COOKIE_REMEMBER, username);
        cookie.setMaxAge(30 * 60);
        cookie.setPath(request.getContextPath());
        response.addCookie(cookie);
    }
}