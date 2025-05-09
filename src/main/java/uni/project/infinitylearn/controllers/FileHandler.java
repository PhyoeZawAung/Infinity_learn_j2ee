package uni.project.infinitylearn.controllers;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;

import uni.project.infinitylearn.services.CourseService;
import uni.project.infinitylearn.utils.FileUtil;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import java.io.File;
import java.io.FileInputStream;

public class FileHandler extends HttpServlet {
    public static final long serialVersionUID = 1L;
    private FileUtil fileUtil;

    public FileHandler() {
        super();
        this.fileUtil = new FileUtil();
    }
    @Override
    
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String pathInfo = request.getPathInfo();

        // TODO create validation for pathInfo

        String rootPath = System.getProperty("user.dir");
        String uploadPath = rootPath + File.separator + "uploads";
        String filePath = uploadPath + File.separator + pathInfo;
        File file = new File(filePath);
        String filename = file.getName();

        if(file.exists()) {
            response.setContentType("application/octet-stream");
            response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");
            response.setContentLength((int) file.length());
            try (InputStream in = new FileInputStream(file);
                 ServletOutputStream out = response.getOutputStream()) {
                byte[] buffer = new byte[1024];
                int bytesRead;
                while ((bytesRead = in.read(buffer)) != -1) {
                    out.write(buffer, 0, bytesRead);
                }
            }
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "File not found");
        }

    }   
}