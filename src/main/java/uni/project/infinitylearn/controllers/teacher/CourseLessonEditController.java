package uni.project.infinitylearn.controllers.teacher;

import uni.project.infinitylearn.models.Lesson;
import uni.project.infinitylearn.services.CourseService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/teacher/course/lesson/edit")
public class CourseLessonEditController extends HttpServlet {
    private CourseService courseService;

    @Override
    public void init() throws ServletException {
        courseService = new CourseService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Long lessonId = Long.parseLong(request.getParameter("lesson_id"));
            Lesson lesson = courseService.getLessonById(lessonId);

            if (lesson == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Lesson not found");
                return;
            }

            request.setAttribute("lesson", lesson);
            request.getRequestDispatcher("/views/teacher/course_lesson_edit.jsp").forward(request, response);
        } catch (Exception e) {
            throw new ServletException("Error retrieving lesson", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Long lessonId = Long.parseLong(request.getParameter("lesson_id"));
            String title = request.getParameter("title");
            String description = request.getParameter("description");

            boolean isUpdated = courseService.updateLesson(lessonId, title, description);

            if (isUpdated) {
                response.sendRedirect(request.getContextPath() + "/teacher/course/detail?course_id=" + request.getParameter("course_id"));
            } else {
                request.setAttribute("error", "Failed to update the lesson");
                doGet(request, response);
            }
        } catch (Exception e) {
            throw new ServletException("Error updating lesson", e);
        }
    }
}
