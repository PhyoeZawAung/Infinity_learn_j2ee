package uni.project.infinitylearn.controllers.student;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import uni.project.infinitylearn.models.User;
import uni.project.infinitylearn.services.CourseService;

public class VideoProgressController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private CourseService courseService;

    public VideoProgressController() {
        super();
        this.courseService = new CourseService();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
        // Set the content type to JSON
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        // Get the video ID from the request


        StringBuilder jsonBuffer = new StringBuilder();
        request.getReader().lines().forEach(line -> jsonBuffer.append(line));
        String json = jsonBuffer.toString();
        System.out.println("VideoProgressController :: json: " + json);

        // JSONObject jsonObject = new JSONObject(json);
        JSONObject jsonObject = new JSONObject(json);

        Long courseId = jsonObject.getLong("course_id");
        Long lessonId = jsonObject.getLong("lesson_id");
        Long videoId = jsonObject.getLong("video_id");
        Long userId = ((User)request.getSession().getAttribute("auth_user")).getId();
        int progress = jsonObject.getInt("progress");
        boolean isCompleted = jsonObject.getBoolean("is_completed");

        System.out.println("VideoProgressController :: course id: " + courseId);
        System.out.println("VideoProgressController :: lesson id: " + lessonId);
        System.out.println("VideoProgressController :: user id: " + userId);
        System.out.println("VideoProgressController :: video id: " + videoId);
        System.out.println("VideoProgressController :: progress: " + progress);
        System.out.println("VideoProgressController :: is_completed: " + isCompleted);

        // Call the service to update the video progress
        try {
            courseService.updateVideoProgress(userId, courseId, lessonId, videoId, progress, isCompleted);
            response.setStatus(HttpServletResponse.SC_OK);
        } catch (NumberFormatException | SQLException e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }

    }
    
}
