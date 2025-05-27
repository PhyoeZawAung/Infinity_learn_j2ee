package uni.project.infinitylearn.controllers.teacher;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;

import uni.project.infinitylearn.models.Course;
import uni.project.infinitylearn.models.User;
import uni.project.infinitylearn.services.CourseService;

public class CourseViewController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private CourseService service;

    public CourseViewController() {
        super();
        this.service = new CourseService();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Long courseId = Long.parseLong(request.getParameter("course_id"));
        Course course = null;

        try {
            course = service.getCourseById(courseId);
            request.setAttribute("course", course);

            if (course != null && course.getRejectionReason() != null && !course.getRejectionReason().isEmpty()) {
                request.setAttribute("error", "This course was previously rejected: " + course.getRejectionReason());
            }

            // Fetch enrolled students
            try {
                List<User> enrolledStudents = service.getEnrolledStudents(courseId);
                request.setAttribute("enrolledStudents", enrolledStudents);
            } catch (SQLException e) {
                e.printStackTrace();
                request.setAttribute("studentError", "Failed to load enrolled students.");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/teacher/course_view.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("submit_for_review".equals(action)) {
            Long courseId = Long.parseLong(request.getParameter("course_id"));

            try {
                Course course = service.getCourseById(courseId);
                request.setAttribute("course", course);

                // Validate course content
                if (!service.isValidForReview(course)) {
                    request.setAttribute("error", "Course must have at least one lesson with at least one video.");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/views/teacher/course_view.jsp");
                    dispatcher.forward(request, response);
                    return;
                }

                // Update course status to 'under_review'
                service.updateStatus(courseId, "under_review");

                Course updatedCourse = service.getCourseById(courseId);
                service.saveRejectionReason(courseId, null);
                request.setAttribute("course", updatedCourse);
                request.setAttribute("success", "Course submitted for review successfully.");

                RequestDispatcher dispatcher = request.getRequestDispatcher("/views/teacher/course_view.jsp");
                dispatcher.forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("error", "Something went wrong while submitting for review.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/views/teacher/course_view.jsp");
                dispatcher.forward(request, response);
            }

        } else {
            // 🔄 Your original fallback forwarding to lesson view
            RequestDispatcher dispatcher = request.getRequestDispatcher("lesson_view.jsp");
            dispatcher.forward(request, response);
        }
    }

}
