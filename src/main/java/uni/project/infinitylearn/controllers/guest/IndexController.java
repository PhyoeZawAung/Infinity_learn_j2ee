package uni.project.infinitylearn.controllers.guest;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class IndexController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Constructor
    public IndexController() {
        super();
    }

    // Handle GET request
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Forward to the index page
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/guest/dashboard.jsp");
        dispatcher.forward(request, response);
    }
    
}
