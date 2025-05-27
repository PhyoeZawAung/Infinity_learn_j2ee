package uni.project.infinitylearn.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import uni.project.infinitylearn.models.TeacherApplication;

public class GuestDao extends Dao {
    public GuestDao() {
        super();
    }

    public void saveTeacherApplication(
            String firstName,
            String lastName,
            String email,
            String phone,
            String password,
            String title,
            String[] expertise,
            String experience,
            String teachingExperience,
            String courseOutline,
            String resumeFileName,
            String profilePicFileName) {
        String sql = "INSERT INTO teacher_applications " +
                "(first_name, last_name, email, phone, password, title, expertise, experience, teaching_experience, course_outline, resume_file, profile_pic_file) "
                +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            Object[] params = {
                    firstName,
                    lastName,
                    email,
                    phone,
                    password,
                    title,
                    String.join(",", expertise),
                    experience,
                    teachingExperience,
                    courseOutline,
                    resumeFileName,
                    profilePicFileName
            };
            int rows = executeUpdate(sql, params);
            System.out.println("Rows inserted: " + rows);
        } catch (SQLException e) {
            e.printStackTrace();
            // You can add logging or throw a custom exception here
        }
    }

    // Add this method to GuestDao
    public List<TeacherApplication> getAllTeacherApplications() {
        List<TeacherApplication> list = new ArrayList<>();
        String sql = "SELECT * FROM teacher_applications ORDER BY submitted_at DESC";
        try (PreparedStatement stmt = getConnection().prepareStatement(sql);
                ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                TeacherApplication app = mapTeacherApplication(rs);
                list.add(app);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public TeacherApplication getTeacherApplicationById(int id) {
        String sql = "SELECT * FROM teacher_applications WHERE id = ?";
        try (PreparedStatement stmt = getConnection().prepareStatement(sql)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return mapTeacherApplication(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public int updateTeacherApplicationStatus(int id, String status) throws SQLException {
        String sql = "UPDATE teacher_applications SET status = ? WHERE id = ?";
        return executeUpdate(sql, status, id);
    }

    public int deleteTeacherApplication(int id) throws SQLException {
        String sql = "DELETE FROM teacher_applications WHERE id = ?";
        return executeUpdate(sql, id);
    }

    private TeacherApplication mapTeacherApplication(ResultSet rs) throws SQLException {
        TeacherApplication app = new TeacherApplication();
        app.setId(rs.getInt("id"));
        app.setFirstName(rs.getString("first_name"));
        app.setLastName(rs.getString("last_name"));
        app.setEmail(rs.getString("email"));
        app.setPhone(rs.getString("phone"));
        app.setPassword(rs.getString("password"));
        app.setTitle(rs.getString("title"));
        app.setExpertise(rs.getString("expertise"));
        app.setExperience(rs.getString("experience"));
        app.setTeachingExperience(rs.getString("teaching_experience"));
        app.setCourseOutline(rs.getString("course_outline"));
        app.setSubmittedAt(rs.getTimestamp("submitted_at"));
        app.setResumeFile(rs.getString("resume_file"));
        String resumeFileName = rs.getString("resume_file");
        String resumeUrl = "resume-view?file=" + resumeFileName;
        app.setResumeFileUrl(resumeUrl);
        app.setProfilePicFile(rs.getString("profile_pic_file"));
        return app;
    }
}
