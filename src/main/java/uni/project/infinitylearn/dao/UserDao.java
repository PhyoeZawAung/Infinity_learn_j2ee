package uni.project.infinitylearn.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import uni.project.infinitylearn.models.User;

public class UserDao extends Dao {

    public int saveUser(String firstName, String lastName, String email, String password) throws SQLException {
        String sql = "INSERT INTO users (first_name, last_name, email, password) VALUES (?, ?, ?, ?)";
        return executeUpdate(sql, firstName, lastName, email, password);
    }

    public int saveTeacher(
        String firstName,
        String lastName,
        String email,
        String phone,
        String password,
        String title,
        String expertise,
        String experience,
        String teachingExperience,
        String courseOutline,
        String resumeFile,
        String profilePicFile
    ) throws SQLException {
        // Start transaction
        conn.setAutoCommit(false);
        
        try {
            // First create the user
            String userSql = """
                INSERT INTO users (
                    first_name, last_name, email, password, 
                    phone, profile_image, role
                ) VALUES (?, ?, ?, ?, ?, ?, 'teacher')
            """;
            
            PreparedStatement userStmt = conn.prepareStatement(userSql, PreparedStatement.RETURN_GENERATED_KEYS);
            userStmt.setString(1, firstName);
            userStmt.setString(2, lastName);
            userStmt.setString(3, email);
            userStmt.setString(4, password);
            userStmt.setString(5, phone);
            userStmt.setString(6, profilePicFile);
            
            int userResult = userStmt.executeUpdate();
            
            if (userResult == 0) {
                throw new SQLException("Creating user failed, no rows affected.");
            }
            
            // Get the user ID
            ResultSet generatedKeys = userStmt.getGeneratedKeys();
            if (!generatedKeys.next()) {
                throw new SQLException("Creating user failed, no ID obtained.");
            }
            long userId = generatedKeys.getLong(1);
            
            // Then create the teacher profile
            String profileSql = """
                INSERT INTO teacher_profiles (
                    user_id, title, expertise, experience,
                    teaching_experience, course_outline, resume_file
                ) VALUES (?, ?, ?, ?, ?, ?, ?)
            """;
            
            PreparedStatement profileStmt = conn.prepareStatement(profileSql);
            profileStmt.setLong(1, userId);
            profileStmt.setString(2, title);
            profileStmt.setString(3, expertise);
            profileStmt.setString(4, experience);
            profileStmt.setString(5, teachingExperience);
            profileStmt.setString(6, courseOutline);
            profileStmt.setString(7, resumeFile);
            
            int profileResult = profileStmt.executeUpdate();
            
            if (profileResult == 0) {
                throw new SQLException("Creating teacher profile failed, no rows affected.");
            }
            
            // If we get here, commit the transaction
            conn.commit();
            return 1;
            
        } catch (SQLException e) {
            // Something went wrong, rollback the transaction
            conn.rollback();
            throw e;
        } finally {
            // Reset auto-commit to default state
            conn.setAutoCommit(true);
        }
    }

    public User getUserById(Long userId) throws SQLException {
        String sql = "SELECT * FROM users WHERE id = ?";
        return executeQuery(sql, rs -> {
            User user = new User();
            if (rs.next()) {
                user.setId(rs.getLong("id"));
                user.setFirstName(rs.getString("first_name"));
                user.setLastName(rs.getString("last_name"));
                user.setEmail(rs.getString("email"));
                // user.setPassword(rs.getString("password"));
                user.setRole(rs.getString("role"));
                return user;
            }
            return null;
        }, userId);
    }
    public User getUserByEmail(String email) throws SQLException {
        String sql = "SELECT * FROM users WHERE email = ?";
        return executeQuery(sql, rs -> {
            User user = new User();
            if (rs.next()) {
                user.setId(rs.getLong("id"));
                user.setFirstName(rs.getString("first_name"));
                user.setLastName(rs.getString("last_name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setRole(rs.getString("role"));
                return user;
            }
            return null;
        }, email);
    }

    public List<User> getAllUsers() {
        String sql = "SELECT * FROM users";
        return executeQuery(sql, rs -> {
            List<User> users = new ArrayList<>();
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getLong("id"));
                user.setFirstName(rs.getString("first_name"));
                user.setLastName(rs.getString("last_name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setRole(rs.getString("role"));
                users.add(user);
            }
            return users;
        });
    }

    public List<User> getAllUsersExceptCurrentUser(Long userId) {
        String sql = "SELECT * FROM users WHERE id != ?";
        return executeQuery(sql, rs -> {
            List<User> users = new ArrayList<>();
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getLong("id"));
                user.setFirstName(rs.getString("first_name"));
                user.setLastName(rs.getString("last_name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setRole(rs.getString("role"));
                users.add(user);
            }
            return users;
        }, userId);
    }
}
