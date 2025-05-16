package uni.project.infinitylearn.controllers.student;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import uni.project.infinitylearn.models.Course;
import uni.project.infinitylearn.models.LessonVideo;
import uni.project.infinitylearn.models.User;
import uni.project.infinitylearn.services.CourseService;

public class VideoWatchController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private CourseService courseService;

    public VideoWatchController() {
        super();
        this.courseService = new CourseService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the video ID from the request
        String videoId = request.getParameter("video_id");
        String courseId = request.getParameter("course_id");
        String lessonId = request.getParameter("lesson_id");
        Long userId = ((User)request.getSession().getAttribute("auth_user")).getId();

        // Check if the video ID is valid
        if (videoId == null || videoId.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid video ID");
            return;
        }

        LessonVideo video = courseService.getVideo(Long.parseLong(videoId), userId);
        List<LessonVideo> videos = courseService.getLessonVideos(Long.parseLong(courseId), Long.parseLong(lessonId), userId);

        request.setAttribute("videos", videos);
        request.setAttribute("course_id", courseId);
        request.setAttribute("lesson_id", lessonId);
        request.setAttribute("video", video);

        request.getRequestDispatcher(
            "/views/student/watch_course.jsp"
        ).forward(request, response);

        // Set the content type to video/mp4
        // response.setContentType("video/mp4");

        // // Get the video file from the server
        // File videoFile = new File("path/to/videos/" + videoId + ".mp4");
        // if (!videoFile.exists()) {
        //     response.sendError(HttpServletResponse.SC_NOT_FOUND, "Video not found");
        //     return;
        // }

        // // Set the content length
        // response.setContentLength((int) videoFile.length());

        // // Write the video file to the response output stream
        // try (FileInputStream inStream = new FileInputStream(videoFile);
        //      OutputStream outStream = response.getOutputStream()) {
        //     byte[] buffer = new byte[4096];
        //     int bytesRead;
        //     while ((bytesRead = inStream.read(buffer)) != -1) {
        //         outStream.write(buffer, 0, bytesRead);
        //     }
        // } catch (IOException e) {
        //     e.printStackTrace();
        //     response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error streaming video");
        // }
    }
    
}
