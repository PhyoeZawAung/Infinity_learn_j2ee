package uni.project.infinitylearn.controllers.reviewer;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DashboardController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/reviewer/dashboard.jsp");
        dispatcher.forward(request, response);
        // Logic for handling GET requests for the admin dashboard
        // request.getRequestDispatcher("/reviewer/dashboard.jsp").forward(request, response);
    }
}
