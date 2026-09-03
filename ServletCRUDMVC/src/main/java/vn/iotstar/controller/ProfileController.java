package vn.iotstar.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import vn.iotstar.model.User;
import vn.iotstar.service.UserService;
import vn.iotstar.service.impl.UserServiceImpl;

@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2,
    maxFileSize = 1024 * 1024 * 10,
    maxRequestSize = 1024 * 1024 * 50
)
@WebServlet(urlPatterns = { "/user/profile" })
public class ProfileController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private UserService userService = new UserServiceImpl();
    public static final String UPLOAD_DIR = "uploads";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        HttpSession session = req.getSession();
        User account = (User) session.getAttribute("account");

        if (account == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        User user = userService.findById(account.getId());
        req.setAttribute("user", user);
        req.getRequestDispatcher("/WEB-INF/views/profile.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        HttpSession session = req.getSession();
        User account = (User) session.getAttribute("account");

        if (account == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        try {
            String fullname = req.getParameter("fullname");
            String phone = req.getParameter("phone");

            User user = userService.findById(account.getId());
            user.setFullName(fullname);
            user.setPhone(phone);

            Part part = req.getPart("avatar");
            if (part != null && part.getSize() > 0) {
                String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();

                String ext = fileName.substring(fileName.lastIndexOf("."));
                String fname = System.currentTimeMillis() + ext;

                String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdir();
                }

                part.write(uploadPath + File.separator + fname);
                user.setAvatar(fname);
            }

            userService.update(user);


            session.setAttribute("account", user);
            req.setAttribute("message", "Cập nhật profile thành công!");
            req.setAttribute("user", user);

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "Cập nhật thất bại: " + e.getMessage());
        }

        req.getRequestDispatcher("/WEB-INF/views/profile.jsp").forward(req, resp);
    }
}