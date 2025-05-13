package uni.project.infinitylearn.mappers;

import java.sql.ResultSet;
import java.sql.SQLException;

import uni.project.infinitylearn.models.Course;

public class CourseMapper {
    
    public static Course mapCourse(ResultSet rs) throws SQLException {
            Course course = new Course();
			course.setId(rs.getLong("id"));
			course.setTitle(rs.getString("title"));
			course.setDescription(rs.getString("description"));
			course.setShortDescription(rs.getString("short_description"));
			course.setInstructor(rs.getString("instructor"));
			course.setIs_published(rs.getBoolean("is_published"));
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
		course.setIs_published(rs.getBoolean("is_published"));
		course.setCategory(rs.getString("category"));
		course.setPrice(rs.getString("price"));
		course.setBanner_image(rs.getString("banner_image"));
		course.setProgress(rs.getInt("progress"));
		return course;
	}
}
