package uni.project.infinitylearn.mappers;

import java.sql.ResultSet;
import java.sql.SQLException;

import uni.project.infinitylearn.models.LessonVideo;

public class LessonVideoMapper {
    public static LessonVideo mapToLessonVideo(ResultSet rs) throws SQLException {
        LessonVideo lessonVideo = new LessonVideo();
        lessonVideo.setId(rs.getLong("id"));
        lessonVideo.setTitle(rs.getString("title"));
        lessonVideo.setDescription(rs.getString("description"));
        lessonVideo.setThumbnail(rs.getString("thumbnail"));
        lessonVideo.setVideoUrl(rs.getString("video_url"));
        lessonVideo.setLessonId(rs.getLong("lesson_id"));
        lessonVideo.setCourseId(rs.getLong("course_id"));
        return lessonVideo;
    }
    public static LessonVideo mapToLessonVideoWithProgress(ResultSet rs) throws SQLException{
        LessonVideo lessonVideo = new LessonVideo();
        lessonVideo.setId(rs.getLong("id"));
        lessonVideo.setTitle(rs.getString("title"));
        lessonVideo.setDescription(rs.getString("description"));
        lessonVideo.setThumbnail(rs.getString("thumbnail"));
        lessonVideo.setVideoUrl(rs.getString("video_url"));
        lessonVideo.setProgress(rs.getInt("progress"));
        lessonVideo.setIsCompleted(rs.getBoolean("is_completed"));
        return lessonVideo;
    }
}
