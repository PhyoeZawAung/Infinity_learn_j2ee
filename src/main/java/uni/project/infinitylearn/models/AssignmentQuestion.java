package uni.project.infinitylearn.models;

public class AssignmentQuestion {
    private long id;
    private long assignment_id;
    private String question_text;
    private String option;
    private String correct_answer;
    private String created_at;
    private String updated_at;
    /**
     * 
     * @return return long id
     */
    public long getId() {
        return id;
    }
    /**
     * 
     * @param id id to set
     */
    public void setId(long id) {
        this.id = id;
    }
    /**
     * 
     * @return retung long assignment_id
     */
    public long getAssignment_id() {
        return assignment_id;
    }
    /**
     * 
     * @param assignment_id assignment_id to set
     */
    public void setAssignment_id(long assignment_id) {
        this.assignment_id = assignment_id;
    }
    /**
     * 
     * @return return String question _text
     */
    public String getQuestion_text() {
        return question_text;
    }
    /**
     * 
     * @param question_text question_text to set 
     */
    public void setQuestion_text(String question_text) {
        this.question_text = question_text;
    }
    /**
     * 
     * @return return String option
     */
    public String getOption() {
        return option;
    }
    /**
     * 
     * @param option option to set
     */
    public void setOption(String option) {
        this.option = option;
    }
    /**
     * 
     * @return return String correct_answer
     */
    public String getCorrect_answer() {
        return correct_answer;
    }
    /**
     * 
     * @param correct_answer correct_answer to set 
     */
    public void setCorrect_answer(String correct_answer) {
        this.correct_answer = correct_answer;
    }
    /**
     * 
     * @return return String created_at
     */
    public String getCreated_at() {
        return created_at;
    }
    /**
     * 
     * @param created_at create_at to set
     */
    public void setCreated_at(String created_at) {
        this.created_at = created_at;
    }
    /**
     * 
     * @return to return String Update_at
     */
    public String getUpdated_at() {
        return updated_at;
    }
    /**
     * 
     * @param updated_at update_at to set
     */
    public void setUpdated_at(String updated_at) {
        this.updated_at = updated_at;
    }
}
