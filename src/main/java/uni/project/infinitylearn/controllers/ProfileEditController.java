package uni.project.infinitylearn.controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import uni.project.infinitylearn.models.TeacherDetails;
import uni.project.infinitylearn.models.User;
import uni.project.infinitylearn.services.CourseService;
import uni.project.infinitylearn.utils.FileUtil;

@MultipartConfig
public class ProfileEditController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CourseService service;
    private FileUtil fileUtil;

    public ProfileEditController() {
        super();
        this.service = new CourseService();
        this.fileUtil = new FileUtil();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("auth_user");
        TeacherDetails teacherDetails = new TeacherDetails();
        teacherDetails = service.getTeacherDetailByUserId(user.getId());
        request.getSession().setAttribute("teacher_detail", teacherDetails);
        request.setAttribute("user", user);
        request.getRequestDispatcher("/profile_update.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        try {
            String firstName = request.getParameter("first_name");
            String lastName = request.getParameter("last_name");
            Part profileImagePart = request.getPart("profile_image");
            String profileImage = fileUtil.createFile("courses/thumbnails", request.getServletContext(),
                    profileImagePart);
            System.out.println(((User) request.getSession().getAttribute("auth_user")).getFirstName());
            Long userId = ((User) request.getSession().getAttribute("auth_user")).getId();
            System.out.println("firstname" + firstName + "lastname" + lastName + profileImage + userId);
            if (((User) request.getSession().getAttribute("auth_user")).getRole().equals("teacher")) {
                String title = request.getParameter("professional_title");
                Long years = Long.parseLong(request.getParameter("years_of_experience"));
                String expertise = request.getParameter("expertise_area");
                String bio = request.getParameter("biography");
                service.isSaveOrUpdateTeacherDetails(title,years,expertise,bio,userId);
            }
            boolean isUpdated = service.updateUser(userId, firstName, lastName, profileImage);

            if (isUpdated) {
                User user = service.getUserById(userId);
                request.getSession().setAttribute("auth_user", user);
                response.sendRedirect(request.getContextPath() + "/profile/view");

            } else {
                request.setAttribute("error", "Failed to update the lesson");
                doGet(request, response);
            }
        } catch (Exception e) {
            throw new ServletException("Error updating lesson", e);
        }
    }
}
