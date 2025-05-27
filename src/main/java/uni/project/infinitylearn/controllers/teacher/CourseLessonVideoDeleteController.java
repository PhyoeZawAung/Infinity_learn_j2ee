package uni.project.infinitylearn.controllers.teacher;
import uni.project.infinitylearn.dao.CourseDao;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class CourseLessonVideoDeleteController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long videoId = Long.parseLong(request.getParameter("video_id"));
        Long courseId = Long.parseLong(request.getParameter("course_id"));
        Long lessonId = Long.parseLong(request.getParameter("lesson_id"));

        CourseDao dao = new CourseDao();
        try {
            int result = dao.deleteLessonVideo(videoId);
            if (result > 0) {
                response.sendRedirect("/teacher/course/detail?course_id=" + courseId + "&lessonId=" + lessonId + "&deleted=true");
            } else {
                response.sendRedirect("/teacher/course/detail?course_id=" + courseId + "&lessonId=" + lessonId + "&error=not_found");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("/teacher/course/detail?course_id=" + courseId + "&lessonId=" + lessonId + "&error=exception");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response); // forward GET to POST logic
    }
}
