package uni.project.infinitylearn.models;

public class TeacherDetails {
    private Long id;
    private Long userId;
    private String professionalTitle;
    private Long yearOfExperience;
    private String areaOfExpertise;
    private String biography;
    private String createdAt;
    private String updatedAt;
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
    public Long getUserId() {
        return userId;
    }
    public void setUserId(Long userId) {
        this.userId = userId;
    }
    public String getProfessionalTitle() {
        return professionalTitle;
    }
    public void setProfessionalTitle(String professionalTitle) {
        this.professionalTitle = professionalTitle;
    }
    public Long getYearOfExperience() {
        return yearOfExperience;
    }
    public void setYearOfExperience(Long yearOfExperience) {
        this.yearOfExperience = yearOfExperience;
    }
    public String getAreaOfExpertise() {
        return areaOfExpertise;
    }
    public void setAreaOfExpertise(String areaOfExpertise) {
        this.areaOfExpertise = areaOfExpertise;
    }
    public String getBiography() {
        return biography;
    }
    public void setBiography(String biography) {
        this.biography = biography;
    }
    public String getCreatedAt() {
        return createdAt;
    }
    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }
    public String getUpdatedAt() {
        return updatedAt;
    }
    public void setUpdatedAt(String updatedAt) {
        this.updatedAt = updatedAt;
    }
}
