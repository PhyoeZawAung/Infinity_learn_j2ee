package uni.project.infinitylearn.controllers.guest;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import uni.project.infinitylearn.models.Course;
import uni.project.infinitylearn.services.CourseService;

public class CourseDetailController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    CourseService courseService;

    // Constructor
    public CourseDetailController() {
        super();
        this.courseService = new CourseService();
    }

    // Handle GET request
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get course ID from request
        String courseId = request.getParameter("id");
        if (courseId == null || courseId.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Course ID is required");
            return;
        }

        // Fetch course details using the course ID
        Course course = null;
        try {
            course = courseService.getCourseById(Long.parseLong(courseId));
            if (course == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Course not found");
            return;
        }

            request.setAttribute("course", course);
            // Implement logic to fetch course details and forward to the JSP page
            RequestDispatcher dispatcher = request.getRequestDispatcher("/views/guest/course_detail.jsp");
            dispatcher.forward(request, response);
        } catch (NumberFormatException e) {
            // TODO Auto-generated catch block
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Course ID is required");
            return;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
    }

}
