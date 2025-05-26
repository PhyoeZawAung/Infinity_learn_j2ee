package uni.project.infinitylearn.services;

import uni.project.infinitylearn.dao.CourseDao;
import uni.project.infinitylearn.dao.LessonVideoDao;
import uni.project.infinitylearn.listeners.MyContextListener;
import uni.project.infinitylearn.models.AssignmentQuestion;
import uni.project.infinitylearn.models.Course;
import uni.project.infinitylearn.models.Lesson;
import uni.project.infinitylearn.models.LessonAssignment;
import uni.project.infinitylearn.models.LessonVideo;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.mysql.cj.protocol.Resultset;

import java.util.ArrayList;


public class CourseService {
	
	private CourseDao courseDao;
	
	public CourseService() {
		this.courseDao = new CourseDao();
	}

	public Course getCourseById(Long id) throws SQLException{
		
		Course course = new Course();
		ResultSet course_res = this.courseDao.getCourseById(id);
		ResultSet lessons_res = this.courseDao.getCourseLessons(id);

		List<Lesson> lessons = new ArrayList();

		while(lessons_res.next()) {
			Lesson lesson = new Lesson();
			lesson.setId(lessons_res.getLong("id"));
			lesson.setTitle(lessons_res.getString("title"));
			lesson.setDescription(lessons_res.getString("description"));
			lesson.setCourseId(lessons_res.getLong("course_id"));
			
			ResultSet lesson_videos_res = this.courseDao.getCourseLessonVideos(id, lesson.getId());
			List<LessonVideo> lessonVideos = new ArrayList();
			ResultSet lesson_assignment_res = this.courseDao.getCourseLessonAssignments(id,lesson.getId());
			List<LessonAssignment> lessonAssignments =new ArrayList<>();
			while(lesson_videos_res.next()) {
				LessonVideo lessonVideo = new LessonVideo();
				lessonVideo.setId(lesson_videos_res.getLong("id"));
				lessonVideo.setTitle(lesson_videos_res.getString("title"));
				lessonVideo.setDescription(lesson_videos_res.getString("description"));
				lessonVideo.setVideoUrl(lesson_videos_res.getString("video_url"));
				lessonVideo.setThumbnail(lesson_videos_res.getString("thumbnail"));
				lessonVideo.setLessonId(lesson_videos_res.getLong("lesson_id"));
				lessonVideo.setCourseId(lesson_videos_res.getLong("course_id"));
				
				lessonVideos.add(lessonVideo);
			}
			
			lesson.setLessonVideos(lessonVideos);
			while (lesson_assignment_res.next()){
				LessonAssignment lessonAssignment = new LessonAssignment();
				lessonAssignment.setId(lesson_assignment_res.getLong("id"));
				lessonAssignment.setTitle(lesson_assignment_res.getString("title"));
				lessonAssignment.setDescription(lesson_assignment_res.getString("description"));
				lessonAssignment.setAssignmentUrl(lesson_assignment_res.getString("assignment_url"));
				lessonAssignment.setLessonId(lesson_assignment_res.getLong("lesson_id"));
				lessonAssignment.setCourseId(lesson_assignment_res.getLong("course_id"));

				lessonAssignments.add(lessonAssignment);
			}
			lesson.setAssignments(lessonAssignments);
			lessons.add(lesson);
			
		}
		course.setLessons(lessons);
		
		while(course_res.next()) {
			course.setId(course_res.getLong("id"));
			course.setTitle(course_res.getString("title"));
			course.setDescription(course_res.getString("description"));
			course.setShortDescription(course_res.getString("short_description"));
			course.setInstructor(course_res.getString("instructor"));
			course.setIs_published(course_res.getBoolean("is_published"));
			course.setCategory(course_res.getString("category"));
			course.setPrice(course_res.getString("price"));
			course.setBanner_image(course_res.getString("banner_image"));
		}
		
		return course;
		
	}
	public LessonAssignment getLessonAssignmentByAssignmentId(Long assignmentId) throws Exception{
		LessonAssignment assignment = new LessonAssignment();
		List<AssignmentQuestion> que = new ArrayList();
		LessonAssignment assignmentres = this.courseDao.getLessonAssignmentById(assignmentId);
		ResultSet assignmentQuestionResultset = this.courseDao.getAssignmentQuestionsByAssignmentId(assignmentId);
		while (assignmentQuestionResultset.next()) {
			AssignmentQuestion assQues = new AssignmentQuestion();
			assQues.setId(assignmentQuestionResultset.getLong("id"));
			assQues.setAssignment_id(assignmentQuestionResultset.getLong("assignment_id"));
			assQues.setQuestion_text(assignmentQuestionResultset.getString("question"));
			assQues.setOption(assignmentQuestionResultset.getString("options"));
			assQues.setCorrect_answer(assignmentQuestionResultset.getString("correct_answer"));
			que.add(assQues);
		}
		assignment.setTitle(assignmentres.getTitle());
		assignment.setQuestions(que);
		return assignment;
	}
	public List<Course> getAllCourses() throws SQLException{
		
		List<Course> courses = new ArrayList();
		ResultSet res = this.courseDao.getAllCourses();
		
		while(res.next()) {
			Course course = new Course();
			course.setId(res.getLong("id"));
			course.setTitle(res.getString("title"));
			course.setDescription(res.getString("description"));
			course.setShortDescription(res.getString("short_description"));
			course.setInstructor(res.getString("instructor"));
			course.setIs_published(res.getBoolean("is_published"));
			course.setCategory(res.getString("category"));
			course.setPrice(res.getString("price"));
			course.setBanner_image(res.getString("banner_image"));
			courses.add(course);
		}
		
		return courses;
		
	}
	
	
	public void createCourse(String title, String description, String instructor, String category, String price, boolean is_published, String banner_image) {
		Course course = new Course();
		course.setTitle(title);
		course.setDescription(description);
		course.setInstructor(instructor);
		course.setCategory(category);
		course.setPrice(price);
		course.setIs_published(is_published);
		course.setBanner_image(banner_image);
		
		this.courseDao.createCourse(course);
		
	}

