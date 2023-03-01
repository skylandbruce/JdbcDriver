

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import templete.MysqlGlobal;
import templete.OdbcGlobal;
import templete.OracleGlobal;


public class DBSetting {
  public static void main(String[] args) throws Exception {
    MysqlGlobal jdbc = new MysqlGlobal("localhost", "3306", "test_create");
    jdbc.set_user("root");
    jdbc.set_password("1111");
    
    Class.forName(jdbc.get_driver());
    Connection conn = DriverManager.getConnection(jdbc.get_url(), jdbc.get_user(), jdbc.get_password());
    Statement stmt = conn.createStatement();
    stmt.executeUpdate("create table customer (Objectkey varchar(40), id varchar(12), passwd varchar(12), name varchar(20), reginum char(14), address varchar(100), phone varchar(16), isadmin integer)");
    stmt.executeUpdate("create table book (Objectkey varchar(40), title varchar(50), writer varchar(100), genre varchar(20), publisher varchar(20), price integer, printedyear integer, descriptkey varchar(40), imageurl varchar(30))");
    stmt.executeUpdate("create table purchaseorder (Objectkey varchar(40), buyer varchar(40), item varchar(40), quantity integer, buyingdate datetime, deliverydate datetime, state varchar(20))");
    stmt.executeUpdate("create table bookdescript (Objectkey varchar(40), descript longtext)");
    stmt.close();
    conn.close();
  }
}