package uni.project.infinitylearn.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;

public interface DaoInterface {
    Connection getConnection()throws Exception;
    PreparedStatement prepareStatement(String sql)throws Exception;
    void closeStatement(PreparedStatement statement) throws Exception;
    int executeUpdate(String query, Object... params)throws Exception;
    <T> T executeQuery(String query, ResultSetHandler<T> handler, Object... params)throws Exception;
    <T> List<T> executeQueryList(String query, ResultSetHandler<T> handler, Object... params)throws Exception;
}