	public void createCourseLesson(String title, String description, Long courseId) {
		
		Lesson lesson = new Lesson();
		lesson.setTitle(title);
		lesson.setDescription(description);
		lesson.setCourseId(courseId);
		
		this.courseDao.createCourseLesson(lesson);
		
	}

	public void createCourseLessonVideo(String title, String description, String videoUrl, 
	String thumbnail,Long lessonId, Long courseId) {
		
		LessonVideo lessonVideo = new LessonVideo();
		lessonVideo.setTitle(title);
		lessonVideo.setDescription(description);
		lessonVideo.setVideoUrl(videoUrl);
		lessonVideo.setThumbnail(thumbnail);
		lessonVideo.setLessonId(lessonId);
		lessonVideo.setCourseId(courseId);
		
		this.courseDao.createCourseLessonVideo(lessonVideo);
		
	}
	public void createCourseLessonAssignment(String title, String description,String assignment_url, Long lesson_id , Long course_id){
		LessonAssignment lessonAssignment = new LessonAssignment();
		lessonAssignment.setTitle(title);
		lessonAssignment.setDescription(description);
		lessonAssignment.setAssignmentUrl(assignment_url);
		lessonAssignment.setLessonId(lesson_id);
		lessonAssignment.setCourseId(course_id);
		this.courseDao.createLessonAssignments(lessonAssignment);
	}
	public void createCourseLessonAssignmentQuestion(long assignment_id,String question_text,String options,String correct_answer){
		AssignmentQuestion assignmentQuestion = new AssignmentQuestion();
		assignmentQuestion.setAssignment_id(assignment_id);
		assignmentQuestion.setQuestion_text(question_text);
		assignmentQuestion.setOption(options);
		assignmentQuestion.setCorrect_answer(correct_answer);
		System.out.println(assignmentQuestion.getAssignment_id()+assignmentQuestion.getQuestion_text()+assignmentQuestion.getOption()+assignmentQuestion.getCorrect_answer()+"in couseservice");
		this.courseDao.createCourseLessonAssignmentQuestions(assignmentQuestion);
	}

	public AssignmentQuestion getAssignmentQuestionById(Long questionId){
		return this.courseDao.getAssignmentQuestionById(questionId);
	}

	public Course getEnrolledCourse(Long userId, Long courseId) throws SQLException {
		return this.courseDao.getEnrolledCourse(userId, courseId);
	}

	public Course getEnrolledCourseWithWatchHistory(Long userId, Long courseId) throws SQLException {
		return this.courseDao.getEnrolledCourseWithWatchHistory(userId, courseId);
	}

	public int enrollCourse(Long userId, Long courseId) throws SQLException {
		// crete a video progress entry for the user
		int enroll_status = this.courseDao.enrollCourse(userId, courseId);
		if(enroll_status > 0) {

			Course course = this.getEnrolledCourse(userId, courseId);

			for (Lesson lesson : course.getLessons()) {
				for(LessonVideo lessonVideo : lesson.getLessonVideos()) {
					this.courseDao.createVideoProgressEntry(userId, courseId, lesson.getId(), lessonVideo.getId());
				}
				
			}

			return enroll_status;
		}
		return 0;
	}

	public List<Course> getEnrolledCourses(Long userId) throws SQLException {
		return this.courseDao.getEnrolledCourses(userId);
	}

