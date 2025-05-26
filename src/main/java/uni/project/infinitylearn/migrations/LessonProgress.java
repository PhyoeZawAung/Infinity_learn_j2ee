package uni.project.infinitylearn.migrations;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class LessonProgress extends Migrator {

    public LessonProgress(Connection connection) {
        super(connection);
    }

    public List<String> queries() {
        List<String> queries = new ArrayList<>();

        queries.add("DROP TABLE IF EXISTS lesson_progress;");

        queries.add("""
            CREATE TABLE lesson_progress (
                id INT AUTO_INCREMENT PRIMARY KEY,
                user_id INT NOT NULL,
                course_id INT NOT NULL,
                lesson_id INT NOT NULL,
                progress_percent INT DEFAULT 0,
                last_accessed TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
                CONSTRAINT fk_course FOREIGN KEY (course_id) REFERENCES course(id) ON DELETE CASCADE,
                CONSTRAINT fk_lesson FOREIGN KEY (lesson_id) REFERENCES lesson(id) ON DELETE CASCADE
            );
        """);

        return queries;
    }
}
