package uni.project.infinitylearn.models;

import java.util.ArrayList;
import java.util.List;


public class Course {
	private Long id;
	private String title;
	private String description;
	private String instructor;
	private String category;
	private String banner_image;
	private String price;
	private Boolean is_published;
	private List<Lesson> lessons = new ArrayList<>();
	
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
	public Boolean getIs_published() {
		return is_published;
	}
	public void setIs_published(Boolean is_published) {
		this.is_published = is_published;
	}
	

    /**
     * @return Boolean return the is_published
     */
    public Boolean isIs_published() {
        return is_published;
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

}
