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
	
	
}
