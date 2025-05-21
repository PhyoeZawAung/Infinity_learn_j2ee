package uni.project.infinitylearn.controllers.teacher;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import uni.project.infinitylearn.models.Course;
import uni.project.infinitylearn.models.User;
import uni.project.infinitylearn.services.CourseService;

/**
 * Servlet implementation class CourseListController
 */
public class CourseListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CourseListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CourseService service = new CourseService();
	
		List<Course> courses = null;
	
		User loginUser = (User) request.getSession().getAttribute("auth_user");
		if (loginUser == null) {
			response.sendRedirect(request.getContextPath() + "/login");
			return;
		}
	
		try {
			String instructor = String.valueOf(loginUser.getId());
			courses = service.getCoursesByInstructorName(instructor);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
		request.setAttribute("courses", courses);
	
		RequestDispatcher rd = request.getRequestDispatcher("/views/teacher/course_list.jsp");
		rd.forward(request, response);
	}	

}
