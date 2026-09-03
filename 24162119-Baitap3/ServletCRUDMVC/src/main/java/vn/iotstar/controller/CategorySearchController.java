package vn.iotstar.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import vn.iotstar.model.Category;
import vn.iotstar.service.CategoryService;
import vn.iotstar.service.impl.CategoryServiceImpl;

@WebServlet(urlPatterns = { "/admin/category/search" })
public class CategorySearchController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    CategoryService cateService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        String keyword = req.getParameter("keyword");
        if (keyword == null) {
            keyword = "";
        }

        List<Category> cateList = cateService.search(keyword);
        req.setAttribute("cateList", cateList);
        
        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/list-category.jsp");
        dispatcher.forward(req, resp);
    }
}