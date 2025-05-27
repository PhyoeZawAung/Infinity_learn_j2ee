package uni.project.infinitylearn.controllers.chat;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import uni.project.infinitylearn.models.Conversation;
import uni.project.infinitylearn.models.User;
import uni.project.infinitylearn.services.ChatService;

public class ChatController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private ChatService chatService;

    public ChatController() {
        this.chatService = new ChatService();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Long receiverId = Long.parseLong(request.getParameter("receiver_id"));
        Long conversationId = Long.parseLong(request.getParameter("conversation_id"));
        Long senderId = ((User) request.getSession().getAttribute("auth_user")).getId();

        String message = request.getParameter("message");

        

        try {
            this.chatService.sendMessage(senderId, conversationId, message);

            // Redirect to the chat page with the conversation ID
            response.sendRedirect(request.getContextPath() + "/chat?conversation_id=" + conversationId);

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }


    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the chat ID from the request parameter
        String conversation_id = request.getParameter("conversation_id");

        // update message read status

        User authUser = (User) request.getSession().getAttribute("auth_user");

        try {
            chatService.updateMessageReadStatus(authUser.getId(), Long.parseLong(conversation_id));
        } catch (NumberFormatException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        // get the conversation details using conversation_id
        Conversation conversation = chatService.getConversationById(Long.parseLong(conversation_id));

        request.setAttribute("conversation", conversation);
        // get the messages from the database using receverId
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/chat/chat.jsp");
        dispatcher.forward(request, response);
    }
}
