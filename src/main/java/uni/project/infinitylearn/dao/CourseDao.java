package uni.project.infinitylearn.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import uni.project.infinitylearn.listeners.*;
import uni.project.infinitylearn.models.AssignmentQuestion;
import uni.project.infinitylearn.models.Course;
import uni.project.infinitylearn.models.Lesson;
import uni.project.infinitylearn.models.LessonAssignment;
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

		PreparedStatement statement = conn
				.prepareStatement("SELECT * FROM lesson_videos WHERE course_id = ? and lesson_id = ?");
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
			statement = conn.prepareStatement(
					"INSERT INTO course (title, description, instructor, is_published, category, price, banner_image) VALUES (?, ?, ?, ?, ?, ?, ?)");
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
			statement = conn.prepareStatement(
					"INSERT INTO lesson_videos (title, description, video_url, thumbnail, lesson_id, course_id) VALUES (?, ?, ?,?, ?, ?)");
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

	public void createLessonAssignments(LessonAssignment lessonAssignment) {
		PreparedStatement statement = null;
		try {
			statement = conn.prepareStatement(
					"INSERT INTO lesson_assignment (title, description, assignment_url, lesson_id) VALUES (?, ?, ?, ?)");
			statement.setString(1, lessonAssignment.getTitle());
			statement.setString(2, lessonAssignment.getDescription());
			statement.setString(3, lessonAssignment.getAssignmentUrl());
			statement.setLong(4, lessonAssignment.getLessonId());

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

	public void createCourseLessonAssignmentQuestions(AssignmentQuestion assignmentQuestion){
		PreparedStatement statement =null;
		try {
			statement = conn.prepareStatement(
				"INSERT INTO assignment_question (assignment_id,question,options,correct_answer) VALUES (? , ? , ? , ?)"
			);
			statement.setLong(1 , assignmentQuestion.getAssignment_id());
			statement.setString(2, assignmentQuestion.getQuestion_text());
			statement.setString(3, assignmentQuestion.getOption());
			statement.setString(4, assignmentQuestion.getCorrect_answer());
			statement.executeUpdate();
			System.out.println("done creating questions");
		}
		catch (SQLException e) {
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

	public int createVideoProgressEntry(Long userId, Long courseId, Long lessonId, Long videoId) throws SQLException {
		String sql = "INSERT INTO video_progress (user_id, course_id, lesson_id, video_id) VALUES (?, ?, ?, ?)";
		return executeUpdate(sql, userId, courseId, lessonId, videoId);
	}

	public int enrollCourse(Long userId, Long courseId) throws SQLException {

		return executeUpdate("INSERT INTO course_enrollment (user_id, course_id) VALUES (?, ?)", userId, courseId);

	}

	public Course getEnrolledCourseWithWatchHistory(Long userId, Long courseId) {
		String sql = """
				select * from course
				join course_enrollment on course.id = course_enrollment.course_id
				where course_enrollment.user_id = ?
				and course_enrollment.course_id = ?
				""";
		System.out.println("getEnrolledCourse :: sql :: " + sql);
		System.out.println("getEnrolledCourse :: userId :: " + userId);
		System.out.println("getEnrolledCourse :: courseId :: " + courseId);
		return executeQuery(sql, rs -> {
			Course course = null;
			if (rs.next()) {
				course = CourseMapper.mapCourseWithLessonAndUserStatus(rs, userId);
			}
			return course;
		}, userId, courseId);
	}

	public Course getEnrolledCourse(Long userId, Long courseId) {
		String sql = """
				select * from course
				join course_enrollment on course.id = course_enrollment.course_id
				where course_enrollment.user_id = ?
				and course_enrollment.course_id = ?
				""";
		System.out.println("getEnrolledCourse :: sql :: " + sql);
		System.out.println("getEnrolledCourse :: userId :: " + userId);
		System.out.println("getEnrolledCourse :: courseId :: " + courseId);
		return executeQuery(sql, rs -> {
			Course course = null;
			if (rs.next()) {
				course = CourseMapper.mapCourseWithLesson(rs);
			}
			return course;
		}, userId, courseId);
	}

	// get all enrolled courses for a student
	public List<Course> getEnrolledCourses(Long userId) throws SQLException {
		String sql = """
				Select * from course
				inner join course_enrollment on course.id = course_enrollment.course_id
				where course_enrollment.user_id = ?
				""";
		List<Course> courses = executeQueryList(sql, rs -> CourseMapper.mapCourseWithProgress(rs), userId);

		// for(Course course :courses) {
		// List<Lesson> lessons = new ArrayList<>();
		// lessons = executeQueryList("SELECT * FROM lessons WHERE course_id = ?", rs ->
		// LessonMapper.mapLesson(rs)
		// , course.getId());

		// for(Lesson lesson : lessons) {
		// List<LessonVideo> lessonVideos = new ArrayList<>();
		// lessonVideos = executeQueryList("SELECT * FROM lesson_videos WHERE course_id
		// = ? and lesson_id = ?", rs ->
		// LessonMapper.mapLessonVideo(rs)
		// , course.getId(), lesson.getId());

		// lesson.setLessonVideos(lessonVideos);
		// }
		// course.setLessons(lessons);
		// }
		return courses;
	}

	public LessonVideo getVideo(Long videoId, Long userId) throws SQLException {
		System.out.println("getVideoUrl :: videoId :: " + videoId);
		String sql = """
				SELECT * FROM lesson_videos
				join video_progress on lesson_videos.id = video_progress.video_id
				WHERE lesson_videos.id = ? and video_progress.video_id = ?
				and video_progress.user_id = ?;
				""";
		return executeQuery(sql, rs -> {
			LessonVideo lessonVideo = null;
			if (rs.next()) {
				lessonVideo = new LessonVideo();
				lessonVideo.setId(rs.getLong("id"));
				lessonVideo.setTitle(rs.getString("title"));
				lessonVideo.setDescription(rs.getString("description"));
				lessonVideo.setVideoUrl(rs.getString("video_url"));
				lessonVideo.setThumbnail(rs.getString("thumbnail"));
				lessonVideo.setLessonId(rs.getLong("lesson_id"));
				lessonVideo.setCourseId(rs.getLong("course_id"));
				lessonVideo.setProgress(rs.getInt("progress"));
				return lessonVideo;
			}
			return null;
		}, videoId, videoId, userId);
	}

	public int updateVideoProgress(Long userId, Long courseId, Long lessonId, Long videoId, int progress,
			boolean isCompleted) throws SQLException {
		String sql = "UPDATE video_progress SET progress = ?, is_completed = ? WHERE user_id = ? AND course_id = ? AND lesson_id = ? AND video_id = ?";
		return executeUpdate(sql, progress, isCompleted, userId, courseId, lessonId, videoId);
	}

	public boolean updateCourse(Long courseId, String title, String description, String instructor, String category,
			double price, String bannerImage) throws SQLException {
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

	public int updateLessonVideo(Long videoId, String title, String description, String videoUrl, String thumbnail)
			throws Exception {
		String sql = "UPDATE lesson_videos SET title = ?, description = ?, video_url = ?, thumbnail = ? WHERE id = ?";
		System.out.println("DAO - SQL: " + sql);
		System.out.println("DAO - Parameters: " + title + ", " + description + ", " + videoUrl + ", " + thumbnail + ", "
				+ videoId);

		return executeUpdate(sql, title, description, videoUrl, thumbnail, videoId);
	}
}
