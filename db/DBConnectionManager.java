package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import templete.JdbcGlobal;

public class DBConnectionManager implements ConnectInterface {
  JdbcGlobal jdbc;
  public DBConnectionManager(JdbcGlobal jdbc) {
    this.jdbc=jdbc;
    try {
      Class.forName(jdbc.get_driver());
    }
    catch (ClassNotFoundException e) {
      System.err.println("Fail to Load Driver");
      System.out.println(e.getMessage());
    }
  }

  public Connection getConnection(){
    try {
      Connection con = DriverManager.getConnection(jdbc.get_url(), jdbc.get_user(), jdbc.get_password());
      return con;
    }
    catch (SQLException e) {
      System.err.println("Fail to Connect DB");
      System.out.println(e.getMessage());
      return null;
    }
  }

  public void returnConnection(Connection conn) {
    try {
      conn.close();
    }
    catch (SQLException e) {
    }
  }
}