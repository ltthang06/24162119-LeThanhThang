package vn.iotstar.controller;

import java.io.IOException;
import java.util.List;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.TypedQuery;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import vn.iotstar.configs.JpaConfig;
import vn.iotstar.model.User;

@WebServlet(urlPatterns = { "/reset-password" })
public class ResetPasswordController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("resetEmail") == null) {
            resp.sendRedirect(req.getContextPath() + "/forgot-password");
            return;
        }
        req.getRequestDispatcher("/WEB-INF/views/reset-password.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        
        String newPassword = req.getParameter("password");

        if (newPassword == null || newPassword.trim().isEmpty() || newPassword.trim().length() < 6) {
            req.setAttribute("alert", "Mật khẩu mới không được để trống và phải có ít nhất 6 ký tự!");
            req.getRequestDispatcher("/WEB-INF/views/reset-password.jsp").forward(req, resp);
            return;
        }

        HttpSession session = req.getSession(false);
        String email = (session != null) ? (String) session.getAttribute("resetEmail") : null;

        if (email == null || email.trim().isEmpty()) {
            resp.sendRedirect(req.getContextPath() + "/forgot-password");
            return;
        }

        EntityManager em = JpaConfig.getEntityManager();
        EntityTransaction trans = em.getTransaction();

        try {
            String jpql = "SELECT u FROM User u WHERE u.email = :email";
            TypedQuery<User> query = em.createQuery(jpql, User.class);
            query.setParameter("email", email.trim());
            
            List<User> list = query.getResultList();

            if (!list.isEmpty()) {
                User user = list.get(0);

                trans.begin();
                user.setPassWord(newPassword.trim());
                em.merge(user);
                trans.commit();

                session.removeAttribute("resetEmail");
                req.setAttribute("alert", "Đổi mật khẩu thành công! Vui lòng đăng nhập lại.");
                req.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(req, resp);
                return;
            } else {
                req.setAttribute("alert", "Không tìm thấy tài khoản cần đổi mật khẩu!");
            }
        } catch (Exception e) {
            if (trans.isActive()) trans.rollback();
            e.printStackTrace();
            req.setAttribute("alert", "Có lỗi xảy ra trong quá trình lưu, vui lòng thử lại!");
        } finally {
            em.close();
        }

        req.getRequestDispatcher("/WEB-INF/views/reset-password.jsp").forward(req, resp);
    }
}