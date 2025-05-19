package uni.project.infinitylearn.controllers.teacher;

import uni.project.infinitylearn.dao.CourseDao;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class CourseLessonDeleteController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long lessonId = Long.parseLong(request.getParameter("lesson_id"));
        Long courseId = Long.parseLong(request.getParameter("course_id")); // for redirect

        CourseDao dao = new CourseDao();
        try {
            boolean deleted = dao.deleteLessonCascade(lessonId);
            if (deleted) {
                response.sendRedirect("/teacher/course/detail?course_id=" + courseId + "&deleted=true");
            } else {
                response.sendRedirect("/teacher/course/detail?course_id=" + courseId + "&error=not_found");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("/teacher/course/detail?course_id=" + courseId + "&error=exception");
        }        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response); // forward GET to POST logic
    }
}
