package vn.iotstar.controller;

import java.io.IOException;
import java.util.Random;

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
import vn.iotstar.util.EmailUtils;

@WebServlet(urlPatterns = { "/forgot-password" })
public class ForgotPasswordController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/views/forgot-password.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        String email = req.getParameter("email");
        EntityManager em = JpaConfig.getEntityManager();
        EntityTransaction trans = em.getTransaction();

        try {
            String jpql = "SELECT u FROM User u WHERE u.email = :email";
            TypedQuery<User> query = em.createQuery(jpql, User.class);
            query.setParameter("email", email);
            var list = query.getResultList();

            if (!list.isEmpty()) {
                User user = list.get(0);

                Random rand = new Random();
                String otpvalue = String.valueOf(100000 + rand.nextInt(900000));

                trans.begin();
                user.setCode(otpvalue);
                user.setStatus(0); 
                em.merge(user);
                trans.commit();

                EmailUtils.sendEmail(email, "Mã OTP Khôi Phục Mật Khẩu", "Mã OTP của bạn là: " + otpvalue);

                HttpSession session = req.getSession();
                session.setAttribute("resetEmail", email);

                resp.sendRedirect(req.getContextPath() + "/verify-code");
                return;
            } else {
                req.setAttribute("message", "Email không tồn tại trong hệ thống!");
            }
        } catch (Exception e) {
            if (trans.isActive()) trans.rollback();
            e.printStackTrace();
            req.setAttribute("message", "Có lỗi xảy ra, vui lòng thử lại!");
        } finally {
            em.close();
        }

        req.getRequestDispatcher("/WEB-INF/views/forgot-password.jsp").forward(req, resp);
    }
}