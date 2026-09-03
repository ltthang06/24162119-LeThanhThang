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
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import vn.iotstar.model.Category;
import vn.iotstar.model.User;
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
        HttpSession session = req.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("account") : null;
        if (user == null || user.getRoleid() != 1) {
            resp.sendRedirect(req.getContextPath() + "/waiting");
            return;
        }

        int id = Integer.parseInt(req.getParameter("id"));
        Category category = cateService.get(id);
        req.setAttribute("category", category);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/edit-category.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("account") : null;
        if (user == null || user.getRoleid() != 1) {
            resp.sendRedirect(req.getContextPath() + "/waiting");
            return;
        }

        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");

        Category category = new Category();
        category.setId(id);
        category.setName(name);

        Part filePart = req.getPart("icon");
        if (filePart != null) {
            String originalFileName = filePart.getSubmittedFileName();
            if (originalFileName != null && !originalFileName.trim().isEmpty() && filePart.getSize() > 0) {
                int index = originalFileName.lastIndexOf(".");
                String ext = (index != -1) ? originalFileName.substring(index + 1) : "jpg";
                String fileName = System.currentTimeMillis() + "." + ext;

                File uploadDir = new File(Constant.DIR + "/category");
                if (!uploadDir.exists()) {
                    uploadDir.mkdirs();
                }

                filePart.write(Constant.DIR + "/category/" + fileName);
                
                category.setIcon("category/" + fileName);
            } else {
                category.setIcon(null);
            }
        } else {
            category.setIcon(null);
        }

        cateService.edit(category);

        resp.sendRedirect(req.getContextPath() + "/admin/category/list");
    }
}