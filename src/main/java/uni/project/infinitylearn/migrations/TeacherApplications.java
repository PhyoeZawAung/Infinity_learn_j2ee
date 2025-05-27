package uni.project.infinitylearn.migrations;

import java.sql.Connection;
import java.util.List;
import java.util.ArrayList;

public class TeacherApplications extends Migrator {

    public TeacherApplications(Connection connection) {
        super(connection);
    }

    @Override
    public List<String> queries() {
        List<String> queries = new ArrayList<>();

        queries.add("DROP TABLE IF EXISTS teacher_applications;");

        queries.add("""
            CREATE TABLE teacher_applications (
                id INT AUTO_INCREMENT PRIMARY KEY,
                first_name VARCHAR(100) NOT NULL,
                last_name VARCHAR(100) NOT NULL,
                email VARCHAR(150) NOT NULL,
                phone VARCHAR(50) NOT NULL,
                password VARCHAR(255) NOT NULL,
                title VARCHAR(150) NOT NULL,
                expertise VARCHAR(255) NOT NULL,
                experience TEXT,
                teaching_experience TEXT,
                course_outline TEXT,
                resume_file VARCHAR(255),
                profile_pic_file VARCHAR(255),
                status ENUM('pending', 'approved', 'rejected') DEFAULT 'pending',
                submitted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
            );
        """);

        return queries;
    }
}
