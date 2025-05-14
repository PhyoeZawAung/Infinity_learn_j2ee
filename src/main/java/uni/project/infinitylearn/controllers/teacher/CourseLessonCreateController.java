package uni.project.infinitylearn.controllers.teacher;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import uni.project.infinitylearn.services.CourseService;

public class CourseLessonCreateController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CourseService service;

    public CourseLessonCreateController() {
        super();
        this.service = new CourseService();
    }

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/teacher/course_lesson_create.jsp");

        dispatcher.forward(request, response);
    }

    // Example method to handle lesson creation
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        System.out.println("course id: " + request.getParameter("course_id"));
        Long courseId = Long.parseLong(request.getParameter("course_id"));

        service.createCourseLesson(title, description, courseId);
        
        response.sendRedirect("/teacher/course/detail?course_id=" + courseId);
}

}
