import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import db.DBConnectionManager;
import templete.MysqlGlobal;
import templete.OdbcGlobal;
import templete.OracleGlobal;

public class TestDB{
    public static void main(String[] args) throws SQLException {

        // <Bruce: 다양한 DB driver templete을 만들어 놓으면, 간단히 교체 가능하다.
        MysqlGlobal jdbc_mysql=new MysqlGlobal("localhost","3306","test_query");        
        OdbcGlobal jdbc_odbc=new OdbcGlobal("", "", "test");
        OracleGlobal jdbc_oracle=new OracleGlobal("localhost","1521","test");
        // >

        System.out.println("----change ip, port, schema, set login----");
        // <Bruce: set_ip(), set_port(), set_schema() method로 db의 url변경 가능하다>
        // jdbc_mysql.set_ip("127.0.0.1");
        // jdbc_mysql.set_port("3306");
        // jdbc_mysql.set_schema("test");
        
        jdbc_mysql.set_user("root");
        jdbc_mysql.set_password("1111");
        System.out.println(jdbc_mysql.get_url());
        
        //////////////////////TEST CODE//////////////////////
        Connection conn;
        Statement stmt;
        ResultSet result;
        
        // <Bruce: (서버용) DBConnectionManager 을 통해 Connection Pool에 대량의 Connection을 모아 놓고 관리 할 수 있다 >
        DBConnectionManager connManager=new DBConnectionManager(jdbc_mysql);
        conn = connManager.getConnection();
        
        stmt = conn.createStatement();
        result = stmt.executeQuery("SELECT c_id, o_count FROM orders");
        while (result.next()) {
            String name = result.getString(1);
            int count = result.getInt(2);
            System.out.println(
                "아이디: "+name+", 개수: "+count);
        }
            
        stmt.close();
        connManager.returnConnection(conn);
        
        //////////동시에 다양한 db의 connection을 사용할 수 있다///////////
        Connection conn2;        
        jdbc_mysql.set_schema("test_create");
        System.out.println(jdbc_mysql.get_url());
        
        connManager=new DBConnectionManager(jdbc_mysql);
        conn2=connManager.getConnection();
        stmt = conn2.createStatement();
        result = stmt.executeQuery("SELECT title, price FROM book");
        while (result.next()) {
          String title = result.getString(1);
          int price = result.getInt(2);
          System.out.println(
            "타이틀: "+title+", 가격: "+price);
        }
        stmt.close();
        connManager.returnConnection(conn2);
    }
}
