package uni.project.infinitylearn.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import uni.project.infinitylearn.models.User;

public class UserDao extends Dao {

    public int saveUser(String firstName, String lastName, String email, String password) throws SQLException {
        String sql = "INSERT INTO users (first_name, last_name, email, password) VALUES (?, ?, ?, ?)";
        return executeUpdate(sql, firstName, lastName, email, password);
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
