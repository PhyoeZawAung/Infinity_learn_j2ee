package uni.project.infinitylearn.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import uni.project.infinitylearn.listeners.MyContextListener;

public class Dao implements DaoInterface {
    // This is a base class for all DAOs
    // You can add common methods or properties here if needed

    // You can also consider using an interface if you want to enforce a contract
    // for all DAOs

    // get the connection from the context listener
    protected Connection conn;

    public Dao() {
        this.conn = MyContextListener.getConnection();
    }

    public Connection getConnection() {
        return conn;
    }

    public int executeUpdate(String sql, Object... params) throws SQLException {
        PreparedStatement statement = prepareStatement(sql);
        setParameters(statement, params);
        int result = statement.executeUpdate();
        closeStatement(statement);
        return result;
    }

    public <T> T executeQuery(String sql, ResultSetHandler<T> handler, Object... params) {
        PreparedStatement statement = null;
        try {
            statement = prepareStatement(sql);
            setParameters(statement, params);
            ResultSet rs = statement.executeQuery();
            T result = handler.handle(rs);
            return result;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            try {
                closeStatement(statement);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

    }

    public <T> List<T> executeQueryList(String sql, ResultSetHandler<T> handler, Object... params) {
        List<T> result = new ArrayList<>();
        PreparedStatement statement = null;
        try {
            statement = prepareStatement(sql);
            setParameters(statement, params);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                result.add(handler.handle(rs));
            }
            return result;
        }catch (SQLException e) {
            e.printStackTrace();
            return result;
        } finally {
            try {
                closeStatement(statement);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

       
    }

    protected void setParameters(PreparedStatement statement, Object... params) throws SQLException {
        for (int i = 0; i < params.length; i++) {
            statement.setObject(i + 1, params[i]);
        }
    }

    public PreparedStatement prepareStatement(String sql) throws SQLException {
        return conn.prepareStatement(sql);
    }

    public void closeStatement(PreparedStatement statement) throws SQLException {
        if (statement != null && !statement.isClosed()) {
            statement.close();
        }
    }

    public void closeConnection() throws SQLException {
        if (conn != null && !conn.isClosed()) {
            conn.close();
        }
    }
}
