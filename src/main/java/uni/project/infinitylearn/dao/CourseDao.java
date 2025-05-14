package uni.project.infinitylearn.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import uni.project.infinitylearn.listeners.*;
import uni.project.infinitylearn.models.Course;
import uni.project.infinitylearn.models.Lesson;
import uni.project.infinitylearn.models.LessonVideo;
public class CourseDao {
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


	public boolean updateCourse(Course course) {
		PreparedStatement statement = null;
		try {
			String sql = "UPDATE course SET title = ?, description = ?, instructor = ?, is_published = ?, category = ?, price = ?, banner_image = ? WHERE id = ?";
			statement = conn.prepareStatement(sql);
			statement.setString(1, course.getTitle());
			statement.setString(2, course.getDescription());
			statement.setString(3, course.getInstructor());
			statement.setBoolean(4, course.getIs_published());
			statement.setString(5, course.getCategory());
			statement.setString(6, course.getPrice());
			statement.setString(7, course.getBanner_image());
			statement.setLong(8, course.getId());

			int rowsUpdated = statement.executeUpdate();
			return rowsUpdated > 0; // Return true if at least one row was updated
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
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
}
