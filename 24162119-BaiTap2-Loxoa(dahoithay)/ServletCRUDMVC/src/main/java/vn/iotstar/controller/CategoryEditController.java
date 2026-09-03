package vn.iotstar.controller;

import java.io.File;
import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import vn.iotstar.model.Category;
import vn.iotstar.service.CategoryService;
import vn.iotstar.service.impl.CategoryServiceImpl;
import vn.iotstar.util.Constant;

@MultipartConfig
@WebServlet(urlPatterns = { "/admin/category/edit" })
public class CategoryEditController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    CategoryService cateService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Category category = cateService.get(id);
        req.setAttribute("category", category);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/edit-category.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        Category category = new Category();
        category.setId(Integer.parseInt(req.getParameter("id")));
        category.setName(req.getParameter("name"));

        Part filePart = req.getPart("icon");
        if (filePart != null && filePart.getSize() > 0) {
            String originalFileName = filePart.getSubmittedFileName();
            int index = originalFileName.lastIndexOf(".");
            String ext = originalFileName.substring(index + 1);
            String fileName = System.currentTimeMillis() + "." + ext;

            File uploadDir = new File(Constant.DIR + "/category");
            if (!uploadDir.exists()) uploadDir.mkdirs();

            filePart.write(Constant.DIR + "/category/" + fileName);
            category.setIcon("category/" + fileName);
        }

        cateService.edit(category);
        resp.sendRedirect(req.getContextPath() + "/admin/category/list");
    }
}