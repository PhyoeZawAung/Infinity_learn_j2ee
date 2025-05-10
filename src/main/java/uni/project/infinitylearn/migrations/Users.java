package uni.project.infinitylearn.migrations;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

public class Users extends Migrator {
    
    public Users(Connection connection) {
        super(connection);
    }

    public List<String> queries()
    {
        List<String> queries = new ArrayList<>();

        queries.add("DROP TABLE IF EXISTS users");

        queries.add("""
                    CREATE TABLE users (
                        id BIGINT AUTO_INCREMENT PRIMARY KEY,
                        first_name VARCHAR(255) NOT NULL,
                        last_name VARCHAR(255) NOT NULL,
                        email VARCHAR(255) NOT NULL UNIQUE,
                        password VARCHAR(255) NOT NULL,
                        profile_image VARCHAR(255),
                        role ENUM('admin', 'student', 'teacher', 'reviewer') DEFAULT 'student',
                        description TEXT
                    );
                """);

            // four user for each role
        queries.add("""
                    INSERT INTO users (first_name, last_name, email, password, profile_image, role, description)
                    VALUES
                        ('Admin', 'Admin', 'admin@gmail.com', 'admin', 'admin.png', 'admin', 'Admin user'),
                        ('Student', 'Student', 'student@gmail.comn', 'student', 'student.png', 'student', 'Student'),
                        ('Teacher', 'Teacher', 'teacher@gmail.com', 'teacher', 'teacher.png', 'teacher', 'Teacher'),
                        ('Reviewer', 'Reviewer', 'reviewer@gmail.com', 'reviewer', 'reviewer.png', 'reviewer', 'Reviewer');
                """);
        return queries;
    }
}
