package templete;

public class OdbcGlobal extends JdbcGlobal{
  private final String dbUrl = "jdbc:odbc:%schema";

  public OdbcGlobal(String ip, String port, String schema){
  super(ip, port, schema);
  }

  protected void set_driver(){
    jdbcDriver="sun.jdbc:odbc:jdbcOdbcDriver";
    // jdbcDriver="com.mysql.cj.jdbc.Driver";
  }
  protected void set_url(){
    super.dbUrl=dbUrl.toString();
  }
}

