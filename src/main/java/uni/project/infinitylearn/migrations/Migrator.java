package uni.project.infinitylearn.migrations;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

public abstract class Migrator {
	
	public Connection connection;
	
	public List<String> queries;
	
	
	public Migrator(Connection connection) {

		this.connection = connection;
		
	}
	
	public void execute() {
		try {
			
			queries = this.queries();
			
			if(queries.isEmpty()) {
				throw new SQLException("Please insert query");
			}
			
			Statement statement = connection.createStatement();
			
			for(String query : queries) {
				statement.execute(query);
			}

			System.out.println("'course' table created successfully.");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public abstract List<String> queries();
}
