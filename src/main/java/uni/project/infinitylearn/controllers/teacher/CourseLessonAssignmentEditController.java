package uni.project.infinitylearn.controllers.teacher;

import uni.project.infinitylearn.models.LessonAssignment;
import uni.project.infinitylearn.services.CourseService;
import uni.project.infinitylearn.utils.FileUtil;

import javax.servlet.http.HttpServlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
@MultipartConfig
@WebServlet("/teacher/course/lesson/assignment/edit")
public class CourseLessonAssignmentEditController extends HttpServlet {
    private CourseService courseService;
    private FileUtil fileUtil;

    public void init() throws ServletException {
        courseService = new CourseService();
        fileUtil = new FileUtil();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Long Assignment_id = Long.parseLong(request.getParameter("assignment_id"));
            LessonAssignment assignment = courseService.getLessonAssignmentById(Assignment_id);

            if (assignment == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "assignment not found");
                return;
            }

            request.setAttribute("assignment", assignment);
            request.setAttribute("course_id", request.getParameter("course_id"));
            request.setAttribute("lesson_id", request.getParameter("lesson_id"));
            request.setAttribute("assignment_id", request.getParameter("assignment_id"));
            System.out.println("assignment: " + assignment.getAssignmentUrl() + assignment.getTitle()+ assignment.getLessonId());
            System.out.println("course_id" + request.getParameter("course_id"));
            System.out.println("course_id" + request.getParameter("lesson_id"));
            System.out.println("course_id" + request.getParameter("assignment_id"));
            request.getRequestDispatcher("/views/teacher/course_lesson_assignment_edit.jsp").forward(request, response);
        } catch (Exception e) {
            throw new ServletException("Error retrieving assignment details", e);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    try {
        // Extract form fields from parts (including hidden inputs)
        String assignmentIdStr = getFormField(request, "assignment_id");
        String title = getFormField(request, "title");
        String description = getFormField(request, "description");
        String courseId = getFormField(request, "course_id");  // if needed
        
        if (assignmentIdStr == null) {
            throw new ServletException("Missing assignment_id parameter");
        }

        Long assignment_id = Long.parseLong(assignmentIdStr);
        LessonAssignment assignment = courseService.getLessonAssignmentById(assignment_id);

        // Handle file part
        Part assignmentPart = request.getPart("assignment_url");
        String assignment_url = assignment.getAssignmentUrl(); // default to current

        if (assignmentPart != null && assignmentPart.getSize() > 0) {
            String newUrl = fileUtil.createFile("courses/thumbnails", request.getServletContext(), assignmentPart);
            if (newUrl != null) {
                assignment_url = newUrl;
            }
        }

        boolean isUpdated = courseService.updateLessonAssignment(assignment_id, title, description, assignment_url);

        if (isUpdated) {
            response.sendRedirect(request.getContextPath() + "/teacher/course/detail?course_id=" + courseId);
        } else {
            request.setAttribute("error", "Failed to update the assignment");
            doGet(request, response);
        }
    } catch (Exception e) {
        e.printStackTrace();
        throw new ServletException("Error updating assignment details", e);
    }
}

// Helper method to read form fields from multipart request
private String getFormField(HttpServletRequest request, String fieldName) throws IOException, ServletException {
    Part part = request.getPart(fieldName);
    if (part != null) {
        try (java.io.BufferedReader reader = new java.io.BufferedReader(new java.io.InputStreamReader(part.getInputStream(), "UTF-8"))) {
            return reader.readLine();
        }
    }
    return null;
}

}
