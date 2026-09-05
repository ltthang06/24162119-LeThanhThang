package vn.iotstar.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import vn.iotstar.model.Product;
import vn.iotstar.service.ProductService;
import vn.iotstar.service.impl.ProductServiceImpl;

@WebServlet(urlPatterns = { "/product", "/product/detail" })
public class ProductListController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProductService productService = new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uri = req.getRequestURI();

        if (uri.contains("detail")) {
            int id = Integer.parseInt(req.getParameter("id"));
            Product product = productService.findById(id);
            req.setAttribute("product", product);
            req.getRequestDispatcher("/WEB-INF/views/product-detail.jsp").forward(req, resp);
        } else {
            int page = 1;
            int pageSize = 6;
            if (req.getParameter("page") != null) {
                page = Integer.parseInt(req.getParameter("page"));
            }

            List<Product> list = productService.findAll(page, pageSize);
            int totalProducts = productService.count();
            int maxPage = (int) Math.ceil((double) totalProducts / pageSize);

            req.setAttribute("productList", list);
            req.setAttribute("currentPage", page);
            req.setAttribute("maxPage", maxPage);
            
            req.getRequestDispatcher("/WEB-INF/views/product-user-list.jsp").forward(req, resp);
        }
    }
}