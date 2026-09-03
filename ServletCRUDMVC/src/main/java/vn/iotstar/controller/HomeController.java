package vn.iotstar.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import vn.iotstar.model.Product;
import vn.iotstar.model.User;
import vn.iotstar.service.ProductService;
import vn.iotstar.service.impl.ProductServiceImpl;

@WebServlet(urlPatterns = {"/home", "/user/home"})
public class HomeController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private ProductService productService = new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session != null) {
            User user = (User) session.getAttribute("account");
            if (user != null && user.getRoleid() == 1) {
                resp.sendRedirect(req.getContextPath() + "/waiting");
                return;
            }
        }

        List<Product> top10Products = productService.findTop10();
        req.setAttribute("top10Products", top10Products);
        req.getRequestDispatcher("/WEB-INF/views/user-home.jsp").forward(req, resp);
    }
}