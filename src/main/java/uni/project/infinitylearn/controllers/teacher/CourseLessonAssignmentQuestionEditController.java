package uni.project.infinitylearn.controllers.teacher;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import uni.project.infinitylearn.models.AssignmentQuestion;
import uni.project.infinitylearn.services.CourseService;

public class CourseLessonAssignmentQuestionEditController extends HttpServlet{
    private CourseService courseService;
    public void init() throws ServletException {
       courseService = new CourseService();
    }

    // Show edit form
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Long questionId = Long.parseLong(request.getParameter("question_id"));
            Long assignmentId = Long.parseLong(request.getParameter("assignment_id"));
            Long courseId = Long.parseLong(request.getParameter("course_id"));
            Long lessonId = Long.parseLong(request.getParameter("lesson_id"));

            AssignmentQuestion question = courseService.getAssignmentQuestionById(questionId);
            request.setAttribute("question", question);
            request.setAttribute("assignment_id", assignmentId);
            request.setAttribute("course_id", courseId);
            request.setAttribute("lesson_id", lessonId);
            System.out.println(question.getOption());
            request.getRequestDispatcher("/views/teacher/assignment_question_edit.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Failed to load question for editing", e);
        }
    }

    // Handle update
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Long questionId = Long.parseLong(request.getParameter("question_id"));
            Long assignmentId = Long.parseLong(request.getParameter("assignment_id"));
            Long courseId = Long.parseLong(request.getParameter("course_id"));
            Long lessonId = Long.parseLong(request.getParameter("lesson_id"));

            String questionText = request.getParameter("question_text");
            String[] options = request.getParameterValues("option");
            String correctAnswer = request.getParameter("correct_answer");

            // Convert options array to comma-separated string
            String optionsString = String.join(",", options);
            boolean isUpdated = courseService.updateLessonAssignmentQuestion(questionId,questionText,optionsString,correctAnswer);
            if(isUpdated){
                response.sendRedirect(request.getContextPath() +
                "/teacher/course/lesson/assignment/question/view?course_id=" + courseId +
                "&lesson_id=" + lessonId +
                "&assignment_id=" + assignmentId);
            }
            else {
            request.setAttribute("error", "Failed to update the assignment");
            doGet(request, response);
        }
            
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Failed to update assignment question", e);
        }
    }
}
