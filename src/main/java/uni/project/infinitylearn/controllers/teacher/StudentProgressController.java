package uni.project.infinitylearn.controllers.teacher;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

import uni.project.infinitylearn.models.Course;
import uni.project.infinitylearn.models.User;
import uni.project.infinitylearn.services.CourseService;

@WebServlet("/teacher/course/student-progress")
public class StudentProgressController extends HttpServlet {
    // ...existing code...
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String courseIdStr = request.getParameter("course_id");
        String studentIdStr = request.getParameter("student_id");

        if (courseIdStr == null || studentIdStr == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing course_id or student_id");
            return;
        }

        try {
            long courseId = Long.parseLong(courseIdStr);
            long studentId = Long.parseLong(studentIdStr);

            CourseService courseService = new CourseService();
            Course course = courseService.getCourseWithLessonsAndVideosAndProgress(courseId, studentId);
            // Calculate lesson progress for each lesson
            if (course != null && course.getLessons() != null) {
                for (var lesson : course.getLessons()) {
                    int totalVideos = lesson.getLessonVideos() != null ? lesson.getLessonVideos().size() : 0;
                    int completedVideos = 0;
                    if (lesson.getLessonVideos() != null) {
                        for (var video : lesson.getLessonVideos()) {
                            if (video.isIsCompleted()) {
                                completedVideos++;
                            }
                        }
                    }
                    int percent = totalVideos > 0 ? (completedVideos * 100 / totalVideos) : 0;
                    lesson.setTotalVideos(totalVideos);
                    lesson.setCompletedVideos(completedVideos);
                    lesson.setProgressPercent(percent);
                }
            }
            User student = courseService.getUserById(studentId);

            request.setAttribute("course", course);
            request.setAttribute("student", student);

            request.getRequestDispatcher("/views/teacher/student_progress.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid course_id or student_id");
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
