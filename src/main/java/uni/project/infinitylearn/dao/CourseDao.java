package uni.project.infinitylearn.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import uni.project.infinitylearn.listeners.*;
import uni.project.infinitylearn.models.Course;
import uni.project.infinitylearn.models.Lesson;
import uni.project.infinitylearn.models.LessonVideo;
import uni.project.infinitylearn.mappers.CourseMapper;
import uni.project.infinitylearn.mappers.LessonMapper;
public class CourseDao extends Dao {
	private Connection conn;

	public CourseDao() {
		this.conn = MyContextListener.getConnection();
	}

	public ResultSet getCourseById(Long id) throws SQLException {

		PreparedStatement statement = conn.prepareStatement("SELECT * FROM course WHERE id = ?");

		statement.setLong(1, id);

		ResultSet res = statement.executeQuery();

		return res;

	}

	// get all course lessons
	public ResultSet getCourseLessons(Long courseId) throws SQLException {

		PreparedStatement statement = conn.prepareStatement("SELECT * FROM lessons WHERE course_id = ?");

		statement.setLong(1, courseId);

		ResultSet res = statement.executeQuery();

		return res;

	}

	// get all course lesson videos
	public ResultSet getCourseLessonVideos(Long courseId, Long lessonId) throws SQLException {

		PreparedStatement statement = conn.prepareStatement("SELECT * FROM lesson_videos WHERE course_id = ? and lesson_id = ?");
		statement.setLong(1, courseId);
		statement.setLong(2, lessonId);

		ResultSet res = statement.executeQuery();

		return res;
	}

	public ResultSet getAllCourses() throws SQLException {

		PreparedStatement statement = conn.prepareStatement("SELECT * FROM course");

		ResultSet res = statement.executeQuery();

		return res;

	}
	
	
	public void createCourse(Course course) {
		PreparedStatement statement = null;
		try {
			statement = conn.prepareStatement("INSERT INTO course (title, description, instructor, is_published, category, price, banner_image) VALUES (?, ?, ?, ?, ?, ?, ?)");
			statement.setString(1, course.getTitle());
			statement.setString(2, course.getDescription());
			statement.setString(3, course.getInstructor());
			statement.setBoolean(4, course.getIs_published());
			statement.setString(5, course.getCategory());
			statement.setString(6, course.getPrice());
			statement.setString(7, course.getBanner_image());

			statement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (statement != null) {
					statement.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public void createCourseLesson(Lesson lesson) {
		PreparedStatement statement = null;
		try {
			statement = conn.prepareStatement("INSERT INTO lessons (title, description, course_id) VALUES (?, ?, ?)");
			statement.setString(1, lesson.getTitle());
			statement.setString(2, lesson.getDescription());
			statement.setLong(3, lesson.getCourseId());

			statement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (statement != null) {
					statement.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public void createCourseLessonVideo(LessonVideo lessonVideo) {
		PreparedStatement statement = null;
		try {
			statement = conn.prepareStatement("INSERT INTO lesson_videos (title, description, video_url, thumbnail, lesson_id, course_id) VALUES (?, ?, ?,?, ?, ?)");
			statement.setString(1, lessonVideo.getTitle());
			statement.setString(2, lessonVideo.getDescription());
			statement.setString(3, lessonVideo.getVideoUrl());
			statement.setString(4, lessonVideo.getThumbnail());
			statement.setLong(5, lessonVideo.getLessonId());
			statement.setLong(6, lessonVideo.getCourseId());

			statement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (statement != null) {
					statement.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	// check if user is enrolled in course
	public boolean isUserEnrolledInCourse(Long userId, Long courseId) throws SQLException {
		String sql = "SELECT * FROM course_enrollment WHERE user_id = ? AND course_id = ?";
		return executeQuery(sql, rs -> {
			if (rs.next()) {
				return true;
			}
			return false;
		}, userId, courseId);
	}

	public int enrollCourse(Long userId, Long courseId) throws SQLException {
		
		return executeUpdate("INSERT INTO course_enrollment (user_id, course_id) VALUES (?, ?)", userId, courseId);
		
	}

	// get all enrolled courses for a student 
	public List<Course> getEnrolledCourses(Long userId) throws SQLException {
		String sql = """
				Select * from course
				inner join course_enrollment on course.id = course_enrollment.course_id
				where course_enrollment.user_id = ?
				""";
		List<Course> courses = executeQueryList(sql, rs -> CourseMapper.mapCourseWithProgress(rs), userId);

		for(Course course :courses) {
			List<Lesson> lessons = new ArrayList<>();
			lessons = executeQueryList("SELECT * FROM lessons WHERE course_id = ?", rs -> 
				LessonMapper.mapLesson(rs)
			, course.getId());

			for(Lesson lesson : lessons) {
				List<LessonVideo> lessonVideos = new ArrayList<>();
				lessonVideos = executeQueryList("SELECT * FROM lesson_videos WHERE course_id = ? and lesson_id = ?", rs -> 
					LessonMapper.mapLessonVideo(rs)
				, course.getId(), lesson.getId());
				
				lesson.setLessonVideos(lessonVideos);
			}
			course.setLessons(lessons);
		}
		return courses;
	}
}
