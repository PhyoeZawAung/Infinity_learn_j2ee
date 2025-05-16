package uni.project.infinitylearn.mappers;

import java.sql.ResultSet;
import java.sql.SQLException;

import uni.project.infinitylearn.dao.LessonVideoDao;
import uni.project.infinitylearn.models.Lesson;
import uni.project.infinitylearn.models.LessonVideo;

public class LessonMapper {
    
    public static Lesson mapLesson(ResultSet rs) throws SQLException {
        Lesson lesson = new Lesson();
        lesson.setId(rs.getLong("id"));
        lesson.setTitle(rs.getString("title"));
        lesson.setDescription(rs.getString("description"));
        lesson.setCourseId(rs.getLong("course_id"));
        lesson.setLessonVideos(new LessonVideoDao().getLessonVideoByCourseIdAndLessonId(lesson.getCourseId(), lesson.getId()));
        return lesson;
    }

    public static Lesson mapLessonWithProgress(ResultSet rs, Long userId) throws SQLException {
        Lesson lesson = new Lesson();
        
        lesson.setId(rs.getLong("id"));
        lesson.setTitle(rs.getString("title"));
        lesson.setDescription(rs.getString("description"));
        lesson.setCourseId(rs.getLong("course_id"));
        LessonVideoDao lessonVideoDao = new LessonVideoDao();
        lesson.setLessonVideos(lessonVideoDao.getLessonVideoByCourseIdAndLessonIdAndUserId(lesson.getCourseId(), lesson.getId(), userId)); 
        return lesson;
    }
    
    public static LessonVideo mapLessonVideo(ResultSet rs) throws SQLException {
        LessonVideo lessonVideo = new LessonVideo();
        lessonVideo.setId(rs.getLong("id"));
        lessonVideo.setTitle(rs.getString("title"));
        lessonVideo.setDescription(rs.getString("description"));
        lessonVideo.setVideoUrl(rs.getString("video_url"));
        lessonVideo.setThumbnail(rs.getString("thumbnail"));
        lessonVideo.setLessonId(rs.getLong("lesson_id"));
        lessonVideo.setCourseId(rs.getLong("course_id"));
        return lessonVideo;
    }
}
