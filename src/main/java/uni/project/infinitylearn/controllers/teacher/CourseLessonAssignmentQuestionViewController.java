package uni.project.infinitylearn.controllers.teacher;

import uni.project.infinitylearn.models.AssignmentQuestion;
import uni.project.infinitylearn.models.LessonAssignment;
import uni.project.infinitylearn.services.CourseService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/teacher/course/lesson/assignment/question/view")
public class CourseLessonAssignmentQuestionViewController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CourseService service;
    public CourseLessonAssignmentQuestionViewController() {
        super();
        this.service = new CourseService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Long assignmentId = Long.parseLong(request.getParameter("assignment_id"));
            Long courseId = Long.parseLong(request.getParameter("course_id"));
            Long lessonId = Long.parseLong(request.getParameter("lesson_id"));
            LessonAssignment assignment = service.getLessonAssignmentByAssignmentId(assignmentId);
            request.setAttribute("assignment", assignment);
            request.setAttribute("assignment_id", assignmentId);
            request.setAttribute("course_id", courseId);
            request.setAttribute("lesson_id", lessonId);
            request.getRequestDispatcher("/views/teacher/assignment_question_view.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Error loading assignment questions", e);
        }
    }
}

