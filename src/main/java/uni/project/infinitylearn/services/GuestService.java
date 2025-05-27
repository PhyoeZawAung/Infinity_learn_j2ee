package uni.project.infinitylearn.services;

import uni.project.infinitylearn.dao.GuestDao;

public class GuestService {

    private GuestDao guestDao;

    public GuestService() {
        guestDao = new GuestDao();
    }

    // You can later connect this to a database or repository
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
            String profilePicFileName
    ) {
        // Pass all data to GuestDao for persistence
        guestDao.saveTeacherApplication(
            firstName, lastName, email, phone, password,
            title, expertise, experience,
            teachingExperience, courseOutline,
            resumeFileName, profilePicFileName
        );
    }
}