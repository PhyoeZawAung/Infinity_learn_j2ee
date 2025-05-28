package uni.project.infinitylearn.controllers.student;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import uni.project.infinitylearn.models.Course;
import uni.project.infinitylearn.models.User;
import uni.project.infinitylearn.services.CourseService;

public class EnrolledCourseDetailController extends HttpServlet{

    private static final long serialVersionUID = 1L;
    private CourseService courseService;

    @Override
    public void init() throws ServletException {
        // TODO Auto-generated method stub
        super.init();
        this.courseService = new CourseService();
    }


    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException ,IOException {
        // Your code to handle GET requests

        long courseId = Long.parseLong(request.getParameter("course_id")); 
        Long userId = ((User) request.getSession().getAttribute("auth_user")).getId();

        if(!this.courseService.isUserEnrolledInCourse(userId, courseId)){
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "You do not enroll this course");
            return;
        }

        try {
            Course course = this.courseService.getEnrolledCourseWithWatchHistory(userId, courseId);

            User instructor = this.courseService.getCourseInstructor(courseId);

            request.setAttribute("course", course);
            request.setAttribute("instructor", instructor);
            RequestDispatcher rd = request.getRequestDispatcher("/views/student/course_detail.jsp");

            rd.forward(request, response);

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    
    
}
