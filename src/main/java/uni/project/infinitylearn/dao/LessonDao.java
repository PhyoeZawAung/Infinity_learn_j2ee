package uni.project.infinitylearn.dao;

import java.util.List;

import uni.project.infinitylearn.mappers.LessonMapper;
import uni.project.infinitylearn.models.Lesson;

public class LessonDao extends Dao {

    public List<Lesson> getLessonsByCourseId(Long courseId) {
        String sql = """
                select * from lessons where course_id=?
                """;
        System.out.println("getLessonsByCourseId :: sql :: " + sql);
        System.out.println("getLessonsByCourseId :: courseId :: " + courseId);
       return executeQueryList(sql, rs -> LessonMapper.mapLesson(rs), courseId);
    }
    
}
