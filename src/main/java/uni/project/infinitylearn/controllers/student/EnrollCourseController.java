package uni.project.infinitylearn.controllers.student;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import uni.project.infinitylearn.models.User;
import uni.project.infinitylearn.services.CourseService;

public class EnrollCourseController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CourseService courseService;

    public EnrollCourseController() {
        super();
        this.courseService = new CourseService();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        // Handle POST request
        String courseId = request.getParameter("course_id");
        User user = (User) request.getSession().getAttribute("auth_user");

        Long user_id = user.getId();

        // check if user already enrolled in the course
        if (courseService.isUserEnrolledInCourse(user_id, Long.parseLong(courseId))) {
            request.setAttribute("error", "You are already enrolled in this course.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("");
            dispatcher.forward(request, response);
            return;
        }

        // Call the service to enroll the user in the course
        try {
            int success = courseService.enrollCourse(user_id, Long.parseLong(courseId));

            // if (success > 0) {
            //     request.setAttribute("success", "You have successfully enrolled in the course.");
            // } else {
            //     request.setAttribute("error", "Failed to enroll in the course. Please try again.");
            // }
            response.sendRedirect("/student/course/enroll/detail?" + "course_id=" + courseId);
            
        } catch (NumberFormatException | SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }




    
}

}
