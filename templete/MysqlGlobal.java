package templete;

public class MysqlGlobal extends JdbcGlobal{
    private final String dbUrl = "jdbc:mysql://%ip:%port/%schema";
      
    public MysqlGlobal(String ip, String port, String schema){
        super(ip, port, schema);
    }

    protected void set_driver(){
        jdbcDriver="com.mysql.cj.jdbc.Driver";
    }
    protected void set_url(){
        super.dbUrl=dbUrl.toString();
    }
    
}
