package uni.project.infinitylearn.controllers.teacher;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;

import uni.project.infinitylearn.models.Course;
import uni.project.infinitylearn.services.CourseService;

public class CourseViewController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private CourseService service;
    public CourseViewController() {
        super();
        this.service = new CourseService();
    }

    // Example method to handle course view
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Logic to retrieve course details and lessons
        Long courseId = Long.parseLong(request.getParameter("course_id"));

        Course course = null;
        try {
            course = service.getCourseById(courseId);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        request.setAttribute("course", course);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/teacher/course_view.jsp");
        dispatcher.forward(request, response);
    }

    // Example method to handle lesson view
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Logic to retrieve lesson details and assignments
        // Forward to the lesson view page
        RequestDispatcher dispatcher = request.getRequestDispatcher("lesson_view.jsp");
        dispatcher.forward(request, response);
    }

}
