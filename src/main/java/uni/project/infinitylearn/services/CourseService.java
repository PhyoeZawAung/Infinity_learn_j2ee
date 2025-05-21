package uni.project.infinitylearn.services;

import uni.project.infinitylearn.dao.CourseDao;
import uni.project.infinitylearn.dao.LessonVideoDao;
import uni.project.infinitylearn.listeners.MyContextListener;
import uni.project.infinitylearn.models.Course;
import uni.project.infinitylearn.models.Lesson;
import uni.project.infinitylearn.models.LessonVideo;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
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

	//get courses by instructor id that teachers only see their own courses
	public List<Course> getCoursesByInstructorName(String instructor) throws SQLException {
		return courseDao.getCoursesByInstructorName(instructor);
	}
		
	
	public void createCourse(String title, String shortDescription, String description, String instructor, String category, String price, boolean is_published, String banner_image) {
		Course course = new Course();
		course.setTitle(title);
		course.setShortDescription(shortDescription);
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
