package uni.project.infinitylearn.controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import uni.project.infinitylearn.models.User;
import uni.project.infinitylearn.services.CourseService;

public class ProfilePasswordChangeController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CourseService service;

    public ProfilePasswordChangeController() {
        super();
        this.service = new CourseService();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/password_change.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("auth_user");
        String oldPassword = request.getParameter("old_password");
        String newPassword = request.getParameter("new_password");
        String confirmPassword = request.getParameter("confirm_password");
        Long userId = user.getId();
        System.out.println("oldpassword "+oldPassword+" real password"+user.getPassword()+" newpassword "+newPassword+" confirmpassword "+confirmPassword);
        if (!(oldPassword.equals(user.getPassword()))) {
            request.getSession().setAttribute("error", "old password is incorrect");
            response.sendRedirect(request.getContextPath() + "/profile/password/change");
        }
        else if (!(newPassword.equals(confirmPassword))) {
            request.getSession().setAttribute("error", "Confirm Password must be same.");
            System.out.println(" confirm password is not correct");
            response.sendRedirect(request.getContextPath() + "/profile/password/change");
        } else {
            
            try {
                boolean isUpdated = service.updateUserPassword(user.getId(), newPassword);
                user =service.getUserById(userId);
                if (isUpdated) {
                    request.getSession().setAttribute("auth_user", user);
                    request.getSession().setAttribute("success", "Password changed");
                    response.sendRedirect(request.getContextPath() + "/profile/view");
                } else {
                    request.setAttribute("error", "Failed to update the lesson");
                    doGet(request, response);
                }
            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }

        }
    }

}
