package uni.project.infinitylearn.controllers.reviewer;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import uni.project.infinitylearn.models.Course;
import uni.project.infinitylearn.models.User;
import uni.project.infinitylearn.services.CourseService;

public class ReviewerCourseListController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ReviewerCourseListController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CourseService service = new CourseService();

        List<Course> courses = null;

        User loginUser = (User) request.getSession().getAttribute("auth_user");
        if (loginUser == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        try {
            // Get all courses where status = 'under_review'
            courses = service.getCoursesByStatus("under_review");
        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("courses", courses);

        RequestDispatcher rd = request.getRequestDispatcher("/views/reviewer/course_list.jsp");
        rd.forward(request, response);
    }
}
