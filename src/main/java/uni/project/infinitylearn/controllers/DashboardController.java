package uni.project.infinitylearn.controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import uni.project.infinitylearn.models.User;

public class DashboardController extends HttpServlet {
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        // Get the user role from the session or request
        User user = (User) request.getSession().getAttribute("auth_user");

        // Forward to the appropriate dashboard based on the user role
        if ("student".equals(user.getRole())) {
            request.getRequestDispatcher("/student/dashboard").forward(request, response);
        } else if ("teacher".equals(user.getRole())) {
            request.getRequestDispatcher("/teacher/dashboard").forward(request, response);
        }else if ("reviewer".equals(user.getRole())) {
            request.getRequestDispatcher("/reviewer/dashboard").forward(request, response);
        } else if ("admin".equals(user.getRole())) {
            request.getRequestDispatcher("/admin/dashboard").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/login");
        }

    }
}
