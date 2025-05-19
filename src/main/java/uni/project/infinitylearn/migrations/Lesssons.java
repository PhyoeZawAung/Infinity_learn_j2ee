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

        return queries;
    }

}
