package uni.project.infinitylearn.controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import uni.project.infinitylearn.models.TeacherDetails;
import uni.project.infinitylearn.models.User;
import uni.project.infinitylearn.services.CourseService;

public class ProfileViewController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CourseService service;
    public ProfileViewController(){
        super();
        this.service = new CourseService();
    }
    protected void doGet (HttpServletRequest request,HttpServletResponse response ) throws ServletException, IOException{
        User user = (User) request.getSession().getAttribute("auth_user");
        request.setAttribute("user", user);
        System.out.println("user last name"+user.getLastName());
        if (user.getRole().equals("teacher")){
            TeacherDetails teacherDetails = service.getTeacherDetailByUserId(user.getId());
            request.getSession().setAttribute("teacher_detail", teacherDetails);
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("/profile.jsp");
        dispatcher.forward(request, response);
    }
    
}
