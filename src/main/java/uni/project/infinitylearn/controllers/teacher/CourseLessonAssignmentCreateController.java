package uni.project.infinitylearn.controllers.teacher;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import uni.project.infinitylearn.models.Course;
import uni.project.infinitylearn.services.CourseService;
import uni.project.infinitylearn.utils.FileUtil;
@MultipartConfig
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
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/teacher/course_lesson_assignment_create.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("arrived");
        String title = getValue(request.getPart("title"));
        String description = getValue(request.getPart("description"));
        System.out.println("title and description " + title + description);
        Long lesson_id = Long.parseLong(request.getParameter("lesson_id"));
        Long course_id = Long.parseLong(request.getParameter("course_id"));
        System.out.println("title " + title + "description " + description + "lesson_id" + lesson_id);
        Part assignment_Part = request.getPart("assignment_url");
        String assignment_url = fileUtil.createFile("courses/thumbnails", request.getServletContext(), assignment_Part);
        System.out.println("assignment path: " + assignment_url);

        service.createCourseLessonAssignment(title, description, assignment_url, lesson_id , course_id);
        response.sendRedirect("/teacher/course/detail?course_id=" + course_id);
    }
    private String getValue(Part part) throws IOException {
    BufferedReader reader = new BufferedReader(new InputStreamReader(part.getInputStream(), "UTF-8"));
    StringBuilder value = new StringBuilder();
    String line;
    while ((line = reader.readLine()) != null) {
        value.append(line);
    }
    return value.toString();
}
}
