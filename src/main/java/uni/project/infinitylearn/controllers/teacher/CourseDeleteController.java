package uni.project.infinitylearn.controllers.teacher;

import uni.project.infinitylearn.dao.CourseDao;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class CourseDeleteController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long courseId = Long.parseLong(request.getParameter("course_id"));
        CourseDao dao = new CourseDao();

        try {
            boolean deleted = dao.deleteCourseCascade(courseId);
            if (deleted) {
                response.sendRedirect("list?deleted=true");
            } else {
                response.sendRedirect("detail?error=not_found");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("detail?error=exception");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response); // forward GET to POST logic
    }
}
