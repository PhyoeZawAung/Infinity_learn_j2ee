package uni.project.infinitylearn.dao;

import java.sql.SQLException;

import uni.project.infinitylearn.models.User;

public class UserDao extends Dao {

    public int saveUser(String firstName, String lastName, String email, String password) throws SQLException {
        String sql = "INSERT INTO users (first_name, last_name, email, password) VALUES (?, ?, ?, ?)";
        return executeUpdate(sql, firstName, lastName, email, password);
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
}