	public boolean isUserEnrolledInCourse(Long userId, Long courseId) {
		try {
			return this.courseDao.isUserEnrolledInCourse(userId, courseId);
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public LessonVideo getVideo(Long videoId, Long userId) {
		try {
			return this.courseDao.getVideo(videoId, userId);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	public List<LessonVideo> getLessonVideos(Long courseId, Long lessonId, Long userId) {
		
			return new LessonVideoDao().getLessonVideoByCourseIdAndLessonIdAndUserId(courseId, lessonId, userId);
		 
	}

	public int updateVideoProgress(Long userId, Long courseId, Long lessonId, Long videoId, int progress, boolean isCompleted) throws SQLException {
		return this.courseDao.updateVideoProgress(userId, courseId, lessonId, videoId, progress, isCompleted);
	}

	public boolean updateCourse(Course course) throws SQLException {
		return this.courseDao.updateCourse(
			course.getId(),
			course.getTitle(),
			course.getDescription(),
			course.getInstructor(),
			course.getCategory(),
			Double.parseDouble(course.getPrice()),
			course.getBanner_image()
		);
	}

	/**
	 * Retrieves a lesson by its ID.
	 */
	public Lesson getLessonById(Long lessonId) throws Exception {
		return courseDao.getLessonById(lessonId);
	}

	/**
	 * Updates a lesson's details.
	 */
	public boolean updateLesson(Long lessonId, String title, String description) throws Exception {
		return courseDao.updateLesson(lessonId, title, description) > 0;
	}

	/**
	 * Retrieves a lesson video by its ID.
	 */
	public LessonVideo getLessonVideoById(Long videoId) throws Exception {
		return courseDao.getLessonVideoById(videoId);
	}

	/**
	 * Updates a lesson video's details.
	 */
	public boolean updateLessonVideo(Long videoId, String title, String description, String videoUrl, String thumbnail) throws Exception {
		LessonVideo existingVideo = courseDao.getLessonVideoById(videoId);

		if (existingVideo == null) {
			throw new IllegalArgumentException("Video not found for ID: " + videoId);
		}

		// Keep existing values if new ones are not provided
		if (videoUrl == null) {
			videoUrl = existingVideo.getVideoUrl();
		}
		if (thumbnail == null) {
			thumbnail = existingVideo.getThumbnail();
		}
	
		return courseDao.updateLessonVideo(videoId, title, description, videoUrl, thumbnail) > 0;
	}
	
	public boolean updateLessonAssignment(Long assignment_id, String title , String description,String assignment_url)throws Exception {
		LessonAssignment existingAssignment = courseDao.getLessonAssignmentById(assignment_id);
		if (existingAssignment == null ){
			throw new IllegalArgumentException("Assignment not found for Id"+assignment_id);
		}
		if (assignment_url == null ){
			assignment_url = existingAssignment.getAssignmentUrl();
		}
		return courseDao.updateLessonAssignment(assignment_id,title,description,assignment_url) > 0;
	}

	public LessonAssignment getLessonAssignmentById(Long assignmentId) throws Exception {
		return courseDao.getLessonAssignmentById(assignmentId);
	}

	public boolean updateLessonAssignmentQuestion(Long questionId,String question_text,String options,String correctAnswer) throws Exception{
		AssignmentQuestion existingQuestion = courseDao.getAssignmentQuestionById(questionId);
		if (existingQuestion == null ){
			throw new IllegalArgumentException("AssignmentQuestion not found for Id "+questionId);
		}
		return courseDao.updateLessonAssignmentQuestion(questionId,question_text,options,correctAnswer) >0;
	}
	/**
	 * Handles the update of a lesson video and manages exceptions.
	 */
	public void handleUpdateLessonVideo(Long videoId, String title, String description, String videoUrl, String thumbnail, javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws Exception {
		try {
			boolean isUpdated = updateLessonVideo(videoId, title, description, videoUrl, thumbnail);
		} catch (IllegalArgumentException e) {
			request.setAttribute("error", e.getMessage());
			request.getRequestDispatcher("/errorPage.jsp").forward(request, response);
		}
	}
	
	/**
	 * Deletes a course and all its lessons and videos.
	 */
	public boolean deleteCourse(Long courseId) throws SQLException {
		return courseDao.deleteCourseCascade(courseId);
	}

	/**
	 * Deletes a lesson and all its videos.
	 */
	public boolean deleteLesson(Long lessonId) throws SQLException {
		return courseDao.deleteLessonCascade(lessonId);
	}

	/**
	 * Deletes a lesson video by its ID.
	 */
	public boolean deleteLessonVideo(Long videoId) throws SQLException {
		return courseDao.deleteLessonVideo(videoId) > 0;
	}	
}

