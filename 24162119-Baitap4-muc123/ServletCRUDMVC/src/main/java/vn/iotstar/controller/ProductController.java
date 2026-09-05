package vn.iotstar.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import vn.iotstar.model.Category;
import vn.iotstar.model.Product;
import vn.iotstar.service.CategoryService;
import vn.iotstar.service.ProductService;
import vn.iotstar.service.impl.CategoryServiceImpl;
import vn.iotstar.service.impl.ProductServiceImpl;
import vn.iotstar.util.Constant;

@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2,
    maxFileSize = 1024 * 1024 * 10,
    maxRequestSize = 1024 * 1024 * 50
)
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
        String priceStr = req.getParameter("price");
        String description = req.getParameter("description");
        String categoryIdStr = req.getParameter("categoryId");

        double price = 0;
        int categoryId = 0;

        String errorMsg = null;
        if (name == null || name.trim().isEmpty()) {
            errorMsg = "Ten san pham khong duoc de trong!";
        } else {
            try {
                price = Double.parseDouble(priceStr);
                if (price <= 0) {
                    errorMsg = "Gia ban phai lon hon 0!";
                }
            } catch (Exception e) {
                errorMsg = "Gia ban khong hop le!";
            }
        }

        if (errorMsg == null) {
            try {
                categoryId = Integer.parseInt(categoryIdStr);
            } catch (Exception e) {
                errorMsg = "Vui long chon danh muc hop le!";
            }
        }

        Part filePart = req.getPart("images");
        boolean isAdd = url.contains("add");

        if (errorMsg == null && isAdd && (filePart == null || filePart.getSize() <= 0)) {
            errorMsg = "Vui long chon file anh dai dien cho san pham!";
        }

        List<Category> categories = categoryService.getAll();
        Category category = (categoryId > 0) ? categoryService.get(categoryId) : null;

        if (errorMsg != null) {
            req.setAttribute("error", errorMsg);
            req.setAttribute("categories", categories);
            
            if (isAdd) {
                Product tempProduct = new Product();
                tempProduct.setProductName(name);
                tempProduct.setPrice(price);
                tempProduct.setDescription(description);
                tempProduct.setCategory(category);
                req.setAttribute("product", tempProduct);
                req.getRequestDispatcher("/WEB-INF/views/admin/product-add.jsp").forward(req, resp);
            } else {
                int id = Integer.parseInt(req.getParameter("productId"));
                Product tempProduct = productService.findById(id);
                if (tempProduct != null) {
                    tempProduct.setProductName(name);
                    tempProduct.setPrice(price);
                    tempProduct.setDescription(description);
                    tempProduct.setCategory(category);
                }
                req.setAttribute("product", tempProduct);
                req.getRequestDispatcher("/WEB-INF/views/admin/product-edit.jsp").forward(req, resp);
            }
            return;
        }

        String fileName = null;
        if (filePart != null && filePart.getSize() > 0) {
            String originalFileName = filePart.getSubmittedFileName();
            if (originalFileName != null && !originalFileName.trim().isEmpty()) {
                int index = originalFileName.lastIndexOf(".");
                String ext = (index != -1) ? originalFileName.substring(index) : ".jpg";
                fileName = System.currentTimeMillis() + ext;

                File uploadDir = new File(Constant.DIR);
                if (!uploadDir.exists()) {
                    uploadDir.mkdirs();
                }
                filePart.write(Constant.DIR + File.separator + fileName);
            }
        }

        if (isAdd) {
            Product product = new Product();
            product.setProductName(name.trim());
            product.setPrice(price);
            product.setDescription(description);
            product.setImages(fileName);
            product.setCategory(category);

            productService.insert(product);
        } else if (url.contains("edit")) {
            int id = Integer.parseInt(req.getParameter("productId"));
            Product product = productService.findById(id);
            if (product != null) {
                product.setProductName(name.trim());
                product.setPrice(price);
                product.setDescription(description);
                if (fileName != null) {
                    product.setImages(fileName);
                }
                product.setCategory(category);

                productService.update(product);
            }
        }

        resp.sendRedirect(req.getContextPath() + "/admin/products");
    }
}