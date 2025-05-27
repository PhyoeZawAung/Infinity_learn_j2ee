package uni.project.infinitylearn.controllers.chat;


import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import uni.project.infinitylearn.models.Conversation;
import uni.project.infinitylearn.models.Message;
import uni.project.infinitylearn.models.User;
import uni.project.infinitylearn.services.ChatService;

public class ChatListController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ChatService chatService;

    public ChatListController() {
        this.chatService = new ChatService();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        
        // Get the current user ID from the session
        Long currentUserId = ((User)request.getSession().getAttribute("auth_user")).getId();

        // List<Message> messages = chatService.getMessagesForCurrentUser(currentUserId);
        List<Conversation> conversations = chatService.getConversationsForUser(currentUserId);
        // Set the conversations in the request attribute
        request.setAttribute("conversations", conversations);
        // Forward the request to the chat list JSP page

        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/chat/chat_list.jsp");
        dispatcher.forward(request, response);
    }
}