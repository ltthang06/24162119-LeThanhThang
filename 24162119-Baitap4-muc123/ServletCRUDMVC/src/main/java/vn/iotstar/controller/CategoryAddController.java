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
@WebServlet(urlPatterns = { "/admin/category/add" })
public class CategoryAddController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private CategoryService cateService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/add-category.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        String name = req.getParameter("name");
        Part filePart = req.getPart("icon");

        Category category = new Category();
        category.setName(name);

        if (name == null || name.trim().isEmpty()) {
            req.setAttribute("alert", "Tên danh mục không được để trống!");
            req.setAttribute("category", category);
            req.getRequestDispatcher("/WEB-INF/views/add-category.jsp").forward(req, resp);
            return;
        }

        if (filePart == null || filePart.getSize() <= 0) {
            req.setAttribute("alert", "Vui lòng chọn ảnh đại diện cho danh mục!");
            req.setAttribute("category", category);
            req.getRequestDispatcher("/WEB-INF/views/add-category.jsp").forward(req, resp);
            return;
        }

        try {
            String originalFileName = filePart.getSubmittedFileName();
            int index = originalFileName.lastIndexOf(".");
            String ext = (index != -1) ? originalFileName.substring(index + 1) : "png";
            String fileName = System.currentTimeMillis() + "." + ext;
            
            File uploadDir = new File(Constant.DIR);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }
            
            filePart.write(Constant.DIR + File.separator + fileName);
            category.setName(name.trim());
            category.setIcon(fileName);

            cateService.insert(category);
            resp.sendRedirect(req.getContextPath() + "/admin/category/list");

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("alert", "Thêm danh mục thất bại: " + e.getMessage());
            req.setAttribute("category", category);
            req.getRequestDispatcher("/WEB-INF/views/add-category.jsp").forward(req, resp);
        }
    }
}