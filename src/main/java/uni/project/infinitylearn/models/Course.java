package uni.project.infinitylearn.models;

import java.util.ArrayList;
import java.util.List;


public class Course {
	private Long id;
	private String title;
	private String shortDescription;
	private String description;
	private String instructor;
	private String category;
	private String banner_image;
	private String price;
	private String courseStatus;
	private String rejectionReason;
	private List<Lesson> lessons = new ArrayList<>();
	private int progress;

	public String getBanner_image() {
		return banner_image;
	}
	public void setBanner_image(String banner_image) {
		this.banner_image = banner_image;
	}
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getInstructor() {
		return instructor;
	}
	public void setInstructor(String instructor) {
		this.instructor = instructor;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getCourseStatus() {
		return courseStatus;
	}
	public void setCourseStatus(String courseStatus) {
		this.courseStatus = courseStatus;
	}
	public String getRejectionReason() {
		return rejectionReason;
	}
	public void setRejectionReason(String rejectionReason) {
		this.rejectionReason = rejectionReason;
	}
	

    /**
     * @return List<Lesson> return the lessons
     */
    public List<Lesson> getLessons() {
        return lessons;
    }

    /**
     * @param lessons the lessons to set
     */
    public void setLessons(List<Lesson> lessons) {
        this.lessons = lessons;
    }


    /**
     * @return String return the short_description
     */
    public String getShortDescription() {
        return shortDescription;
    }

    /**
     * @param short_description the short_description to set
     */
    public void setShortDescription(String shortDescription) {
        this.shortDescription = shortDescription;
    }


    /**
     * @return int return the progress
     */
    public int getProgress() {
        return progress;
    }

    /**
     * @param progress the progress to set
     */
    public void setProgress(int progress) {
        this.progress = progress;
    }

}
