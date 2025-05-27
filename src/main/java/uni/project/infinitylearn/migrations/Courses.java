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
				    CREATE TABLE IF NOT EXISTS course (
				        id BIGINT AUTO_INCREMENT PRIMARY KEY,
				        title VARCHAR(255) NOT NULL,
						short_description TEXT,
				        description MEDIUMTEXT,
				        instructor VARCHAR(100),
				        category VARCHAR(100),
				        price DECIMAL(10, 2) DEFAULT 0.00,
                        course_status ENUM('published', 'draft', 'under_review') DEFAULT 'draft',
                        rejection_reason TEXT,
						banner_image VARCHAR(255),
				        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
				        updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
				    );
				""");
queries.add("""
INSERT INTO course (title, short_description, description, instructor, category, price, course_status)
VALUES (
    'Mastering Java Web Development',
    'Learn Java Servlets, JSP, and web application architecture in depth.',
    '<h2>Course Overview</h2><p>Welcome to <strong>Mastering Java Web Development</strong>, a comprehensive and hands-on course designed for aspiring backend developers who want to build powerful, secure, and scalable web applications using Java EE technologies. This course is perfect for students and professionals who want to move beyond the basics and master enterprise-level development skills.</p><p>Throughout this course, we will start with the fundamentals of the Java Servlet API and gradually move into advanced topics such as JSP (JavaServer Pages), JSTL, Filters, Listeners, and full-stack integration using MVC architecture. We’ll explore key design patterns and best practices that are commonly used in real-world Java web applications.</p><ul><li>How to set up a dynamic web project using Apache Tomcat and Maven</li><li>Session management using cookies and HttpSession</li><li>Creating reusable JSP components and integrating JSTL</li><li>Using JDBC for database interaction</li></ul><p>Each module includes coding exercises, project scenarios, and downloadable resources. You will have access to the full source code of a complete Java web application, which you can use as a reference or starting point. By the end of the course, you will be ready to build and deploy full-scale Java web apps.</p>',
    '3',
    'Web Development',
    39.99,
    'published'
);
""");

queries.add("""
INSERT INTO course (title, short_description, description, instructor, category, price, course_status)
VALUES (
    'Advanced SQL Queries',
    'Master complex SQL techniques like subqueries and window functions.',
    '<h2>Course Overview</h2><p>This course dives deep into advanced SQL topics for serious data professionals. If you''ve already mastered basic SELECT statements, it''s time to learn how to write complex joins, recursive queries, CTEs, window functions, and advanced filtering logic.</p><p>You’ll build hands-on projects that simulate real-life data analysis scenarios involving multiple tables and nested queries. Topics include:</p><ul><li>INNER, OUTER, LEFT, RIGHT, and CROSS JOINS</li><li>CTEs and recursive queries</li><li>Window functions like RANK(), ROW_NUMBER(), LAG(), LEAD()</li><li>Subqueries in SELECT, WHERE, and FROM</li><li>Advanced filtering and grouping</li></ul><p>Whether you''re a backend engineer or data analyst, these skills will help you write faster, cleaner, and more powerful SQL code in professional settings.</p>',
    'Bob Smith',
    'Database',
    29.99,
    'published'
);
""");

queries.add("""
INSERT INTO course (title, short_description, description, instructor, category, price, course_status)
VALUES (
    'Spring Boot REST API Masterclass',
    'Learn to build real-world REST APIs with Spring Boot.',
    '<h2>Course Overview</h2><p>This course guides you through the process of building secure, maintainable, and scalable RESTful APIs using Spring Boot. You will learn by doing, with real-world projects and RESTful principles at the center of every lesson.</p><ul><li>RESTful architecture and best practices</li><li>Spring Boot setup and project structure</li><li>Dependency Injection and Spring MVC</li><li>Exception handling, validation, and security with JWT</li><li>Testing with JUnit and MockMvc</li></ul><p>By the end, you’ll have built several APIs including user authentication, product management, and file uploads — all deployable to production environments.</p>',
    'Daniel Kim',
    'Backend',
    49.99,
    'published'
);
""");

queries.add("""
INSERT INTO course (title, short_description, description, instructor, category, price, course_status)
VALUES (
    'Fullstack JavaScript Developer',
    'Become a fullstack JS dev using Node.js, Express, and MongoDB.',
    '<p>This comprehensive course teaches you how to develop fullstack applications using JavaScript from frontend to backend. You''ll build REST APIs with Express and connect them with MongoDB. On the frontend, you''ll use modern JavaScript with fetch, form handling, and client-side validation. By the end of the course, you will be able to deploy a full-featured MERN-style application with user authentication and CRUD operations.</p><ul><li>Express.js and routing</li><li>MongoDB queries and schema design</li><li>JWT-based authentication</li><li>Frontend logic and AJAX</li><li>Project deployment to cloud platforms</li></ul>',
    'Frank Lee',
    'Fullstack',
    44.99,
    'published'
);
""");

queries.add("""
INSERT INTO course (title, short_description, description, instructor, category, price, course_status)
VALUES (
    'Python for Beginners',
    'Learn Python programming from scratch with real examples.',
    '<p>This course introduces you to Python programming in a simple and practical way. You’ll learn Python syntax, variables, conditionals, loops, functions, and basic object-oriented programming through interactive exercises and mini-projects.</p><p>Topics include:</p><ul><li>Python data types and control flow</li><li>Functions and modules</li><li>Working wFh files and exceptions</li><li>Intro to OOP with classes</li><li>Mini projects: calculator, text-based game, CSV parser</li></ul><p>By the end, you’ll have a solid foundation to explore data science, web development, or automation with Python.</p>',
    'Grace Park',
    'Programming',
    0.00,
    'published'
);
""");

queries.add("""
INSERT INTO course (title, short_description, description, instructor, category, price, course_status)
VALUES (
    'HTML & CSS Essentials',
    'Design and build modern web pages with HTML5 and CSS3.',
    '<p>This course is your first step toward becoming a web developer. You’ll learn how to build responsive, semantic, and accessible websites using HTML and CSS. Through hands-on labs, you’ll build layouts, apply styles, and understand how the browser renders your content.</p><ul><li>HTML5 structure and tags</li><li>CSS selectors and properties</li><li>Flexbox and Grid layout</li><li>Media queries for responsive design</li><li>Project: personal portfolio website</li></ul>',
    'Ella Rose',
    'Frontend',
    19.99,
    'published'
);
""");

queries.add("""
INSERT INTO course (title, short_description, description, instructor, category, price, course_status)
VALUES (
    'Git & GitHub for Teams',
    'Master version control workflows and collaboration with Git.',
    '<p>Git is the backbone of collaborative software development. This course teaches Git fundamentals and advanced techniques for working in teams. You’ll learn to use GitHub for issues, pull requests, and collaborative workflows like Git Flow.</p><ul><li>Git basics: init, clone, add, commit</li><li>Branching and merging</li><li>Conflict resolution</li><li>Working with GitHub remotes</li><li>CI/CD intro and GitHub Actions overview</li></ul>',
    'Isabel Martinez',
    'Tools',
    14.99,
    'published'
);
""");

queries.add("""
INSERT INTO course (title, short_description, description, instructor, category, price, course_status)
VALUES (
    'Docker for Java Developers',
    'Containerize and deploy Java applications using Docker.',
    '<p>This course helps Java developers adopt Docker to streamline development, testing, and deployment. You will learn to write Dockerfiles, build images, and run containers for Spring Boot and servlet-based Java apps. Advanced sections cover Docker Compose and deploying to cloud-based container registries.</p><ul><li>Understanding Docker architecture</li><li>Writing Dockerfiles for Java apps</li><li>Exposing ports and managing volumes</li><li>Docker Compose for multi-container apps</li><li>Best practices and debugging tools</li></ul>',
    'Jack Wu',
    'DevOps',
    34.99,
    'published'
);
""");

queries.add("""
INSERT INTO course (title, short_description, description, instructor, category, price, course_status)
VALUES (
    'Responsive Design with Tailwind CSS',
    'Build sleek, responsive websites using Tailwind utility classes.',
    '<p>This course is your practical guide to using Tailwind CSS, a utility-first framework, to design responsive, modern, and accessible interfaces without writing custom CSS. You''ll build several responsive pages with components like navbars, cards, modals, and grid layouts.</p><ul><li>Tailwind fundamentals and classes</li><li>Responsive design utilities</li><li>Dark mode and theme customization</li><li>Deploying styled projects to Netlify</li><li>Tailwind with Alpine.js and components</li></ul>',
    'Henry Adams',
    'Frontend',
    27.99,
    'published'
);
""");

queries.add("""
INSERT INTO course (title, short_description, description, instructor, category, price, course_status)
VALUES (
    'Data Structures in Java',
    'Understand core data structures with Java implementation.',
    '<p>This course teaches essential data structures using Java. You’ll go from basic arrays and linked lists to advanced trees and hash maps. Each section includes diagrams, dry-run examples, and live coding demos.</p><ul><li>Arrays, lists, and stacks</li><li>Queues and priority queues</li><li>Binary trees and binary search trees</li><li>Hash tables and sets</li><li>Time complexity analysis</li></ul>',
    'Carol White',
    'Programming',
    22.49,
    'published'
);
""");


		return queries;

	}
}
