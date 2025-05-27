package uni.project.infinitylearn.models;

import java.util.ArrayList;
import java.util.List;

public class Lesson {
    private Long id;
    private String title;
    private String description;
    private Long courseId;
    private String createdAt;
    private String updatedAt;
    private List<LessonVideo> lessonVideos = new ArrayList<>();
    private List<LessonAssignment> assignments = new ArrayList<>();
    private int totalVideos;
    private int completedVideos;
    private int progressPercent;

    /**
     * @return Long return the id
     */
    public Long getId() {
        return id;
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
     * @return Long return the courseId
     */
    public Long getCourseId() {
        return courseId;
    }

    /**
     * @param courseId the courseId to set
     */
    public void setCourseId(Long courseId) {
        this.courseId = courseId;
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

    /**
     * @return List<LessonAssignment> return the assignments
     */
    public List<LessonAssignment> getAssignments() {
        return assignments;
    }

    /**
     * @param assignments the assignments to set
     */
    public void setAssignments(List<LessonAssignment> assignments) {
        this.assignments = assignments;
    }

    /**
     * @return List<LessonVideo> return the lessonVideos
     */
    public List<LessonVideo> getLessonVideos() {
        return lessonVideos;
    }

    /**
     * @param lessonVideos the lessonVideos to set
     */
    public void setLessonVideos(List<LessonVideo> lessonVideos) {
        this.lessonVideos = lessonVideos;
    }

    public int getTotalVideos() {
        return totalVideos;
    }

    public void setTotalVideos(int totalVideos) {
        this.totalVideos = totalVideos;
    }

    public int getCompletedVideos() {
        return completedVideos;
    }

    public void setCompletedVideos(int completedVideos) {
        this.completedVideos = completedVideos;
    }

    public int getProgressPercent() {
        return progressPercent;
    }

    public void setProgressPercent(int progressPercent) {
        this.progressPercent = progressPercent;
    }

}
