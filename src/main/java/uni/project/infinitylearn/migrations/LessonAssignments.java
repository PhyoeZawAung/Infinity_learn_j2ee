package uni.project.infinitylearn.migrations;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

public class LessonAssignments extends Migrator {
    public LessonAssignments(Connection connection) {
        super(connection);
        // TODO Auto-generated constructor stub
    }

    @Override
    public List<String> queries() {

        List<String> queries = new ArrayList<>();
        queries.add("DROP TABLE IF EXISTS lesson_assignment;");
        queries.add("DROP TABLE IF EXISTS assignment_question;");
        queries.add("""
                CREATE TABLE IF NOT EXISTS lesson_assignment (
                    id BIGINT AUTO_INCREMENT PRIMARY KEY,
                    title VARCHAR(255) NOT NULL,
                    description TEXT,
                    assignment_url VARCHAR(255) NOT NULL,
                    lesson_id BIGINT NOT NULL,
                    course_id BIGINT NOT NULL,
                    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
                );
                """);
        queries.add("""
                 CREATE TABLE IF NOT EXISTS assignment_question (
                    id BIGINT AUTO_INCREMENT PRIMARY KEY,
                    assignment_id BIGINT NOT NULL,
                    question TEXT NOT NULL,
                    options TEXT, -- JSON string like '["A", "B", "C", "D"]'
                    correct_answer TEXT,
                    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
                );
                """);

        return queries;
    }

}
