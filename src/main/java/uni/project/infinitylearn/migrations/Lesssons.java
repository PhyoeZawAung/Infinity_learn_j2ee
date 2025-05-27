package uni.project.infinitylearn.migrations;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

public class Lesssons extends Migrator {

    public Lesssons(Connection connection) {
        super(connection);
    }

    @Override
    public List<String> queries() {

        List<String> queries = new ArrayList<>();

        queries.add("DROP TABLE IF EXISTS lessons;");
        queries.add("DROP TABLE IF EXISTS lesson_videos;");

        queries.add("""
                CREATE TABLE IF NOT EXISTS lessons (
                    id BIGINT AUTO_INCREMENT PRIMARY KEY,
                    title VARCHAR(255) NOT NULL,
                    description TEXT,
                    course_id BIGINT NOT NULL,
                    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
                );
                """);
                
        queries.add("""
                CREATE TABLE IF NOT EXISTS lesson_videos (
                    id BIGINT AUTO_INCREMENT PRIMARY KEY,
                    title VARCHAR(255) NOT NULL,
                    description TEXT,
                    video_url VARCHAR(255),
                    thumbnail VARCHAR(255),
                    course_id BIGINT NOT NULL,
                    lesson_id BIGINT NOT NULL,
                    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
                );
                """);

                // Sample lesson insert(s)
    queries.add("""
        INSERT INTO lessons (title, description, course_id) VALUES
        ('Introduction to Java Servlets', 'Overview of Java Servlet technology, lifecycle, and use cases.', 1),
        ('JSP Basics', 'Understanding JavaServer Pages and their role in web applications.', 1);
    """);

    // Sample lesson videos insert(s)
    queries.add("""
        INSERT INTO lesson_videos (title, description, video_url, thumbnail, course_id, lesson_id) VALUES
        ('Servlet Lifecycle Explained', 'Detailed explanation of Servlet lifecycle phases.', '/sample/videos/servlet_lifecycle.mp4', '/sample/thumbnails/servlet_lifecycle.jpg', 1, 1),
        ('JSP Syntax and Directives', 'Basics of JSP syntax and directives usage.', 'https://example.com/videos/jsp_syntax.mp4', 'https://example.com/thumbnails/jsp_syntax.jpg', 1, 2);
    """);

        return queries;
    }

}
