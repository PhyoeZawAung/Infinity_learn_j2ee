package uni.project.infinitylearn.controllers.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import uni.project.infinitylearn.dao.GuestDao;
import uni.project.infinitylearn.dao.UserDao;
import uni.project.infinitylearn.models.TeacherApplication;

public class TeacherApplicationActionController extends HttpServlet {
    private GuestDao guestDao;
    private UserDao userDao;

    @Override
    public void init() throws ServletException {
        guestDao = new GuestDao();
        userDao = new UserDao();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("Processing teacher application action...");
        
        int applicationId = Integer.parseInt(request.getParameter("id"));
        String action = request.getServletPath();
        
        System.out.println("Application ID: " + applicationId);
        System.out.println("Action: " + action);
        
        try {
            TeacherApplication application = guestDao.getTeacherApplicationById(applicationId);
            
            if (application == null) {
                System.out.println("Application not found for ID: " + applicationId);
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Application not found");
                return;
            }

            System.out.println("Found application for: " + application.getFirstName() + " " + application.getLastName());

            if (action.endsWith("/approve")) {
                System.out.println("Processing approval...");
                // Create new user with teacher role
                try {
                    userDao.saveTeacher(
                        application.getFirstName(),
                        application.getLastName(),
                        application.getEmail(),
                        application.getPhone(),
                        application.getPassword(),
                        application.getTitle(),
                        application.getExpertise(),
                        application.getExperience(),
                        application.getTeachingExperience(),
                        application.getCourseOutline(),
                        application.getResumeFile(),
                        application.getProfilePicFile()
                    );
                    System.out.println("Teacher user created successfully");
                    
                    // Delete the application since it's been processed
                    guestDao.deleteTeacherApplication(applicationId);
                    System.out.println("Application deleted after successful approval");
                    
                } catch (Exception e) {
                    System.out.println("Error during approval process:");
                    e.printStackTrace();
                    throw e;
                }
                
            } else if (action.endsWith("/reject")) {
                System.out.println("Processing rejection...");
                // Delete the rejected application
                guestDao.deleteTeacherApplication(applicationId);
                System.out.println("Application deleted after rejection");
            }

            // Redirect back to applications list
            response.sendRedirect(request.getContextPath() + "/dashboard");
            
        } catch (Exception e) {
            System.out.println("Error processing application:");
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error processing application: " + e.getMessage());
        }
    }
} 