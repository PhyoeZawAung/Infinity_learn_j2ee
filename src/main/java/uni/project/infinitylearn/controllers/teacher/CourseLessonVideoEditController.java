package uni.project.infinitylearn.controllers.teacher;

import uni.project.infinitylearn.models.LessonVideo;
import uni.project.infinitylearn.services.CourseService;
import uni.project.infinitylearn.utils.FileUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;

@WebServlet("/teacher/course/lesson/lesson-video/edit")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 10,
        maxFileSize = 1024 * 1024 * 500
)
public class CourseLessonVideoEditController extends HttpServlet {
    private CourseService courseService;
    private FileUtil fileUtil;

    @Override
    public void init() throws ServletException {
        courseService = new CourseService();
        fileUtil = new FileUtil();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Long videoId = Long.parseLong(request.getParameter("video_id"));
            LessonVideo video = courseService.getLessonVideoById(videoId);

            if (video == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Video not found");
                return;
            }

            request.setAttribute("video", video);
            request.setAttribute("course_id", request.getParameter("course_id"));
            request.setAttribute("lesson_id", request.getParameter("lesson_id"));
            request.setAttribute("video_id", request.getParameter("video_id"));
            request.getRequestDispatcher("/views/teacher/course_lesson_video_edit.jsp").forward(request, response);
        } catch (Exception e) {
            throw new ServletException("Error retrieving video details", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Long videoId = Long.parseLong(request.getParameter("video_id"));
            String title = request.getParameter("title");
            String description = request.getParameter("description");
            
            // Handle optional file uploads
            Part videoPart = request.getPart("video");
            String videoUrl = null;
            if (videoPart != null && videoPart.getSize() > 0) {
                videoUrl = fileUtil.createFile("courses/videos", request.getServletContext(), videoPart);
                System.out.println("Controller - Video URL: " + videoUrl);
            }

            Part thumbnailPart = request.getPart("thumbnail");
            String thumbnail = null;
            if (thumbnailPart != null && thumbnailPart.getSize() > 0) {
                thumbnail = fileUtil.createFile("courses/thumbnails", request.getServletContext(), thumbnailPart);
                System.out.println("Controller - Thumbnail: " + thumbnail);
            }

            // Call the service to update the video
            boolean isUpdated = courseService.updateLessonVideo(videoId, title, description, videoUrl, thumbnail);

            if (isUpdated) {
                response.sendRedirect(request.getContextPath() + "/teacher/course/detail?course_id=" + request.getParameter("course_id"));
            } else {
                request.setAttribute("error", "Failed to update the video");
                doGet(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace(); // Log the exception
            throw new ServletException("Error updating video details", e);
        }
    }
}
