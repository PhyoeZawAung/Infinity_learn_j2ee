package uni.project.infinitylearn.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import uni.project.infinitylearn.listeners.*;
import uni.project.infinitylearn.models.Course;

public class CourseDao {
	private Connection conn;

	public CourseDao() {
		this.conn = MyContextListener.getConnection();
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
}
