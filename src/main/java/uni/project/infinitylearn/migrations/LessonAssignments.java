package uni.project.infinitylearn.migrations;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

public class LessonAssignments extends Migrator{
    public LessonAssignments(Connection connection) {
        super(connection);
        //TODO Auto-generated constructor stub
    }
    @Override
    public List<String> queries() {

        List<String> queries = new ArrayList<>();

        queries.add("DROP TABLE IF EXISTS lessonAssignment;");

        queries.add("""
                CREATE TABLE lesson_assignment (
                    id BIGINT AUTO_INCREMENT PRIMARY KEY,
                    title VARCHAR(255) NOT NULL,
                    description TEXT,
                    assignment_url VARCHAR(255) NOT NULL,
                    lesson_id BIGINT NOT NULL,
                    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
                );
                """);

        return queries;
    }


}
