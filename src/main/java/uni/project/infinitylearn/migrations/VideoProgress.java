package uni.project.infinitylearn.migrations;

import java.sql.Connection;
import java.util.List;

public class VideoProgress extends Migrator {
    public VideoProgress(Connection connection) {
        super(connection);
        // TODO Auto-generated constructor stub
    }

    public List<String> queries() {
        return List.of(
            "DROP TABLE IF EXISTS video_progress",
            """
                CREATE TABLE IF NOT EXISTS video_progress (
                    id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                    user_id BIGINT NOT NULL,
                    course_id BIGINT NOT NULL,
                    lesson_id BIGINT NOT NULL,
                    video_id BIGINT NOT NULL,
                    progress INT NOT NULL DEFAULT 0,
                    is_completed BOOLEAN DEFAULT FALSE );
                    """);

    }

}
