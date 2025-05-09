package uni.project.infinitylearn.controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import uni.project.infinitylearn.services.UserService;

public class UserRegisterController extends HttpServlet{

    private static final long serialVersionUID = 1L;
    private UserService service;

    public UserRegisterController() {
        super();
        this.service = new UserService();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("user_register.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Handle POST request
        String firstName = request.getParameter("first_name");
        String lastName = request.getParameter("last_name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // TODO valudate the input data

        try {
            service.registerUser(firstName, lastName, email, password);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }


        // Here you would typically save the user to a database
        // For now, just send a response back
        response.getWriter().write("User registered: " + firstName + " " + lastName);
    }
}
