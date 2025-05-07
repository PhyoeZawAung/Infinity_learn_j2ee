package uni.project.infinitylearn.services;

import uni.project.infinitylearn.dao.CourseDao;
import uni.project.infinitylearn.listeners.MyContextListener;
import uni.project.infinitylearn.models.Course;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;


public class CourseService {
	
	private CourseDao courseDao;
	
	public CourseService() {
		this.courseDao = new CourseDao();
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
			
			courses.add(course);
		}
		
		return courses;
		
	}
	
	
	public void createCourse(Course course) {
		
		this.courseDao.createCourse(course);
		
	}
	
	
}
