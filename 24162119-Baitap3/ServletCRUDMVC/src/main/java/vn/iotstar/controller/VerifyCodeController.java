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

@WebServlet(urlPatterns = { "/verify-code" })
public class VerifyCodeController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/views/verify.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        String otpInput = req.getParameter("otp");
        if (otpInput != null) {
            otpInput = otpInput.trim();
        }

        if (otpInput == null || otpInput.isEmpty()) {
            req.setAttribute("alert", "Vui lòng nhập mã OTP!");
            req.getRequestDispatcher("/WEB-INF/views/verify.jsp").forward(req, resp);
            return;
        }

        EntityManager em = JpaConfig.getEntityManager();
        EntityTransaction trans = em.getTransaction();

        try {
            String jpql = "SELECT u FROM User u WHERE TRIM(u.code) = :code AND u.status = 0";
            TypedQuery<User> query = em.createQuery(jpql, User.class);
            query.setParameter("code", otpInput);

            var list = query.getResultList();

            if (!list.isEmpty()) {
                User user = list.get(0);
                trans.begin();
                user.setStatus(1);
                user.setCode(null);
                em.merge(user);
                trans.commit();

                HttpSession session = req.getSession();
                session.removeAttribute("verifyEmail");

                if (session.getAttribute("resetEmail") != null) {
                    resp.sendRedirect(req.getContextPath() + "/reset-password");
                } else {
                    resp.sendRedirect(req.getContextPath() + "/login");
                }
                return;
            }
        } catch (Exception e) {
            if (trans.isActive()) trans.rollback();
            e.printStackTrace();
        } finally {
            em.close();
        }

        req.setAttribute("alert", "Mã OTP không chính xác hoặc đã được sử dụng!");
        req.getRequestDispatcher("/WEB-INF/views/verify.jsp").forward(req, resp);
    }
}