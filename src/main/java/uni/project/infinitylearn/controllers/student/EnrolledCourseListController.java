package uni.project.infinitylearn.controllers.student;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import uni.project.infinitylearn.models.Course;
import uni.project.infinitylearn.models.User;
import uni.project.infinitylearn.services.CourseService;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
public class EnrolledCourseListController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public EnrolledCourseListController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Handle GET request
        // get the enrolled courses for the user
        User user = (User) request.getSession().getAttribute("auth_user");   
        Long user_id = user.getId();


        CourseService courseService = new CourseService();
        List<Course> enrolledCourses = new ArrayList<>();
        try {
            enrolledCourses = courseService.getEnrolledCourses(user_id);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        request.setAttribute("courses", enrolledCourses);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/student/enroll_course.jsp");
        dispatcher.forward(request, response);
    }

}
