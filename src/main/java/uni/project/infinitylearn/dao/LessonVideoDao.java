package uni.project.infinitylearn.dao;

import java.util.List;

import uni.project.infinitylearn.mappers.LessonVideoMapper;
import uni.project.infinitylearn.models.LessonVideo;

public class LessonVideoDao extends Dao {

    public List<LessonVideo> getLessonVideoByCourseIdAndLessonIdAndUserId(Long courseId, Long lessonId, Long userId) {
        System.out.println("getLessonVideoByCourseIdAndLessonId :: courseId: " + courseId);
        System.out.println("getLessonVideoByCourseIdAndLessonId :: lessonId: " + lessonId);
        String sql = """
                select * from lesson_videos
                join video_progress on lesson_videos.id = video_progress.video_id
                and lesson_videos.lesson_id = video_progress.lesson_id
                and lesson_videos.course_id = video_progress.course_id
                where lesson_videos.course_id = ? 
                and lesson_videos.lesson_id = ?
                and video_progress.user_id = ?
                """;
        return executeQueryList(sql, rs -> LessonVideoMapper.mapToLessonVideoWithProgress(rs), courseId, lessonId, userId);
    }

    public List<LessonVideo> getLessonVideoByCourseIdAndLessonId(Long courseId, Long lessonId) {
        System.out.println("getLessonVideoByCourseIdAndLessonId :: courseId: " + courseId);
        System.out.println("getLessonVideoByCourseIdAndLessonId :: lessonId: " + lessonId);
        String sql = """
                select * from lesson_videos
                where course_id = ? 
                and lesson_id = ?
                """;
        return executeQueryList(sql, rs -> LessonVideoMapper.mapToLessonVideo(rs), courseId, lessonId);
    }
    
}
