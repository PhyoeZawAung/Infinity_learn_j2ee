package uni.project.infinitylearn.services;

import uni.project.infinitylearn.dao.CourseDao;
import uni.project.infinitylearn.listeners.MyContextListener;
import uni.project.infinitylearn.models.AssignmentQuestion;
import uni.project.infinitylearn.models.Course;
import uni.project.infinitylearn.models.Lesson;
import uni.project.infinitylearn.models.LessonAssignment;
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
		//System.out.println("Course: " + course);
		
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
	public void createCourseLessonAssignment(String title, String description,String assignment_url, Long lesson_id){
		LessonAssignment lessonAssignment = new LessonAssignment();
		lessonAssignment.setTitle(title);
		lessonAssignment.setDescription(description);
		lessonAssignment.setAssignmentUrl(assignment_url);
		lessonAssignment.setLessonId(lesson_id);

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
	
}
