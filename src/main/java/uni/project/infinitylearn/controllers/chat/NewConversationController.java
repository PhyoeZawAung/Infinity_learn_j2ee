package uni.project.infinitylearn.controllers.chat;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import uni.project.infinitylearn.models.User;
import uni.project.infinitylearn.services.ChatService;

public class NewConversationController extends HttpServlet {

    private ChatService chatService;

    @Override
    public void init() throws ServletException {
        this.chatService = new ChatService();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Long receiverId = Long.parseLong(request.getParameter("receiver_id"));

        User authUser = (User) request.getSession().getAttribute("auth_user");
        // create new conversation

        List<Long> users = new ArrayList<>();
        users.add(receiverId);
        users.add(authUser.getId());

        try {
            // check the conversation already exists
            Long conversation_id = this.chatService.createNewConversation(users);

            if(conversation_id != null) {
                // set the conversation id in the request attribute
                request.setAttribute("conversation_id", conversation_id);
                // redirect to chat screen
                response.sendRedirect(request.getContextPath() + "/chat?conversation_id=" + conversation_id);
            } else {
                // handle error case, e.g., show an error message
                request.setAttribute("error", "Failed to create a new conversation.");
                request.getRequestDispatcher("/views/error.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        // redirect to conversation screen
    }

    
}
