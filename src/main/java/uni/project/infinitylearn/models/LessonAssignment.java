package uni.project.infinitylearn.models;

import java.util.ArrayList;
import java.util.List;

public class LessonAssignment {
    private Long id;
    private String title;
    private String description;
    private String assignmentUrl;
    private Long lessonId;
    private Long courseId;
    private String createdAt;
    private String updatedAt;
    private List<AssignmentQuestion> questions = new ArrayList<>();
    /**
     * @return Long return the id
     */
    public Long getId() {
        return id;
    }
    public List<AssignmentQuestion> getQuestions() {
        return questions;
    }
    public void setQuestions(List<AssignmentQuestion> questions) {
        this.questions = questions;
    }
    /**
     * 
     * @return Long return courseId
     */
    public Long getCourseId() {
        return courseId;
    }
    /**
     * 
     * @param courseId courseId to set
     */
    public void setCourseId(Long courseId) {
        this.courseId = courseId;
    }

    /**
     * @param id the id to set
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * @return String return the title
     */
    public String getTitle() {
        return title;
    }

    /**
     * @param title the title to set
     */
    public void setTitle(String title) {
        this.title = title;
    }

    /**
     * @return String return the description
     */
    public String getDescription() {
        return description;
    }

    /**
     * @param description the description to set
     */
    public void setDescription(String description) {
        this.description = description;
    }

    /**
     * @return String return the assignmentUrl
     */
    public String getAssignmentUrl() {
        return assignmentUrl;
    }

    /**
     * @param assignmentUrl the assignmentUrl to set
     */
    public void setAssignmentUrl(String assignmentUrl) {
        this.assignmentUrl = assignmentUrl;
    }

    /**
     * @return Long return the lessonId
     */
    public Long getLessonId() {
        return lessonId;
    }

    /**
     * @param lessonId the lessonId to set
     */
    public void setLessonId(Long lessonId) {
        this.lessonId = lessonId;
    }
    /**
     * @return String return the createdAt
     */
    public String getCreatedAt() {
        return createdAt;
    }

    /**
     * @param createdAt the createdAt to set
     */
    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

    /**
     * @return String return the updatedAt
     */
    public String getUpdatedAt() {
        return updatedAt;
    }

    /**
     * @param updatedAt the updatedAt to set
     */
    public void setUpdatedAt(String updatedAt) {
        this.updatedAt = updatedAt;
    }
}
