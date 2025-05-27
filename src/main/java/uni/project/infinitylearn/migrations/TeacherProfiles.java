package uni.project.infinitylearn.migrations;

import java.sql.Connection;
import java.util.List;
import java.util.ArrayList;

public class TeacherProfiles extends Migrator {

    public TeacherProfiles(Connection connection) {
        super(connection);
    }

    @Override
    public List<String> queries() {
        List<String> queries = new ArrayList<>();

        queries.add("DROP TABLE IF EXISTS teacher_profiles;");

        queries.add("""
            CREATE TABLE teacher_profiles (
                id BIGINT AUTO_INCREMENT PRIMARY KEY,
                user_id BIGINT NOT NULL UNIQUE,
                title VARCHAR(150) NOT NULL,
                expertise VARCHAR(255) NOT NULL,
                experience TEXT,
                teaching_experience TEXT,
                course_outline TEXT,
                resume_file VARCHAR(255),
                created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
            );
        """);

        return queries;
    }
} 