package uni.project.infinitylearn.mappers;

import java.sql.ResultSet;
import java.sql.SQLException;

import uni.project.infinitylearn.dao.LessonDao;
import uni.project.infinitylearn.dao.LessonVideoDao;
import uni.project.infinitylearn.models.Course;

public class CourseMapper {
    
    public static Course mapCourse(ResultSet rs) throws SQLException {
            Course course = new Course();
			course.setId(rs.getLong("id"));
			course.setTitle(rs.getString("title"));
			course.setDescription(rs.getString("description"));
			course.setShortDescription(rs.getString("short_description"));
			course.setInstructor(rs.getString("instructor"));
			course.setCourseStatus(rs.getString("course_status"));
			course.setCategory(rs.getString("category"));
			course.setPrice(rs.getString("price"));
			course.setBanner_image(rs.getString("banner_image"));
			return course;
    }

	
	public static Course mapCourseWithProgress(ResultSet rs) throws SQLException {
		Course course = new Course();
		course.setId(rs.getLong("id"));
		course.setTitle(rs.getString("title"));
		course.setDescription(rs.getString("description"));
		course.setShortDescription(rs.getString("short_description"));
		course.setInstructor(rs.getString("instructor"));
		course.setCourseStatus(rs.getString("course_status"));
		course.setCategory(rs.getString("category"));
		course.setPrice(rs.getString("price"));
		course.setBanner_image(rs.getString("banner_image"));
		course.setProgress(rs.getInt("progress"));
		return course;
	}

	public static Course mapCourseWithLesson(ResultSet rs) throws SQLException {
		Course course = new Course();
		course.setId(rs.getLong("id"));
		course.setTitle(rs.getString("title"));
		course.setDescription(rs.getString("description"));
		course.setShortDescription(rs.getString("short_description"));
		course.setInstructor(rs.getString("instructor"));
		course.setCourseStatus(rs.getString("course_status"));
		course.setCategory(rs.getString("category"));
		course.setPrice(rs.getString("price"));
		course.setBanner_image(rs.getString("banner_image"));
		LessonDao lessonDao = new LessonDao();
		course.setLessons(lessonDao.getLessonsByCourseId(course.getId()));
		return course;
	}

	public static Course mapCourseWithLessonAndUserStatus(ResultSet rs, Long userId) throws SQLException {
		Course course = new Course();
		course.setId(rs.getLong("id"));
		course.setTitle(rs.getString("title"));
		course.setDescription(rs.getString("description"));
		course.setShortDescription(rs.getString("short_description"));
		course.setInstructor(rs.getString("instructor"));
		course.setCourseStatus(rs.getString("course_status"));
		course.setCategory(rs.getString("category"));
		course.setPrice(rs.getString("price"));
		course.setBanner_image(rs.getString("banner_image"));
		course.setProgress(rs.getInt("progress"));
		LessonDao lessonDao = new LessonDao();
		course.setLessons(lessonDao.getLessonsByCourseIdAndUserId(course.getId(), userId));
		return course;
	}
}
