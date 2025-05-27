package uni.project.infinitylearn.controllers.guest;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import uni.project.infinitylearn.models.Course;
import uni.project.infinitylearn.services.CourseService;

public class CourseListController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CourseService courseService;

    public CourseListController() {
        super();
        this.courseService = new CourseService();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        try {
            List<Course> courses = courseService.getCoursesByStatus("published");
            request.setAttribute("courses", courses);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        // Handle GET request
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/guest/course_list.jsp");
        dispatcher.forward(request, response);
    }
}
