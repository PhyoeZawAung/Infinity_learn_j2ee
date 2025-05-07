package uni.project.infinitylearn.controllers;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.servlet.annotation.MultipartConfig;

import uni.project.infinitylearn.services.CourseService;
import uni.project.infinitylearn.utils.FileUtil;

/**
 * Servlet implementation class CourseCreateController
 */
@MultipartConfig(
		fileSizeThreshold=1024*1024*10,
		maxFileSize=1024*1024*50,
		maxRequestSize=1024*1024*100
		)
public class CourseCreateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private FileUtil fileUtil;
	
	private CourseService service;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CourseCreateController() {
        super();
        this.service = new CourseService();
        this.fileUtil = new FileUtil();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		RequestDispatcher rd = request.getRequestDispatcher("course_create.jsp");
		
		
		rd.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String title = request.getParameter("title");
		String description = request.getParameter("description");
		String category = request.getParameter("category");
		String price = request.getParameter("price");
		
		Part banner_image = request.getPart("banner_image");
		
		String image = fileUtil.createFile("course/banners", getServletContext(), banner_image);
		
		// PrintWriter out = response.getWriter();
		
		// out.println("title" + title);
		// out.println("description" + description);
		// out.println("category" + category);
		// out.println("price" + price);
		// out.println("image" + image);

		service.createCourse(title, description,"PZA", category, price,true, image);

		response.sendRedirect("/CourseListController");

	}
	
	

}
