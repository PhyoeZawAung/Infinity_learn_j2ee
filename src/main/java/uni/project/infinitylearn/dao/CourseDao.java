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

	// get course by instructor name that teachers only see their own courses
	public List<Course> getCoursesByInstructorName(String instructorName) throws SQLException {
		List<Course> courses = new ArrayList<>();
		String sql = "SELECT * FROM course WHERE instructor = ?";
	
		PreparedStatement statement = conn.prepareStatement(sql);
		statement.setString(1, instructorName);
		ResultSet rs = statement.executeQuery();
	
		while (rs.next()) {
			Course course = new Course();
			course.setId(rs.getLong("id"));
			course.setTitle(rs.getString("title"));
			course.setDescription(rs.getString("description"));
			course.setInstructor(rs.getString("instructor"));
			course.setCategory(rs.getString("category"));
			course.setPrice(rs.getString("price"));
			course.setIs_published(rs.getBoolean("is_published"));
			course.setBanner_image(rs.getString("banner_image"));
			courses.add(course);
		}
	
		rs.close();
		statement.close();
	
		return courses;
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


	public boolean updateCourse(Long courseId, String title, String description, String instructor, String category, double price, String bannerImage) throws SQLException {
		String sql = "UPDATE course SET title = ?, description = ?, instructor = ?, category = ?, price = ?, banner_image = ? WHERE id = ?";
		int rowsUpdated = executeUpdate(sql, title, description, instructor, category, price, bannerImage, courseId);
		return rowsUpdated > 0; // Return true if at least one row was updated
	}

	public Lesson getLessonById(Long lessonId) throws Exception {
		String sql = "SELECT * FROM lessons WHERE id = ?";
		return executeQuery(sql, rs -> {
			if (rs.next()) {
				Lesson lesson = new Lesson();
				lesson.setId(rs.getLong("id"));
				lesson.setTitle(rs.getString("title"));
				lesson.setDescription(rs.getString("description"));
				lesson.setCourseId(rs.getLong("course_id"));
				return lesson;
			}
			return null;
		}, lessonId);
	}

	public int updateLesson(Long lessonId, String title, String description) throws Exception {
		String sql = "UPDATE lessons SET title = ?, description = ? WHERE id = ?";
		return executeUpdate(sql, title, description, lessonId);
	}

	public LessonVideo getLessonVideoById(Long videoId) throws Exception {
		String sql = "SELECT * FROM lesson_videos WHERE id = ?"; // Use 'id' instead of 'video_id'
		return executeQuery(sql, rs -> {
			if (rs.next()) {
				LessonVideo video = new LessonVideo();
				video.setId(rs.getLong("id")); // Correct column name
				video.setTitle(rs.getString("title"));
				video.setDescription(rs.getString("description"));
				video.setVideoUrl(rs.getString("video_url"));
				video.setThumbnail(rs.getString("thumbnail"));
				video.setLessonId(rs.getLong("lesson_id"));
				video.setCourseId(rs.getLong("course_id"));
				return video;
			}
			return null;
		}, videoId);
	}
	
	public int updateLessonVideo(Long videoId, String title, String description, String videoUrl, String thumbnail) throws Exception {
		String sql = "UPDATE lesson_videos SET title = ?, description = ?, video_url = ?, thumbnail = ? WHERE id = ?";
		System.out.println("DAO - SQL: " + sql);
		System.out.println("DAO - Parameters: " + title + ", " + description + ", " + videoUrl + ", " + thumbnail + ", " + videoId);

		return executeUpdate(sql, title, description, videoUrl, thumbnail, videoId);
	}
}
