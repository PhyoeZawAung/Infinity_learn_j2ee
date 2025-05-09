package uni.project.infinitylearn.migrations;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.ArrayList;

public class Courses extends Migrator {

	public Courses(Connection connection) {
		super(connection);
		// TODO Auto-generated constructor stub
	}

	public List<String> queries() {

		List<String> queries = new ArrayList();

		queries.add("DROP TABLE IF EXISTS course;");

		queries.add("""
				    CREATE TABLE course (
				        id INT AUTO_INCREMENT PRIMARY KEY,
				        title VARCHAR(255) NOT NULL,
				        description TEXT,
				        instructor VARCHAR(100),
				        category VARCHAR(100),
				        price DECIMAL(10, 2) DEFAULT 0.00,
				        is_published BOOLEAN DEFAULT FALSE,
						banner_image VARCHAR(255),
				        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
				        updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
				    );
				""");

		queries.add("""
				INSERT INTO course (title, description, instructor, category, price, is_published)
				VALUES (
					    'Introduction to SQL',
					    'Learn the basics of SQL including SELECT, INSERT, and WHERE.',
					    'Alice Johnson',
					    'Database',
					    19.99,
					    TRUE
					);
					""");

		queries.add("""
				INSERT INTO course (title, description, instructor, category, price, is_published)
				VALUES (
				    'Advanced SQL Queries',
				    'Master complex SQL concepts such as JOINs, subqueries, and window functions.',
				    'Bob Smith',
				    'Database',
				    29.99,
				    TRUE
				);
				""");

		queries.add("""
				INSERT INTO course (title, description, instructor, category, price, is_published)
				VALUES (
				    'SQL for Data Analysis',
				    'Use SQL to clean, filter, and analyze data for business intelligence.',
				    'Clara Evans',
				    'Data Science',
				    39.99,
				    TRUE
				);
				""");

		return queries;

	}
}
