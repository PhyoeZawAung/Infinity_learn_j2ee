package uni.project.infinitylearn.services;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import uni.project.infinitylearn.dao.ChatDao;
import uni.project.infinitylearn.dao.UserDao;
import uni.project.infinitylearn.models.Conversation;
import uni.project.infinitylearn.models.Message;
import uni.project.infinitylearn.models.User;

public class ChatService {
    private ChatDao chatDao;
    private UserDao userDao;
    public ChatService() {
        this.chatDao = new ChatDao();
        this.userDao = new UserDao();
    }

    public int updateMessageReadStatus(Long userId, Long conversationId) throws SQLException {
        // Update the read status of messages for the user in the specified conversation
        return chatDao.updateMessageReadStatus(userId, conversationId);
    }

    public Long createNewConversation(List<Long> conversationUsers) throws SQLException {
        // check the conversation already exists

        return this.chatDao.createNewConversation(conversationUsers);
       
    }

    public Conversation getConversationById(Long conversationId) {
        return chatDao.getConversationById(conversationId);
    }
    
    public List<User> getALlUsers() {
        return userDao.getAllUsers();
    }

    public List<User> getAllUsersExceptCurrentUser(Long userId) {
        return userDao.getAllUsersExceptCurrentUser(userId);
    }

    public int sendMessage(Long senderId, Long conversationId, String message) throws SQLException {
        return chatDao.sendMessage(senderId, conversationId, message);
    }

    public List<Conversation> getConversationsForUser(Long userId) {
        return chatDao.getConversationsForUser(userId);
    }


    // public List<Message> getMessagesForCurrentUser(Long senderId) {
    //     return chatDao.getMessagesForCurrentUser(senderId);
    // }
    
}
