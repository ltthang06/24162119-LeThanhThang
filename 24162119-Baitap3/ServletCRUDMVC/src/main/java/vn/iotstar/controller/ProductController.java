package vn.iotstar.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import vn.iotstar.model.Category;
import vn.iotstar.model.Product;
import vn.iotstar.service.CategoryService;
import vn.iotstar.service.ProductService;
import vn.iotstar.service.impl.CategoryServiceImpl;
import vn.iotstar.service.impl.ProductServiceImpl;

@WebServlet(urlPatterns = { "/admin/products", "/admin/product/add", "/admin/product/edit", "/admin/product/delete" })
public class ProductController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private ProductService productService = new ProductServiceImpl();
    private CategoryService categoryService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url = req.getRequestURI();

        if (url.contains("add")) {
            List<Category> categories = categoryService.getAll();
            req.setAttribute("categories", categories);
            req.getRequestDispatcher("/WEB-INF/views/admin/product-add.jsp").forward(req, resp);
        } else if (url.contains("edit")) {
            int id = Integer.parseInt(req.getParameter("id"));
            Product product = productService.findById(id);
            List<Category> categories = categoryService.getAll();
            
            req.setAttribute("product", product);
            req.setAttribute("categories", categories);
            req.getRequestDispatcher("/WEB-INF/views/admin/product-edit.jsp").forward(req, resp);
        } else if (url.contains("delete")) {
            int id = Integer.parseInt(req.getParameter("id"));
            productService.delete(id);
            resp.sendRedirect(req.getContextPath() + "/admin/products");
        } else {
            List<Product> list = productService.findAll();
            req.setAttribute("productList", list);
            req.getRequestDispatcher("/WEB-INF/views/admin/product-list.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        String url = req.getRequestURI();

        String name = req.getParameter("productName");
        double price = Double.parseDouble(req.getParameter("price"));
        String description = req.getParameter("description");
        String images = req.getParameter("images");
        
        int categoryId = 0;
        try {
            categoryId = Integer.parseInt(req.getParameter("categoryId"));
        } catch (NumberFormatException e) {
            categoryId = 1; 
        }

        Category category = categoryService.get(categoryId);

        if (url.contains("add")) {
            Product product = new Product();
            product.setProductName(name);
            product.setPrice(price);
            product.setDescription(description);
            product.setImages(images);
            product.setCategory(category);

            productService.insert(product);
        } else if (url.contains("edit")) {
            int id = Integer.parseInt(req.getParameter("productId"));
            Product product = productService.findById(id);
            if (product != null) {
                product.setProductName(name);
                product.setPrice(price);
                product.setDescription(description);
                product.setImages(images);
                product.setCategory(category);

                productService.update(product);
            }
        }

        resp.sendRedirect(req.getContextPath() + "/admin/products");
    }
}