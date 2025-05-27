package uni.project.infinitylearn.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.stream.Collectors;

import uni.project.infinitylearn.models.Conversation;
import uni.project.infinitylearn.models.ConversationUser;
import uni.project.infinitylearn.models.Message;
import uni.project.infinitylearn.models.User;

public class ChatDao extends Dao {

    public ChatDao() {
        super();
    }

    public int updateMessageReadStatus(Long userId, Long conversationId) throws SQLException {
        String sql = "UPDATE messages SET is_read = 1 WHERE conversation_id = ? AND sender_id != ?";
        return executeUpdate(sql, conversationId, userId);
    }

    public Long checkIfConversationExists(List<Long> conversationUsers) throws SQLException{


        // Generate placeholders (?, ?, ...) based on user count
        String placeholders = conversationUsers.stream()
                .map(u -> "?")
                .collect(Collectors.joining(", "));

        String sql = String.format("""
            SELECT cu.conversation_id
            FROM conversation_users AS cu
            WHERE cu.user_id IN (%s)
            GROUP BY cu.conversation_id
            HAVING COUNT(DISTINCT cu.user_id) = ?
            LIMIT 1
        """, placeholders);

            PreparedStatement stmt = conn.prepareStatement(sql);
        
            int index = 1;

            // Set user IDs
            for (Long userId : conversationUsers) {
                stmt.setLong(index++, userId);
            }

            // Set count for HAVING clause
            stmt.setInt(index, conversationUsers.size());

            System.out.println("Executing SQL: " + stmt);

                ResultSet rs = stmt.executeQuery();
                if (rs.next()) {
                    return rs.getLong("conversation_id");
                } else {
                    return null;
                }
        
        
    }

    public Long createNewConversation(List<Long> conversationUsers) throws SQLException {

        // check the conversation already exists
        Long conversationId = null;

        conversationId = checkIfConversationExists(conversationUsers);
        System.out.println("conversationId: " + conversationId);

        if(conversationId != null) {
            return conversationId; // conversation already exists
        }

        String sql = "INSERT INTO conversations (title) values (?)";
        PreparedStatement statement = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
        statement.setString(1, "conversation");
        int is_created = statement.executeUpdate();
        

        if(is_created > 0) {
            ResultSet generatedKey = statement.getGeneratedKeys();

            while (generatedKey.next()) {
                conversationId = generatedKey.getLong(1);

                System.out.println("generated id" + conversationId);

                for(Long conversationUser: conversationUsers) {
                    addConversationUser(conversationId, conversationUser);
                }
            }
        }

        return conversationId;
    }

    private int addConversationUser(Long conversationId,Long userId) throws SQLException {
        String sql = "insert into conversation_users (conversation_id, user_id) values (?, ?)";
        return executeUpdate(sql, conversationId, userId);
    }

    public Conversation getConversationById(Long conversationId) {
        String sql = "SELECT * FROM conversations WHERE id = ?";
        return executeQuery(sql, rs -> {
            try {
                if(rs.next()){
                    Conversation conversation = new Conversation();
                conversation.setId(rs.getLong("id"));
                conversation.setTitle(rs.getString("title"));
                conversation.setConversationUsers(
                    executeQueryList("SELECT * FROM conversation_users WHERE conversation_id = ?", 
                        rsUser -> {
                            try {
                                return new ConversationUser(
                                    rsUser.getLong("id"),
                                    rsUser.getLong("conversation_id"),
                                    (new UserDao()).getUserById(rsUser.getLong("user_id"))
                                );
                            } catch (SQLException e) {
                                throw new RuntimeException(e);
                            }
                        }, conversationId
                    )
                );
                conversation.setMessages(
                    executeQueryList("SELECT * FROM messages WHERE conversation_id = ?", 
                        rsMessage -> {
                            try {
                                return new Message(
                                    rsMessage.getLong("id"),
                                    rsMessage.getLong("conversation_id"),
                                    (new UserDao()).getUserById(rsMessage.getLong("sender_id")),
                                    rsMessage.getString("message"),
                                    rsMessage.getString("created_at"),
                                    rsMessage.getString("updated_at")
                                );
                            } catch (SQLException e) {
                                throw new RuntimeException(e);
                            }
                        }, conversationId
                    )
                );
                conversation.setCreatedAt(rs.getString("created_at"));
                conversation.setUpdatedAt(rs.getString("updated_at"));
                return conversation;
                } else {
                    return null;
                }
                
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }, conversationId);
    }

    public int sendMessage(Long senderId, Long conversationId, String message) throws SQLException {
        String sql = "INSERT INTO messages (sender_id, conversation_id, message) VALUES (?, ?, ?)";
        return executeUpdate(sql, senderId, conversationId, message);
    }

    public List<Conversation> getConversationsForUser(Long userId) {
        String sql = """
            SELECT c.* FROM conversations c
            JOIN conversation_users cu ON c.id = cu.conversation_id
            WHERE cu.user_id = ?
            """;

        return executeQueryList(sql, rs -> {
            try {
                Conversation conversation = new Conversation();
                conversation.setId(rs.getLong("id"));
                conversation.setTitle(rs.getString("title"));
                conversation.setMessageCount(
                    (Long) executeQuery("select count(*) as message_count from messages where conversation_id=? and is_read=0", 
                    countRs -> {
                        if(countRs.next()){
                            return countRs.getLong("message_count");
                        }else {
                            return 0;
                        }
                    }, conversation.getId())
                );

                conversation.setLastMessage(
                    executeQuery("select * from messages where conversation_id= ? order by created_at desc limit 1", 
                    messageRs -> {
                        if(messageRs.next()){
                            Message message = new Message();
                            message.setId(messageRs.getLong("id"));
                            message.setMessage(messageRs.getString("message"));
                            message.setCreatedAt(messageRs.getString("created_at"));
                            return message;
                        }else {
                            return null;
                        }
                    }
                    , conversation.getId())
                );
                conversation.setReceiver(
                    executeQuery("select * from conversation_users where conversation_id= ? and user_id != ?", 
                    receiverRs -> {
                        if(receiverRs.next()){
                            return (new UserDao()).getUserById(receiverRs.getLong("user_id"));
                        }else {
                            return null;
                        }
                    }, conversation.getId(), userId)
                );
                conversation.setCreatedAt(rs.getString("created_at"));
                conversation.setUpdatedAt(rs.getString("updated_at"));
                return conversation;
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }, userId);
    }

    // public List<Message> getMessagesForCurrentUser(Long senderId) {
    //     String sql = "SELECT * FROM messages WHERE (sender_id = ? ) OR (receiver_id = ?)";

    //     return executeQueryList(sql, rs -> {
    //         try {
    //             return new Message(
    //                     rs.getLong("id"),
    //                     rs.getLong("sender_id"),
    //                     rs.getLong("receiver_id"),
    //                     rs.getString("message"),
    //                     rs.getString("created_at"),
    //                     rs.getString("updated_at")
    //             );
    //         } catch (SQLException e) {
    //             throw new RuntimeException(e);
    //         }
    //     }, senderId, senderId);
    // }

    
}
