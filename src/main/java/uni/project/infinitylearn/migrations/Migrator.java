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
			
			String tableName = queries.get(0).split(" ")[4];

			System.out.println("");
			System.out.println("#############  "  + tableName + "  #############");

			System.out.println("Executing migration for table: " + tableName);

			for(String query : queries) {
				System.out.println(query);
				// Execute the query
				statement.execute(query);
			}

			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public abstract List<String> queries();
}
