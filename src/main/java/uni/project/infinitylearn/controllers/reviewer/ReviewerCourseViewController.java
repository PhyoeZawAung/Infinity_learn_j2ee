package uni.project.infinitylearn.controllers.reviewer;

import uni.project.infinitylearn.models.Course;
import uni.project.infinitylearn.services.CourseService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;

public class ReviewerCourseViewController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private CourseService service;

    public ReviewerCourseViewController() {
        super();
        this.service = new CourseService();
    }

     @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Long courseId = Long.parseLong(request.getParameter("course_id"));

        Course course = null;
        try {
            course = service.getCourseById(courseId);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.setAttribute("course", course);
        
        request.getRequestDispatcher("/views/reviewer/course_review.jsp")
                   .forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        long courseId = Long.parseLong(request.getParameter("courseId"));
        String action = request.getParameter("action");
        String reason = request.getParameter("rejectReason");

        try {
            if ("approve".equals(action)) {
                service.updateStatus(courseId, "published");
            } else if ("reject".equals(action)) {
                service.updateStatus(courseId, "draft");
                service.saveRejectionReason(courseId, reason);
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Review action failed.");
            return;
        }

        response.sendRedirect("/views/reviewer/course_list.jsp");
    }
}
