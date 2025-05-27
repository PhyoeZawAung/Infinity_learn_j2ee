package uni.project.infinitylearn.controllers.guest;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ContactUsController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Constructor
    public ContactUsController() {
        super();
    }

    // Handle GET request
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Forward to the contact us page
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/guest/contact.jsp");
        dispatcher.forward(request, response);
    }
    
}
