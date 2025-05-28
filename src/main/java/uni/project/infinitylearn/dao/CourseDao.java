package uni.project.infinitylearn.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mysql.cj.protocol.Resultset;
import com.mysql.cj.protocol.x.ResultMessageListener;

import uni.project.infinitylearn.listeners.*;
import uni.project.infinitylearn.models.AssignmentQuestion;
import uni.project.infinitylearn.models.Course;
import uni.project.infinitylearn.models.Lesson;
import uni.project.infinitylearn.models.LessonAssignment;
import uni.project.infinitylearn.models.LessonVideo;
import uni.project.infinitylearn.models.TeacherDetails;
import uni.project.infinitylearn.models.User;
import uni.project.infinitylearn.mappers.CourseMapper;
import uni.project.infinitylearn.mappers.LessonMapper;

public class CourseDao extends Dao {
	private Connection conn;

	public CourseDao() {
		this.conn = MyContextListener.getConnection();
	}

	//update user info
	public int updateUser(Long userId,String firstName,String lastName,String profileImage) throws SQLException {
		String sql = "UPDATE users SET first_name = ? , last_name = ? , profile_image = ? WHERE id = ?";
		return executeUpdate(sql, firstName,lastName,profileImage,userId);
	}

	public void isSaveOrUpdateTeacherDetails(String title,Long year, String expertise,String bio,Long userId ) throws SQLException{
		 String checkSql = "SELECT COUNT(*) FROM teacher_detail WHERE user_id = ?";
    PreparedStatement checkStmt = conn.prepareStatement(checkSql);
    checkStmt.setLong(1, userId);
    ResultSet rs = checkStmt.executeQuery();

    boolean exists = false;
    if (rs.next()) {
        exists = rs.getInt(1) > 0;
    }
    rs.close();
    checkStmt.close();

    if (exists) {
        // Update existing teacher detail
        String updateSql = "UPDATE teacher_detail SET professional_title = ?, years_of_experience = ?, area_of_expertise = ?, biography = ? WHERE user_id = ?";
        PreparedStatement updateStmt = conn.prepareStatement(updateSql);
        updateStmt.setString(1, title);
        updateStmt.setLong(2, year);
        updateStmt.setString(3, expertise);
        updateStmt.setString(4, bio);
        updateStmt.setLong(5, userId);
        updateStmt.executeUpdate();
        updateStmt.close();
    } else {
        // Insert new teacher detail
        String insertSql = "INSERT INTO teacher_detail (user_id, professional_title, years_of_experience, area_of_expertise, biography) VALUES (?, ?, ?, ?, ?)";
        PreparedStatement insertStmt = conn.prepareStatement(insertSql);
        insertStmt.setLong(1, userId);
        insertStmt.setString(2, title);
        insertStmt.setLong(3, year);
        insertStmt.setString(4, expertise);
        insertStmt.setString(5, bio);
        insertStmt.executeUpdate();
        insertStmt.close();
    }
	}

