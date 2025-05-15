package uni.project.infinitylearn.dao;

import java.util.List;

import uni.project.infinitylearn.mappers.LessonVideoMapper;
import uni.project.infinitylearn.models.LessonVideo;

public class LessonVideoDao extends Dao {

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
