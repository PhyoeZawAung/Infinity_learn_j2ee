package uni.project.infinitylearn.controllers.teacher;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import uni.project.infinitylearn.dao.CourseDao;

public class CourseLessonAssignmentQuestionDeleteController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        Long questionId = Long.parseLong(request.getParameter("question_id"));
        Long assignmentId = Long.parseLong(request.getParameter("assignment_id"));
        Long courseId = Long.parseLong(request.getParameter("course_id"));
        Long lessonId = Long.parseLong(request.getParameter("lesson_id"));
        CourseDao dao = new CourseDao();
        try {
            int result = dao.deleteLessonAssignmentQuestion(questionId);
            if (result > 0) {
                response.sendRedirect(
                        "/teacher/course/lesson/assignment/question/view?course_id=" + courseId + "&lesson_id="
                                + lessonId + "&assignment_id=" + assignmentId + "&deleted=true");
            } else {
                response.sendRedirect(
                        "/teacher/course/lesson/assignment/question/view?course_id=" + courseId + "&lesson_id="
                                + lessonId + "&assignment_id=" + assignmentId + "&error=not_found");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(
                    "/teacher/course/lesson/assignment/question/view?course_id=" + courseId + "&lesson_id=" + lessonId
                            + "&assignment_id=" + assignmentId + "&error=exception");
        }
    }
}