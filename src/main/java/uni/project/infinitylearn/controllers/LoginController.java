package uni.project.infinitylearn.controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import uni.project.infinitylearn.models.User;
import uni.project.infinitylearn.services.UserService;

public class LoginController extends HttpServlet {
    
    private static final long serialVersionUID = 1L;

    private UserService service;

    public LoginController() {
        super();
        this.service = new UserService();
    }

    // Handle GET request
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
        dispatcher.forward(request, response);
    }

    // Handle POST request
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        RequestDispatcher dispatcher = null;
        // TODO: Validate the input data

        try {
           User user = service.loginUser(email, password);

           request.getSession().setAttribute("auth_user", user);

           request.getSession().setAttribute("message", "login successful");
        
            response.sendRedirect("/infinitylearn/dashboard");

        } catch (Exception e) {
            e.getMessage();
            request.setAttribute("error", e.getMessage());

            dispatcher = request.getRequestDispatcher("login.jsp");
            dispatcher.forward(request, response);
        }

}

}
