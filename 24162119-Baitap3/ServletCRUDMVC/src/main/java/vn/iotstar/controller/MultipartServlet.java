package vn.iotstar.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import vn.iotstar.util.Constant;

@WebServlet(name = "MultiPartServlet", urlPatterns = { "/multiPartServlet" })
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,
    maxFileSize = 1024 * 1024 * 5,
    maxRequestSize = 1024 * 1024 * 5 * 5
)
public class MultipartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/views/upload.jsp").forward(request, response);
    }

    private String getFileName(Part part) {
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf("=") + 2, content.length() - 1);
            }
        }
        return "default.file";
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String uploadPath = Constant.DIR;

        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        try {
            String fileName = "";
            for (Part part : request.getParts()) {
                String name = getFileName(part);
                if (!name.equals("default.file") && !name.isEmpty()) {
                    fileName = name;
                    part.write(uploadPath + File.separator + fileName);
                }
            }
            request.setAttribute("message", "File " + fileName + " upload thanh cong vao " + uploadPath);
        } catch (FileNotFoundException fne) {
            request.setAttribute("message", "Co loi xay ra: " + fne.getMessage());
        }

        request.getRequestDispatcher("/WEB-INF/views/result.jsp").forward(request, response);
    }
}