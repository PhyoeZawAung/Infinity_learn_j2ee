package uni.project.infinitylearn.controllers.teacher;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import uni.project.infinitylearn.services.CourseService;
import uni.project.infinitylearn.utils.FileUtil;
@MultipartConfig
public class CourseLessonAssignmentQuestionCreateController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CourseService service;
    private FileUtil fileUtil;
    public CourseLessonAssignmentQuestionCreateController() {
        super();
        this.service = new CourseService();
        this.fileUtil = new FileUtil();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request
                .getRequestDispatcher("/views/teacher/course_lesson_assignment_question_create.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            Long assignment_id = Long.parseLong(request.getParameter("assignment_id"));
            String questionText = request.getParameter("question_text");
            String[] options = request.getParameterValues("option"); // array of input values
            String optionsCombined = String.join(",", options); // "Option1,Option2,..."
            System.out.println("Combined options: " + optionsCombined +"question_text" + questionText);
            String correctAnswer = request.getParameter("correct_answer");
            service.createCourseLessonAssignmentQuestion(assignment_id, questionText, optionsCombined, correctAnswer);
            response.sendRedirect("/CourseLessonAssignmentViewController?assignment_id=" + assignment_id);
}
}
