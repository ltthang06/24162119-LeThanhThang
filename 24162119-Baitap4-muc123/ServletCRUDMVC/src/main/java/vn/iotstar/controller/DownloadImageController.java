package vn.iotstar.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;

import vn.iotstar.util.Constant;

@WebServlet(urlPatterns = { "/image" })
public class DownloadImageController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String fileName = req.getParameter("fname");
        
        if (fileName != null && !fileName.trim().isEmpty()) {
            File file = new File(Constant.DIR + "/" + fileName);

            if (file.exists()) {
                resp.setContentType("image/jpeg");
                try (FileInputStream fileInputStream = new FileInputStream(file)) {
                    IOUtils.copy(fileInputStream, resp.getOutputStream());
                }
            }
        }
    }
}