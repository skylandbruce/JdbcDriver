package db;

import java.sql.Connection;
import java.sql.SQLException;

public interface ConnectInterface {
  public Connection getConnection() throws SQLException ;
  public void returnConnection(Connection conn);
}