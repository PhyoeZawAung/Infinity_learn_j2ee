package uni.project.infinitylearn.listeners;

import javax.servlet.ServletContextEvent;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import uni.project.infinitylearn.utils.DatabaseUtil;

import uni.project.infinitylearn.migrations.*;

/**
 * Application Lifecycle Listener implementation class MyContextListener
 *
 */
@WebListener
public class MyContextListener implements ServletContextListener {
	
	private static Connection dbConnection;
	private DatabaseUtil databaseUtil;

    /**
     * Default constructor. 
     */
    public MyContextListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent sce)  { 
         // TODO Auto-generated method stub
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent sce)  { 
    	String dbName = sce.getServletContext().getInitParameter("dbName");
    	String dbUser = sce.getServletContext().getInitParameter("dbUser");
    	String dbPassword = sce.getServletContext().getInitParameter("dbPassword");
    	
    	try {
			databaseUtil = new DatabaseUtil(dbName, dbUser, dbPassword);
			
			dbConnection = databaseUtil.getConnection();
			
			Migrator courseMigrator = new Courses(this.dbConnection);
			Migrator lessonMigrator = new Lesssons(this.dbConnection);
			
			// courseMigrator.execute();
			// lessonMigrator.execute();

			sce.getServletContext().setAttribute("dbConnection", dbConnection);
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
         // TODO Auto-generated method stub
    	System.out.println("Context initialized");
    }
    
    public static Connection getConnection() {
    	return dbConnection;
    }
	
}
