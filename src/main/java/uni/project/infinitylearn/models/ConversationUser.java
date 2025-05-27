package uni.project.infinitylearn.models;

public class ConversationUser {
    private long id;
    private long conversationId;
    private User user;

    public ConversationUser(long id, long conversationId, User user) {
        this.id = id;
        this.conversationId = conversationId;
        this.user = user;
    }
     
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
     * @return long return the conversationId
     */
    public long getConversationId() {
        return conversationId;
    }

    /**
     * @param conversationId the conversationId to set
     */
    public void setConversationId(long conversationId) {
        this.conversationId = conversationId;
    }

    /**
     * @return long return the userId
     */
    public User getUserId() {
        return user;
    }

    /**
     * @param userId the userId to set
     */
    public void setUser(User user) {
        this.user = user;
    }

}
