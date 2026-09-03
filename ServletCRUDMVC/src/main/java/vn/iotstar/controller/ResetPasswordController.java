package vn.iotstar.controller;

import java.io.IOException;
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
        req.getRequestDispatcher("/WEB-INF/views/reset-password.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        
        String newPassword = req.getParameter("password");
        HttpSession session = req.getSession();
        String email = (String) session.getAttribute("resetEmail");

        if (email == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        EntityManager em = JpaConfig.getEntityManager();
        EntityTransaction trans = em.getTransaction();

        try {
            String jpql = "SELECT u FROM User u WHERE u.email = :email";
            TypedQuery<User> query = em.createQuery(jpql, User.class);
            query.setParameter("email", email);
            User user = query.getSingleResult();

            trans.begin();
            user.setPassWord(newPassword);
            em.merge(user);
            trans.commit();

            session.removeAttribute("resetEmail");
            req.setAttribute("alert", "Đổi mật khẩu thành công! Vui lòng đăng nhập lại.");
            req.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(req, resp);
            return;
        } catch (Exception e) {
            if (trans.isActive()) trans.rollback();
            e.printStackTrace();
        } finally {
            em.close();
        }

        req.setAttribute("alert", "Có lỗi xảy ra, vui lòng thử lại!");
        req.getRequestDispatcher("/WEB-INF/views/reset-password.jsp").forward(req, resp);
    }
}