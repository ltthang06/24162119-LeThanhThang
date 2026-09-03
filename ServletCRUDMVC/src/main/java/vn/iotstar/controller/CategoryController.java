package vn.iotstar.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import vn.iotstar.model.Category;
import vn.iotstar.service.CategoryService;
import vn.iotstar.service.impl.CategoryServiceImpl;

@WebServlet(urlPatterns = {"/admin/category/list"})
public class CategoryController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    CategoryService cateService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        
        if (session == null || session.getAttribute("account") == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        List<Category> cateList = cateService.getAll();
        req.setAttribute("cateList", cateList);
        
        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/list-category.jsp");
        dispatcher.forward(req, resp);
    }
}