	public int updateUserPassword(Long userId,String newPassword) throws SQLException{
		String sql = "UPDATE users SET password =? WHERE id = ?";
		return executeUpdate(sql, newPassword,userId);
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

	public ResultSet getCourseLessonAssignments(Long courseId, long lessonId) throws SQLException {
		PreparedStatement statement = conn
				.prepareStatement("SELECT * FROM lesson_assignment WHERE course_id = ? and lesson_id = ?");
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

	// get course by instructor id that teachers only see their own courses
	public List<Course> getCoursesByInstructorId(String instructor) throws SQLException {
		List<Course> courses = new ArrayList<>();
		String sql = "SELECT * FROM course WHERE instructor = ?";

		PreparedStatement statement = conn.prepareStatement(sql);
		statement.setString(1, instructor);
		ResultSet rs = statement.executeQuery();

		while (rs.next()) {
			Course course = new Course();
			course.setId(rs.getLong("id"));
			course.setTitle(rs.getString("title"));
			course.setShortDescription(rs.getString("short_description"));
			course.setDescription(rs.getString("description"));
			course.setInstructor(rs.getString("instructor"));
			course.setCategory(rs.getString("category"));
			course.setPrice(rs.getString("price"));
			course.setCourseStatus(rs.getString("course_status"));
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
			statement = conn.prepareStatement(
					"INSERT INTO course (title, short_description, description, instructor, course_status, category, price, banner_image) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
			statement.setString(1, course.getTitle());
			statement.setString(2, course.getShortDescription());
			statement.setString(3, course.getDescription());
			statement.setString(4, course.getInstructor());
			statement.setString(5, course.getCourseStatus());
			statement.setString(6, course.getCategory());
			statement.setString(7, course.getPrice());
			statement.setString(8, course.getBanner_image());

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
					"INSERT INTO lesson_assignment (title, description, assignment_url, lesson_id,course_id) VALUES (?, ?, ?, ?, ?)");
			statement.setString(1, lessonAssignment.getTitle());
			statement.setString(2, lessonAssignment.getDescription());
			statement.setString(3, lessonAssignment.getAssignmentUrl());
			statement.setLong(4, lessonAssignment.getLessonId());
			statement.setLong(5, lessonAssignment.getCourseId());
			System.out.println("creating assignment done");
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

	public void createCourseLessonAssignmentQuestions(AssignmentQuestion assignmentQuestion) {
		PreparedStatement statement = null;
		try {
			statement = conn.prepareStatement(
					"INSERT INTO assignment_question (assignment_id,question,options,correct_answer) VALUES (? , ? , ? , ?)");
			statement.setLong(1, assignmentQuestion.getAssignment_id());
			statement.setString(2, assignmentQuestion.getQuestion_text());
			statement.setString(3, assignmentQuestion.getOption());
			statement.setString(4, assignmentQuestion.getCorrect_answer());
			statement.executeUpdate();
			System.out.println("done creating questions");
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

	// return single assignmentQuestion for edit
	public AssignmentQuestion getAssignmentQuestionById(Long questionId) {
		String sql = """
				select * from assignment_question where id = ?
				""";
		return executeQuery(sql, rs -> {
			AssignmentQuestion assque = new AssignmentQuestion();
			if (rs.next()) {
				assque.setAssignment_id(rs.getLong("assignment_id"));
				assque.setQuestion_text(rs.getString("question"));
				assque.setOption(rs.getString("options"));
				assque.setId(rs.getLong("id"));
				assque.setCorrect_answer(rs.getString("correct_answer"));
				return assque;
			}
			return null;
		}, questionId);
	}
	public TeacherDetails getTeacherDetailByUserId(long userId){
		String sql = """
				select * from teacher_detail where user_id = ?
				""";
				return executeQuery(sql, rs -> {
					TeacherDetails teacherDetails = new TeacherDetails();
					if (rs.next()){
						teacherDetails.setId(rs.getLong("id"));
						teacherDetails.setUserId(rs.getLong("user_id"));
						teacherDetails.setProfessionalTitle(rs.getString("professional_title"));
						teacherDetails.setYearOfExperience(rs.getLong("years_of_experience"));
						teacherDetails.setAreaOfExpertise(rs.getString("area_of_expertise"));
						teacherDetails.setBiography(rs.getString("biography"));
						return teacherDetails;
					}
					return null;
				},userId );
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
		List<Course> courses = new ArrayList<>();
		String sql = "SELECT c.*, CONCAT(u.first_name, ' ', u.last_name) as instructor_name " +
					"FROM course c " +
					"JOIN course_enrollment ce ON c.id = ce.course_id " +
					"JOIN users u ON c.instructor = u.id " +
					"WHERE ce.user_id = ?";

		PreparedStatement statement = conn.prepareStatement(sql);
		statement.setLong(1, userId);
		ResultSet rs = statement.executeQuery();

		while (rs.next()) {
			Course course = new Course();
			course.setId(rs.getLong("id"));
			course.setTitle(rs.getString("title"));
			course.setShortDescription(rs.getString("short_description"));
			course.setDescription(rs.getString("description"));
			course.setInstructor(rs.getString("instructor_name")); // Now using instructor_name instead of ID
			course.setCategory(rs.getString("category"));
			course.setPrice(rs.getString("price"));
			course.setBanner_image(rs.getString("banner_image"));
			courses.add(course);
		}

		rs.close();
		statement.close();

		return courses;
	}

	public List<User> getEnrolledStudents(Long courseId) throws SQLException {
		String sql = """
				    SELECT users.*
				    FROM users
				    INNER JOIN course_enrollment
				    ON users.id = course_enrollment.user_id
				    WHERE course_enrollment.course_id = ?
				""";

		return executeQueryList(sql, rs -> {
			User user = new User();
			user.setId(rs.getLong("id"));
			user.setFirstName(rs.getString("first_name"));
			user.setLastName(rs.getString("last_name"));
			user.setEmail(rs.getString("email"));
			user.setPassword(rs.getString("password")); // optionally skip this for security
			user.setProfile_image(rs.getString("profile_image"));
			user.setRole(rs.getString("role"));
			user.setDescription(rs.getString("description"));
			return user;
		}, courseId);
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

	public boolean updateCourseStatus(Long courseId, String newStatus) throws SQLException {
		String sql = "UPDATE course SET course_status = ? WHERE id = ?";
		int rowsUpdated = executeUpdate(sql, newStatus, courseId);
		return rowsUpdated > 0;
	}

	public boolean saveRejectionReason(Long courseId, String reason) throws SQLException {
		String sql = "UPDATE course SET rejection_reason = ? WHERE id = ?";
		int rowsUpdated = executeUpdate(sql, reason, courseId);
		return rowsUpdated > 0;
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

	public LessonAssignment getLessonAssignmentById(Long assignmentId) throws Exception {
		String sql = "SELECT * FROM lesson_assignment WHERE id = ?"; // Use 'id' instead of 'Assignment_id'
		return executeQuery(sql, rs -> {
			if (rs.next()) {
				LessonAssignment assignment = new LessonAssignment();
				assignment.setId(rs.getLong("id")); // Correct column name
				assignment.setTitle(rs.getString("title"));
				assignment.setDescription(rs.getString("description"));
				assignment.setAssignmentUrl(rs.getString("assignment_url"));
				assignment.setLessonId(rs.getLong("lesson_id"));
				assignment.setCourseId(rs.getLong("course_id"));
				return assignment;
			}
			return null;
		}, assignmentId);
	}

	public int updateLessonAssignment(Long assignment_id, String title, String description, String assignment_url)
			throws Exception {
		String sql = "UPDATE lesson_assignment SET title = ?, description = ? ,assignment_url = ? WHERE id = ?";
		System.out.println("DAO - SQL: " + sql);
		System.out
				.println("DAO - Parameters: " + title + "," + description + "," + assignment_url + "," + assignment_id);
		return executeUpdate(sql, title, description, assignment_url, assignment_id);
	}

	public ResultSet getAssignmentQuestionsByAssignmentId(Long assignmentId) {
		PreparedStatement statement;
		try {
			statement = conn.prepareStatement("SELECT * FROM assignment_question WHERE assignment_id=?");
			statement.setLong(1, assignmentId);
			ResultSet res = statement.executeQuery();
			return res;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public int updateLessonAssignmentQuestion(Long questionId,String question,String options, String correctAnswer) throws Exception{
		String sql = "UPDATE assignment_question SET question = ?,options = ? ,correct_answer =? WHERE id = ? ";
		return executeUpdate(sql, question,options,correctAnswer,questionId);
	}
	/**
	 * This is for reviewer to get all courses with status 'under_review'
	 */
	public List<Course> getCoursesByStatus(String status) throws SQLException {
		String sql = "SELECT * FROM course WHERE course_status = ?";

		return executeQueryList(sql, rs -> {
			Course course = new Course();
			course.setId(rs.getLong("id"));
			course.setTitle(rs.getString("title"));
			course.setShortDescription(rs.getString("short_description"));
			course.setDescription(rs.getString("description"));
			course.setInstructor(rs.getString("instructor"));
			course.setCategory(rs.getString("category"));
			course.setPrice(rs.getString("price"));
			course.setCourseStatus(rs.getString("course_status"));
			course.setBanner_image(rs.getString("banner_image"));
			return course;
		}, status);
	}

	public List<Map<String, Object>> getStudentLessonProgress(Long courseId, Long studentId) throws SQLException {
		String sql = """
				    SELECT
				        vp.lesson_id,
				        vp.video_id,
				        vp.progress,
				        vp.is_completed,
				        lv.title AS video_title,
				        l.title AS lesson_title
				    FROM video_progress vp
				    JOIN lesson_videos lv ON vp.video_id = lv.id
				    JOIN lessons l ON vp.lesson_id = l.id
				    WHERE vp.course_id = ? AND vp.user_id = ?
				""";

		PreparedStatement statement = conn.prepareStatement(sql);
		statement.setLong(1, courseId);
		statement.setLong(2, studentId);

		ResultSet rs = statement.executeQuery();

		List<Map<String, Object>> progressList = new ArrayList<>();
		while (rs.next()) {
			Map<String, Object> progressData = new HashMap<>();
			progressData.put("lessonId", rs.getLong("lesson_id"));
			progressData.put("lessonTitle", rs.getString("lesson_title"));
			progressData.put("videoId", rs.getLong("video_id"));
			progressData.put("videoTitle", rs.getString("video_title"));
			progressData.put("progress", rs.getInt("progress"));
			progressData.put("isCompleted", rs.getBoolean("is_completed"));

			progressList.add(progressData);
		}

		rs.close();
		statement.close();

		return progressList;
	}

	// Returns a Course object with lessons, videos, and video progress for a specific user
	public Course getCourseWithLessonsAndVideosAndProgress(Long courseId, Long userId) throws SQLException {
		Course course = null;

		// Get course basic info
		ResultSet courseRes = getCourseById(courseId);
		if (courseRes.next()) {
			course = new Course();
			course.setId(courseRes.getLong("id"));
			course.setTitle(courseRes.getString("title"));
			course.setDescription(courseRes.getString("description"));
			course.setShortDescription(courseRes.getString("short_description"));
			course.setInstructor(courseRes.getString("instructor"));
			course.setCourseStatus(courseRes.getString("course_status"));
			course.setRejectionReason(courseRes.getString("rejection_reason"));
			course.setCategory(courseRes.getString("category"));
			course.setPrice(courseRes.getString("price"));
			course.setBanner_image(courseRes.getString("banner_image"));
		}

		if (course == null) return null;

		// Get lessons
		ResultSet lessonsRes = getCourseLessons(courseId);
		List<Lesson> lessons = new ArrayList<>();
		while (lessonsRes.next()) {
			Lesson lesson = new Lesson();
			lesson.setId(lessonsRes.getLong("id"));
			lesson.setTitle(lessonsRes.getString("title"));
			lesson.setDescription(lessonsRes.getString("description"));
			lesson.setCourseId(lessonsRes.getLong("course_id"));

			// Get videos for this lesson
			ResultSet videosRes = getCourseLessonVideos(courseId, lesson.getId());
			List<LessonVideo> lessonVideos = new ArrayList<>();
			while (videosRes.next()) {
				LessonVideo video = new LessonVideo();
				video.setId(videosRes.getLong("id"));
				video.setTitle(videosRes.getString("title"));
				video.setDescription(videosRes.getString("description"));
				video.setVideoUrl(videosRes.getString("video_url"));
				video.setThumbnail(videosRes.getString("thumbnail"));
				video.setLessonId(videosRes.getLong("lesson_id"));
				video.setCourseId(videosRes.getLong("course_id"));

				// Get progress for this video and user
				String progressSql = "SELECT * FROM video_progress WHERE user_id = ? AND course_id = ? AND lesson_id = ? AND video_id = ?";
				PreparedStatement progressStmt = conn.prepareStatement(progressSql);
				progressStmt.setLong(1, userId);
				progressStmt.setLong(2, courseId);
				progressStmt.setLong(3, lesson.getId());
				progressStmt.setLong(4, video.getId());
				ResultSet progressRes = progressStmt.executeQuery();
				if (progressRes.next()) {
					video.setProgress(progressRes.getInt("progress"));
					video.setIsCompleted(progressRes.getBoolean("is_completed"));
					// Remove setCompletedAt, as your model does not have this field
				}
				progressRes.close();
				progressStmt.close();

				lessonVideos.add(video);
			}
			videosRes.close();
			lesson.setLessonVideos(lessonVideos);
			lessons.add(lesson);
		}
		lessonsRes.close();
		course.setLessons(lessons);

		return course;
	}

	// Returns a User object by ID
	public User getUserById(Long userId) throws SQLException {
		String sql = "SELECT * FROM users WHERE id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setLong(1, userId);
		ResultSet rs = stmt.executeQuery();
		User user = null;
		if (rs.next()) {
			user = new User();
			user.setId(rs.getLong("id"));
			user.setFirstName(rs.getString("first_name"));
			user.setLastName(rs.getString("last_name"));
			user.setEmail(rs.getString("email"));
			user.setPassword(rs.getString("password"));
			user.setProfile_image(rs.getString("profile_image"));
			user.setRole(rs.getString("role"));
			user.setDescription(rs.getString("description"));
		}
		rs.close();
		stmt.close();
		return user;
	}

	public int getEnrolledStudentCount(Long courseId) throws SQLException {
		String sql = "SELECT COUNT(*) FROM course_enrollment WHERE course_id = ?";
		return executeQuery(sql, rs -> {
			if (rs.next()) {
				return rs.getInt(1);
			}
			return 0;
		}, courseId);
	}

	public User getInstructorByCourseId(Long courseId) {
		String sql = """
				select * from users
				join course on course.instructor = users.id
				where course.id = ?
				""";

		return executeQuery(sql, rs -> {
			User user = new User();
            if (rs.next()) {
                user.setId(rs.getLong("id"));
                user.setFirstName(rs.getString("first_name"));
                user.setLastName(rs.getString("last_name"));
				user.setProfile_image(rs.getString("profile_image"));
                user.setEmail(rs.getString("email"));
                // user.setPassword(rs.getString("password"));
                user.setRole(rs.getString("role"));
                return user;
            }
            return null;
		}, courseId);
	}

	public User getCourseInstructor(Long courseId) throws SQLException {
		String sql = "SELECT * FROM users WHERE id = (SELECT instructor FROM course WHERE id = ?)";
		return executeQuery(sql, rs -> {
			if (rs.next()) {
				User user = new User();
				user.setId(rs.getLong("id"));
				user.setFirstName(rs.getString("first_name"));
				user.setLastName(rs.getString("last_name"));
				user.setEmail(rs.getString("email"));
				user.setProfile_image(rs.getString("profile_image"));
				user.setRole(rs.getString("role"));
				return user;
			}
			return null;
		}, courseId);
	}
}
