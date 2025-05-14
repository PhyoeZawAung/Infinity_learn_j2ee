package uni.project.infinitylearn.services;

import uni.project.infinitylearn.dao.UserDao;
import uni.project.infinitylearn.models.User;

public class UserService {

    private UserDao userDao;
    
    public UserService() {
        this.userDao = new UserDao();
    }

    public int registerUser(String firstName, String lastName, String email, String password) throws Exception {
        // Here you would typically save the user to a database
        // For now, just print the user details
        System.out.println("User registered: " + firstName + " " + lastName + ", Email: " + email);

        // Call the DAO to save the user
        return userDao.saveUser(firstName, lastName, email, password);
    }

    public User loginUser(String email, String password) throws Exception {
        User user = userDao.getUserByEmail(email);
        
        if (user == null) {
            throw new Exception("User not found");
        }
        if (!user.getPassword().equals(password)) {
            throw new Exception("Invalid password");
        }
        // Here you would typically set the user session
        // For now, just print the user details

        System.out.println("User logged in: " + email);

        return user;
    }
}
