package uni.project.infinitylearn.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseUtil {
	
	
	private String dbName;
	private String dbUser;
	private String dbPassword;
	
	public DatabaseUtil(String dbName, String dbUser, String dbPassword) throws ClassNotFoundException{
		this.dbName = dbName;
		this.dbUser = dbUser;
		this.dbPassword = dbPassword;
		Class.forName("com.mysql.cj.jdbc.Driver");
	}
	
	public Connection getConnection() throws SQLException {
		
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + dbName + "?createDatabaseIfNotExist=true", dbUser, dbPassword);
		
		System.out.println("database connection created");
		
		return connection;
		
	}
}
