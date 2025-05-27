package uni.project.infinitylearn.migrations;

import java.sql.Connection;
import java.util.List;

public class Chat extends Migrator{

    public Chat(Connection connection) {
        super(connection);
        //TODO Auto-generated constructor stub
    }

    @Override
    public List<String> queries() {
        return List.of(
            "drop table if exists conversations",
            """
                create table conversations(
                    id bigint auto_increment primary key,
                    title text not null,
                    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
                )   
                    """,
            "drop table if exists conversation_users",
            """
                    create table conversation_users (
                        id bigint auto_increment primary key,
                        conversation_id bigint not null,
                        user_id bigint not null, 
                        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                        updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
                    )
                    """,
            "DROP TABLE IF EXISTS messages;",
            """
            CREATE TABLE messages (
                id BIGINT AUTO_INCREMENT PRIMARY KEY,
                sender_id BIGINT NOT NULL,
                conversation_id BIGINT NOT NULL,
                message TEXT NOT NULL,
                is_read BOOLEAN DEFAULT FALSE,
                created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
            );
            """
        );
    }
    
}
