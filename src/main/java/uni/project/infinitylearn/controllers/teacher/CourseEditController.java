package uni.project.infinitylearn.controllers.teacher;

import uni.project.infinitylearn.models.Course;
import uni.project.infinitylearn.services.CourseService;
import uni.project.infinitylearn.utils.FileUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;

@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2, // 2MB
    maxFileSize = 1024 * 1024 * 10,      // 10MB
    maxRequestSize = 1024 * 1024 * 50    // 50MB
)
public class CourseEditController extends HttpServlet {

    private final CourseService courseService = new CourseService();
    private final FileUtil fileUtil = new FileUtil();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Use the correct parameter name as passed in the URL
        String courseIdParam = request.getParameter("course_id");
        System.out.println("Received course_id: " + courseIdParam);

        if (courseIdParam == null || courseIdParam.isEmpty()) {
            request.setAttribute("errorMessage", "Invalid course ID.");
            request.getRequestDispatcher("/views/teacher/course_edit.jsp").forward(request, response);
            return;
        }

        try {
            Long courseId = Long.parseLong(courseIdParam);
            Course course = courseService.getCourseById(courseId);

            if (course != null) {
                // Pass course details to the JSP
                request.setAttribute("course", course);
                request.getRequestDispatcher("/views/teacher/course_edit.jsp").forward(request, response);
            } else {
                request.setAttribute("errorMessage", "Course not found.");
                request.getRequestDispatcher("/views/teacher/course_edit.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid course ID format.");
            request.getRequestDispatcher("/views/teacher/course_edit.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error fetching course details.");
            request.getRequestDispatcher("/views/teacher/course_edit.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String courseIdParam = request.getParameter("courseId");
        String title = request.getParameter("courseTitle");
        String description = request.getParameter("courseDescription");
        String instructor = request.getParameter("instructor");
        String category = request.getParameter("category");
        String priceParam = request.getParameter("price");
        String isPublishedParam = request.getParameter("isPublished");
        String existingBannerImage = request.getParameter("existingBannerImage");
        Part bannerImagePart = request.getPart("banner_image");

        try {
            if (courseIdParam == null || courseIdParam.isEmpty()) {
                throw new NumberFormatException("Course ID is missing or invalid.");
            }
            Long courseId = Long.parseLong(courseIdParam);

            if (priceParam == null || priceParam.isEmpty()) {
                throw new NumberFormatException("Price is missing or invalid.");
            }
            double price = Double.parseDouble(priceParam);

            boolean isPublished = "on".equals(isPublishedParam);

            // Handle banner image upload using FileUtil
            String bannerImage = existingBannerImage; // Default to the existing banner image
            if (bannerImagePart != null && bannerImagePart.getSize() > 0) {
                bannerImage = fileUtil.createFile("course/banners", getServletContext(), bannerImagePart);
                System.out.println("New banner image uploaded: " + bannerImage);
            } else {
                System.out.println("No new banner image uploaded. Using existing image: " + bannerImage);
            }

            // Create a Course object and populate it with the form data
            Course course = new Course();
            course.setId(courseId);
            course.setTitle(title);
            course.setDescription(description);
            course.setInstructor(instructor);
            course.setCategory(category);
            course.setPrice(String.valueOf(price));
            course.setIs_published(isPublished);
            course.setBanner_image(bannerImage);

            System.out.println("Course object before update: " + course);

            // Update the course in the database
            boolean isUpdated = courseService.updateCourse(course);

            if (isUpdated) {
                response.sendRedirect("/teacher/course/detail?course_id=" + courseId + "&success=true");
            } else {
                response.sendRedirect("/teacher/course/edit?course_id=" + courseId + "&error=update_failed");
            }
        } catch (NumberFormatException e) {
            System.err.println("Invalid input: " + e.getMessage());
            response.sendRedirect("/teacher/course/edit?course_id=" + courseIdParam + "&error=invalid_input");
        } catch (Exception e) {
            System.err.println("Server error occurred: " + e.getMessage());
            e.printStackTrace();
            response.sendRedirect("/teacher/course/edit?course_id=" + courseIdParam + "&error=server_error");
        }
    }
}
