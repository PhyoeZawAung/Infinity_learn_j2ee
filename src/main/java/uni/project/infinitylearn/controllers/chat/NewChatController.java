package uni.project.infinitylearn.controllers.chat;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import uni.project.infinitylearn.models.User;
import uni.project.infinitylearn.services.ChatService;

public class NewChatController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private ChatService chatService;
    public NewChatController() {
        this.chatService = new ChatService();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        Long userId = ((User) request.getSession().getAttribute("auth_user")).getId();

        // get the users from the database

        List<User> users = chatService.getAllUsersExceptCurrentUser(userId);

        request.setAttribute("users", users);
        

        // get the messages from the database using receverId
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/chat/new_chat.jsp");
        dispatcher.forward(request, response);
    }
}
