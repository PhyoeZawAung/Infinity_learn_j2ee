package uni.project.infinitylearn.controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import uni.project.infinitylearn.services.CourseService;
import uni.project.infinitylearn.utils.FileUtil;
public class CourseLessonAssignmentCreateController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CourseService service;
    private FileUtil fileUtil;
    public CourseLessonAssignmentCreateController() {
        super();
        this.service = new CourseService();
        this.fileUtil = new FileUtil();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("course_lesson_assignment_create.jsp");

        dispatcher.forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        Long lesson_id=Long.parseLong(request.getParameter("lesson_id"));
        
        Part assignment_Part = request.getPart("assignment_url");
        String assignment_url = fileUtil.createFile("courses/thumbnails", request.getServletContext(), assignment_Part);
        System.out.println("assignment path: " + assignment_url);

        service.createCourseLessonAssignment(title, description, assignment_url,lesson_id);
        
        response.sendRedirect("/CourseViewController?lesson_id=" + lesson_id);
}
}
