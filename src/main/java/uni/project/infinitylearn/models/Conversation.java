package uni.project.infinitylearn.models;

import java.util.List;

public class Conversation {
    private long id;
    private String title;
    private List<ConversationUser> conversationUsers;
    private List<Message> messages;

    private Long messageCount;
    private User receiver;
    private Message lastMessage;

    private String createdAt;
    private String updatedAt;
    /**
     * @return long return the id
     */
    public long getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(long id) {
        this.id = id;
    }

    /**
     * @return long return the title
     */
    public String getTitle() {
        return title;
    }

    /**
     * @param title the title to set
     */
    public void setTitle(String title) {
        this.title = title;
    }


    /**
     * @return List<ConversationUser> return the conversationUsers
     */
    public List<ConversationUser> getConversationUsers() {
        return conversationUsers;
    }

    /**
     * @param conversationUsers the conversationUsers to set
     */
    public void setConversationUsers(List<ConversationUser> conversationUsers) {
        this.conversationUsers = conversationUsers;
    }


    /**
     * @return List<Message> return the messages
     */
    public List<Message> getMessages() {
        return messages;
    }

    /**
     * @param messages the messages to set
     */
    public void setMessages(List<Message> messages) {
        this.messages = messages;
    }

    /**
     * @return String return the createdAt
     */
    public String getCreatedAt() {
        return createdAt;
    }

    /**
     * @param createdAt the createdAt to set
     */
    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

    /**
     * @return String return the updatedAt
     */
    public String getUpdatedAt() {
        return updatedAt;
    }

    /**
     * @param updatedAt the updatedAt to set
     */
    public void setUpdatedAt(String updatedAt) {
        this.updatedAt = updatedAt;
    }


    /**
     * @return Long return the messageCount
     */
    public Long getMessageCount() {
        return messageCount;
    }

    /**
     * @param messageCount the messageCount to set
     */
    public void setMessageCount(Long messageCount) {
        this.messageCount = messageCount;
    }

    /**
     * @return User return the reveiver
     */
    public User getReceiver() {
        return receiver;
    }

    /**
     * @param reveiver the reveiver to set
     */
    public void setReceiver(User receiver) {
        this.receiver = receiver;
    }


    

    /**
     * @return Message return the lastMessage
     */
    public Message getLastMessage() {
        return lastMessage;
    }

    /**
     * @param lastMessage the lastMessage to set
     */
    public void setLastMessage(Message lastMessage) {
        this.lastMessage = lastMessage;
    }

}
