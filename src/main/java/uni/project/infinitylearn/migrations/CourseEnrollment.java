package uni.project.infinitylearn.migrations;

import java.sql.Connection;
import java.util.List;

public class CourseEnrollment extends Migrator {
    
    public CourseEnrollment(Connection connection) {
        super(connection);
        //TODO Auto-generated constructor stub
    }

    public List<String> queries() {
        return List.of(
            "DROP TABLE IF EXISTS course_enrollment;",
            """
            CREATE TABLE course_enrollment (
                id BIGINT AUTO_INCREMENT PRIMARY KEY,
                user_id BIGINT NOT NULL,
                course_id BIGINT NOT NULL,
                progress INT DEFAULT 0,
                status ENUM('enrolled', 'completed', 'dropped') DEFAULT 'enrolled',
                created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
            );
            """,
        """
        INSERT INTO course_enrollment (user_id, course_id, progress, status) VALUES
        (1, 1, 20, 'enrolled'),
        (2, 1, 100, 'completed'),
        (1, 2, 0, 'enrolled');
        """
        );
    }
}
