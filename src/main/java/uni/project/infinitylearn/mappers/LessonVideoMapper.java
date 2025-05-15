package uni.project.infinitylearn.mappers;

import java.sql.ResultSet;
import java.sql.SQLException;

import uni.project.infinitylearn.models.LessonVideo;

public class LessonVideoMapper {
    public static LessonVideo mapToLessonVideo(ResultSet rs) throws SQLException{
        LessonVideo lessonVideo = new LessonVideo();
        lessonVideo.setId(rs.getLong("id"));
        lessonVideo.setTitle(rs.getString("title"));
        lessonVideo.setDescription(rs.getString("description"));
        lessonVideo.setThumbnail(rs.getString("thumbnail"));
        lessonVideo.setVideoUrl(rs.getString("video_url"));
        return lessonVideo;
    }
}
