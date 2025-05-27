package uni.project.infinitylearn.controllers.guest;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import uni.project.infinitylearn.services.GuestService;
import uni.project.infinitylearn.utils.FileUtil;

@WebServlet("/guest/apply-teacher")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024, // 1MB
    maxFileSize = 5 * 1024 * 1024,   // 5MB for resume
    maxRequestSize = 10 * 1024 * 1024 // 10MB total
)
public class ApplyTeacherController extends HttpServlet {

    private GuestService guestService;
    private FileUtil fileUtil;

    @Override
    public void init() throws ServletException {
        guestService = new GuestService();
        fileUtil = new FileUtil();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Personal Info
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");

        // Professional Info
        String title = request.getParameter("title");
        String[] expertise = request.getParameterValues("expertise");
        String experience = request.getParameter("experience");

        // Teaching Experience
        String teachingExperience = request.getParameter("teachingExperience");
        String courseOutline = request.getParameter("courseOutline");

        // File Uploads using FileUtil
        Part resumePart = request.getPart("resume");
        Part profilePicturePart = request.getPart("profilePicture");

        String resumeFileName = fileUtil.createFile("teacher_applications/cv", getServletContext(), resumePart);
        String profilePicFileName = fileUtil.createFile("teacher_applications/profile", getServletContext(), profilePicturePart);

        // Call GuestService to save application data
        guestService.saveTeacherApplication(
            firstName, lastName, email, phone, password,
            title, expertise, experience,
            teachingExperience, courseOutline,
            resumeFileName, profilePicFileName
        );

        // Set a success message and redirect or forward
        request.setAttribute("message", "Your application has been submitted successfully!");
        request.getRequestDispatcher("/views/guest/apply-teacher.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Just forward to the form
        request.getRequestDispatcher("/views/guest/apply-teacher.jsp").forward(request, response);
    }
}