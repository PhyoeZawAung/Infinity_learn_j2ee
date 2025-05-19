package uni.project.infinitylearn.controllers.teacher;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import uni.project.infinitylearn.services.CourseService;
import uni.project.infinitylearn.utils.FileUtil;
import javax.servlet.http.Part;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 10,
        maxFileSize = 1024 * 1024 * 500
)
public class CourseLessonVideoCreateController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CourseService service;
    private FileUtil fileUtil;
    public CourseLessonVideoCreateController() {
        super();
        this.service = new CourseService();
        this.fileUtil = new FileUtil();
        // TODO Auto-generated constructor stub
    }

    // Implement methods to handle video creation for lessons
    // For example, you can create a method to handle video upload and save it to the database

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Handle GET request for video creation
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/teacher/course_lesson_video_create.jsp");
        dispatcher.forward(request, response);
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Handle POST request for video creation
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        System.out.println("description: " + description);
        System.out.println("title: " + title);
        Long lessonId = Long.parseLong(request.getParameter("lesson_id"));
        Long courseId = Long.parseLong(request.getParameter("course_id"));

        // Handle file upload
        Part videoPart = request.getPart("video");
        String videoPath = fileUtil.createFile("courses/videos", request.getServletContext(), videoPart);
        System.out.println("Video path: " + videoPath);

        Part thumbnailPart = request.getPart("thumbnail");
        String thumbnailPath = fileUtil.createFile("courses/thumbnails", request.getServletContext(), thumbnailPart);
        System.out.println("Video path: " + videoPath);

        // Call the service to create the video for the lesson
        service.createCourseLessonVideo(title, description, videoPath, thumbnailPath, lessonId, courseId);

        // // Redirect or forward to a success page
        // response.sendRedirect("success.jsp");
        response.sendRedirect("/teacher/course/detail?course_id=" + courseId);
    }
}
